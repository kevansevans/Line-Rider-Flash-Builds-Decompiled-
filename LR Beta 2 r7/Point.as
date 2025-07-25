class Point
{
   var x;
   var y;
   var dx;
   var dy;
   var vx;
   var vy;
   var friction;
   var sx;
   var sy;
   var sdx;
   var sdy;
   var svx;
   var svy;
   var airResistance = 1;
   function Point(__x, __y, __fr)
   {
      this.x = __x;
      this.y = __y;
      this.dx = 0;
      this.dy = 0;
      this.vx = 0;
      this.vy = 0;
      this.friction = __fr;
   }
   function verlet(a)
   {
      this.dx = this.x - this.vx + a.x;
      this.dy = this.y - this.vy + a.y;
      this.vx = this.x;
      this.vy = this.y;
      this.x += this.dx;
      this.y += this.dy;
   }
   function savePoint()
   {
      var _loc7_ = this.x;
      var _loc6_ = this.y;
      var _loc5_ = this.dx;
      var _loc3_ = this.dy;
      var _loc4_ = this.vx;
      var _loc2_ = this.vy;
      this.sx = _loc7_;
      this.sy = _loc6_;
      this.sdx = _loc5_;
      this.sdy = _loc3_;
      this.svx = _loc4_;
      this.svy = _loc2_;
   }
   function restore()
   {
      this.x = this.sx;
      this.y = this.sy;
      this.dx = this.sdx;
      this.dy = this.sdy;
      this.vx = this.svx;
      this.vy = this.svy;
   }
}
