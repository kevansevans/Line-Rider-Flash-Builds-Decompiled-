class FloorSlow extends FloorAcc
{
   var inv;
   var nx;
   var ny;
   var x1;
   var y1;
   var dx;
   var dy;
   var invSqrDis;
   var _lim1;
   var _lim2;
   var type = 4;
   var slowBy = 0.3;
   function FloorSlow(_x1, _y1, _x2, _y2, _inv, _lim)
   {
      super(_x1,_y1,_x2,_y2);
      this.inv = _inv;
      this.calculateConstants();
      this.lim = _lim != undefined ? _lim : 0;
   }
   function colide(dot)
   {
      var _loc4_;
      var _loc5_;
      var _loc3_;
      var _loc6_;
      if(dot.dx * this.nx + dot.dy * this.ny > 0)
      {
         _loc4_ = dot.x + dot.radius * this.nx - this.x1;
         _loc5_ = dot.y + dot.radius * this.ny - this.y1;
         _loc3_ = this.nx * _loc4_ + this.ny * _loc5_;
         if(_loc3_ > 0 && _loc3_ < FloorBase.zone)
         {
            _loc6_ = (_loc4_ * this.dx + _loc5_ * this.dy) * this.invSqrDis;
            if(_loc6_ >= this._lim1 && _loc6_ <= this._lim2)
            {
               dot.x -= _loc3_ * this.nx;
               dot.y -= _loc3_ * this.ny;
               dot.vx -= this.slowBy * this.ny * FloorAcc.ACC * (dot.vx <= dot.x ? -1 : 1);
               dot.vy += this.slowBy * this.nx * FloorAcc.ACC * (dot.vy <= dot.y ? 1 : -1);
               return true;
            }
         }
      }
   }
}
