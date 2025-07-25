class ShalAngle extends Stick
{
   var a;
   var b;
   var c;
   var circleRadius;
   var color;
   var EDGrestLengthPerp;
   var EDGrestLength;
   var EDGendurance;
   var dist;
   function ShalAngle(_a, _b, _c, degreesAngleLimit, _circleRadius, _color)
   {
      super();
      this.a = _a;
      this.b = _b;
      this.c = _c;
      this.circleRadius = _circleRadius;
      this.color = _color;
      this.getRestLength();
      var _loc4_ = this.c.x - this.b.x;
      var _loc5_ = this.c.y - this.b.y;
      var _loc3_ = Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_);
      var _loc7_ = Math.sin(degreesAngleLimit);
      var _loc6_ = Math.cos(degreesAngleLimit);
      this.EDGrestLengthPerp = _loc3_ * _loc7_;
      this.EDGrestLength = _loc3_ * _loc6_;
      this.EDGendurance = _loc3_;
   }
   function satisfyDistance()
   {
      var _loc2_;
      var _loc3_;
      var _loc6_;
      var _loc7_;
      var _loc4_;
      var _loc5_;
      var _loc9_;
      var _loc10_;
      var _loc11_;
      var _loc8_;
      _loc4_ = this.b.x - this.c.x;
      _loc5_ = this.b.y - this.c.y;
      this.dist = Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_);
      _loc9_ = (this.dist - this.EDGendurance) / this.dist;
      _loc10_ = _loc4_ * _loc9_;
      _loc11_ = _loc5_ * _loc9_;
      this.c.x += _loc10_;
      this.c.y += _loc11_;
      _loc2_ = this.b.x - this.a.x;
      _loc3_ = this.b.y - this.a.y;
      this.dist = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      _loc2_ /= this.dist;
      _loc3_ /= this.dist;
      _loc6_ = - _loc3_;
      _loc7_ = _loc2_;
      _loc4_ = this.c.x - this.b.x;
      _loc5_ = this.c.y - this.b.y;
      _loc8_ = _loc4_ * _loc6_ + _loc5_ * _loc7_;
      if(_loc8_ < 0)
      {
         if(_loc8_ < - this.EDGrestLengthPerp)
         {
            this.c.x = this.b.x + _loc2_ * this.EDGrestLength + _loc6_ * (- this.EDGrestLengthPerp);
            this.c.y = this.b.y + _loc3_ * this.EDGrestLength + _loc7_ * (- this.EDGrestLengthPerp);
         }
      }
      else if(_loc8_ > this.EDGrestLengthPerp)
      {
         this.c.x = this.b.x + _loc2_ * this.EDGrestLength + _loc6_ * this.EDGrestLengthPerp;
         this.c.y = this.b.y + _loc3_ * this.EDGrestLength + _loc7_ * this.EDGrestLengthPerp;
      }
      return false;
   }
   function render(target, titleMovieMode)
   {
      if(this.circleRadius != 0)
      {
         if(titleMovieMode)
         {
            this.drawCircle(target,(this.b.x + this.c.x) / 2 - target._x,(this.b.y + this.c.y) / 2 - target._y,this.circleRadius);
         }
         else
         {
            this.drawCircle(target,(this.b.x + this.c.x) / 2,(this.b.y + this.c.y) / 2,this.circleRadius);
         }
      }
   }
   function drawCircle(mc, x, y, r)
   {
      mc.moveTo(x + r,y);
      mc.beginFill(0,100);
      mc.curveTo(r + x,y,r + x,-0.414214 * r + y);
      mc.curveTo(0.707107 * r + x,-0.707107 * r + y,0.414214 * r + x,- r + y);
      mc.curveTo(0.707107 * r + x,0.707107 * r + y,r + x,0.414214 * r + y);
      mc.curveTo(x,r + y,0.414214 * r + x,r + y);
      mc.curveTo(-0.707107 * r + x,0.707107 * r + y,-0.414214 * r + x,r + y);
      mc.curveTo(- r + x,y,- r + x,0.414214 * r + y);
      mc.curveTo(-0.707107 * r + x,-0.707107 * r + y,- r + x,-0.414214 * r + y);
      mc.curveTo(x,- r + y,-0.414214 * r + x,- r + y);
      mc.endFill();
   }
}
