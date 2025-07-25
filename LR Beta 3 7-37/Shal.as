class Shal extends Stick
{
   var a;
   var b;
   var restLength;
   function Shal(_a, _b)
   {
      super();
      this.a = _a;
      this.b = _b;
      this.getRestLength();
   }
   function satisfyDistance()
   {
      var _loc2_ = this.a.x - this.b.x;
      var _loc3_ = this.a.y - this.b.y;
      var _loc4_ = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      var _loc5_ = (_loc4_ - this.restLength) / _loc4_;
      var _loc6_ = _loc2_ * _loc5_;
      var _loc7_ = _loc3_ * _loc5_;
      this.b.x += _loc6_;
      this.b.y += _loc7_;
   }
}
