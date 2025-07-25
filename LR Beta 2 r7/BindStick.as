class BindStick extends Stick
{
   var endurance;
   var restLength;
   var a;
   var b;
   static var crash;
   function BindStick(_a, _b, _endurance)
   {
      super(_a,_b);
      this.endurance = _endurance * this.restLength * 0.5;
   }
   function satisfyDistance()
   {
      var _loc3_;
      var _loc2_;
      var _loc7_;
      var _loc4_;
      var _loc6_;
      var _loc5_;
      if(!BindStick.crash)
      {
         _loc3_ = this.a.x - this.b.x;
         _loc2_ = this.a.y - this.b.y;
         _loc7_ = Math.sqrt(_loc3_ * _loc3_ + _loc2_ * _loc2_);
         _loc4_ = (_loc7_ - this.restLength) / _loc7_ * 0.5;
         if(_loc4_ > this.endurance)
         {
            BindStick.crash = true;
            return undefined;
         }
         _loc6_ = _loc3_ * _loc4_;
         _loc5_ = _loc2_ * _loc4_;
         this.a.x -= _loc6_;
         this.a.y -= _loc5_;
         this.b.x += _loc6_;
         this.b.y += _loc5_;
      }
   }
}
