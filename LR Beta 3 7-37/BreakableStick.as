class BreakableStick extends Stick
{
   var a;
   var b;
   var endurance;
   var restLength;
   function BreakableStick(_a, _b, _endurance)
   {
      super();
      this.a = _a;
      this.b = _b;
      this.getRestLength();
      this.endurance = _endurance * this.restLength;
   }
   function satisfyDistance()
   {
      var _loc3_ = this.a.x - this.b.x;
      var _loc4_ = this.a.y - this.b.y;
      var _loc5_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
      var _loc2_ = (_loc5_ - this.restLength) / _loc5_ * 0.5;
      if(_loc2_ > this.endurance * 0.5)
      {
         false;
         return true;
      }
      var _loc6_ = _loc3_ * _loc2_;
      var _loc7_ = _loc4_ * _loc2_;
      this.a.x -= _loc6_;
      this.a.y -= _loc7_;
      this.b.x += _loc6_;
      this.b.y += _loc7_;
      return false;
   }
}
