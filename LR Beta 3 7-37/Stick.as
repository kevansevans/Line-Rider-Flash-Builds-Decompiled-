class Stick
{
   var a;
   var b;
   var restLength;
   function Stick(_a, _b)
   {
      this.a = _a;
      this.b = _b;
      this.getRestLength();
   }
   function satisfyDistance()
   {
      var _loc2_ = this.a.x - this.b.x;
      var _loc3_ = this.a.y - this.b.y;
      var _loc4_ = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      var _loc5_ = (_loc4_ - this.restLength) / _loc4_ * 0.5;
      var _loc6_ = _loc2_ * _loc5_;
      var _loc7_ = _loc3_ * _loc5_;
      this.a.x -= _loc6_;
      this.a.y -= _loc7_;
      this.b.x += _loc6_;
      this.b.y += _loc7_;
   }
   function getRestLength()
   {
      var _loc2_ = this.a.x - this.b.x;
      var _loc3_ = this.a.y - this.b.y;
      this.restLength = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
   }
   function render(target, titleMovieMode)
   {
      if(titleMovieMode)
      {
         target.moveTo(this.a.x - target._x,this.a.y - target._y);
         target.lineTo(this.b.x - target._x,this.b.y - target._y);
      }
      else
      {
         target.moveTo(this.a.x,this.a.y);
         target.lineTo(this.b.x,this.b.y);
      }
   }
}
