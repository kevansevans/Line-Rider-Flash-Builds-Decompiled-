class RepellStick extends Stick
{
   var a;
   var b;
   var restLength;
   function RepellStick(_a, _b)
   {
      super();
      this.a = _a;
      this.b = _b;
      this.getRestLength();
   }
   function satisfyDistance()
   {
      var _loc3_ = this.a.x - this.b.x;
      var _loc4_ = this.a.y - this.b.y;
      var _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
      var _loc5_;
      var _loc6_;
      var _loc7_;
      if(_loc2_ < this.restLength)
      {
         _loc5_ = (_loc2_ - this.restLength) / _loc2_ * 0.5;
         _loc6_ = _loc3_ * _loc5_;
         _loc7_ = _loc4_ * _loc5_;
         this.a.x -= _loc6_;
         this.a.y -= _loc7_;
         this.b.x += _loc6_;
         this.b.y += _loc7_;
      }
   }
}
