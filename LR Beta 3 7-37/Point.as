class Point
{
   var x;
   var y;
   var dx;
   var dy;
   var vx;
   var vy;
   var friction;
   var crash;
   var active;
   var sx;
   var sy;
   var sdx;
   var sdy;
   var svx;
   var svy;
   var sactive;
   var radius = 0;
   function Point(__x, __y, __fr, __cr, __act)
   {
      this.x = __x;
      this.y = __y;
      this.dx = 0;
      this.dy = 0;
      this.vx = 0;
      this.vy = 0;
      this.friction = __fr;
      this.crash = __cr;
      this.active = __act;
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
      var _loc2_ = this.x;
      var _loc3_ = this.y;
      var _loc4_ = this.dx;
      var _loc6_ = this.dy;
      var _loc5_ = this.vx;
      var _loc7_ = this.vy;
      this.sx = _loc2_;
      this.sy = _loc3_;
      this.sdx = _loc4_;
      this.sdy = _loc6_;
      this.svx = _loc5_;
      this.svy = _loc7_;
      this.sactive = this.active;
   }
   function restore()
   {
      this.x = this.sx;
      this.y = this.sy;
      this.dx = this.sdx;
      this.dy = this.sdy;
      this.vx = this.svx;
      this.vy = this.svy;
      this.active = this.sactive;
   }
}
