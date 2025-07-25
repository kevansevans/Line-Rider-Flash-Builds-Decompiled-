class FloorScenery extends FloorBase
{
   var dx;
   var x2;
   var x1;
   var dy;
   var y2;
   var y1;
   var C;
   var invSqrDis;
   var dst;
   var nx;
   var ny;
   var x;
   var y;
   var hx;
   var hy;
   var type = 2;
   function FloorScenery(_x1, _y1, _x2, _y2)
   {
      super(_x1,_y1,_x2,_y2);
      this.calculateConstants();
   }
   function calculateConstants()
   {
      this.dx = this.x2 - this.x1;
      this.dy = this.y2 - this.y1;
      this.C = this.dy * this.x1 - this.dx * this.y1;
      var _loc3_ = Math.pow(this.dx,2) + Math.pow(this.dy,2);
      this.invSqrDis = 1 / _loc3_;
      this.dst = Math.sqrt(_loc3_);
      var _loc2_ = 1 / this.dst;
      this.nx = (- this.dy) * _loc2_;
      this.ny = this.dx * _loc2_;
      this.x = this.x1 + this.dx * 0.5;
      this.y = this.y1 + this.dy * 0.5;
      this.hx = Math.abs(this.dx) * 0.5;
      this.hy = Math.abs(this.dy) * 0.5;
   }
   function colide(dot)
   {
   }
}
