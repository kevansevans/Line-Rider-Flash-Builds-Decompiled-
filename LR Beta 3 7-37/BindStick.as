class BindStick extends BreakableStick
{
   var a;
   var b;
   var endurance;
   var restLength;
   var riderref;
   function BindStick(_a, _b, _endurance, _rider)
   {
      super();
      this.a = _a;
      this.b = _b;
      this.getRestLength();
      this.endurance = _endurance * this.restLength * 0.5;
      this.riderref = _rider;
   }
   function satisfyDistance()
   {
      var _loc4_ = this.a.x - this.b.x;
      var _loc5_ = this.a.y - this.b.y;
      var _loc6_ = Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_);
      var _loc3_ = (_loc6_ - this.restLength) / _loc6_ * 0.5;
      if(_loc3_ > this.endurance || this.riderref.crash)
      {
         if(!this.riderref.crash)
         {
            this.riderref.setCrash(true,_root.simulation);
         }
         return true;
      }
      var _loc7_ = _loc4_ * _loc3_;
      var _loc8_ = _loc5_ * _loc3_;
      this.a.x -= _loc7_;
      this.a.y -= _loc8_;
      this.b.x += _loc7_;
      this.b.y += _loc8_;
      return false;
   }
}
