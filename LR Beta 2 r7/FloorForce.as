class FloorForce extends FloorBase
{
   var inv;
   var dx;
   var x2;
   var x1;
   var dy;
   var y2;
   var y1;
   var C;
   var invSqrDis;
   var dst;
   var invDst;
   var nx;
   var ny;
   var x;
   var y;
   var hx;
   var hy;
   var accx;
   var accy;
   var LIM;
   static var fieldWidth = 20;
   static var ACC = 0.03;
   var type = 3;
   function FloorForce(_x1, _y1, _x2, _y2, _inv, _lim)
   {
      super(_x1,_y1,_x2,_y2);
      this.inv = _inv;
      this.calculateConstants();
      this.lim = _lim != undefined ? _lim : 0;
   }
   function calculateConstants()
   {
      this.dx = this.x2 - this.x1;
      this.dy = this.y2 - this.y1;
      this.C = this.dy * this.x1 - this.dx * this.y1;
      var _loc2_ = Math.pow(this.dx,2) + Math.pow(this.dy,2);
      this.invSqrDis = 1 / _loc2_;
      this.dst = Math.sqrt(_loc2_);
      this.invDst = 1 / this.dst;
      this.nx = this.dy * this.invDst * (!this.inv ? -1 : 1);
      this.ny = this.dx * this.invDst * (!this.inv ? 1 : -1);
      this.x = this.x1 + this.dx * 0.5;
      this.y = this.y1 + this.dy * 0.5;
      this.hx = Math.abs(this.dx) * 0.5;
      this.hy = Math.abs(this.dy) * 0.5;
      this.accx = this.dx * this.invDst * FloorForce.ACC;
      this.accy = this.dy * this.invDst * FloorForce.ACC;
      this.LIM = Math.min(0.25,FloorBase.zone / this.dst);
   }
   function colide(dot)
   {
      var _loc6_ = dot.x - this.x1;
      var _loc5_ = dot.y - this.y1;
      var _loc7_ = Math.abs(this.nx * _loc6_ + this.ny * _loc5_);
      var _loc3_ = (_loc6_ * this.dx + _loc5_ * this.dy) * this.invSqrDis;
      var _loc4_;
      if(_loc7_ < FloorForce.fieldWidth && _loc3_ >= 0 && _loc3_ <= 1 + (dot.airResistance - 1) * 0.1)
      {
         _loc4_ = dot.airResistance * (dot.airResistance <= 1 ? 1 - _loc3_ : 2 - _loc3_);
         dot.vx -= this.accx * _loc4_;
         dot.vy -= this.accy * _loc4_;
         if(dot.airResistance > 1)
         {
            dot.dx = _loc4_;
            dot.dy = _loc4_;
         }
         return true;
      }
   }
}
