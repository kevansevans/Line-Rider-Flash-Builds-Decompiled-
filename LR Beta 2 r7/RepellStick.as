class RepellStick extends Stick
{
   var a;
   var b;
   var restLength;
   function RepellStick(_a, _b)
   {
      super(_a,_b);
   }
   function satisfyDistance()
   {
      var _loc3_ = this.a.x - this.b.x;
      var _loc2_ = this.a.y - this.b.y;
      var _loc4_ = Math.sqrt(_loc3_ * _loc3_ + _loc2_ * _loc2_);
      var _loc7_;
      var _loc6_;
      var _loc5_;
      if(_loc4_ < this.restLength)
      {
         _loc7_ = (_loc4_ - this.restLength) / _loc4_ * 0.5;
         _loc6_ = _loc3_ * _loc7_;
         _loc5_ = _loc2_ * _loc7_;
         this.a.x -= _loc6_;
         this.a.y -= _loc5_;
         this.b.x += _loc6_;
         this.b.y += _loc5_;
      }
   }
}
