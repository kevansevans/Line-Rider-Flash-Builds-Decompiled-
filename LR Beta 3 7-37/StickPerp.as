class StickPerp extends Stick
{
   var a;
   var b;
   var c;
   var EDGendurance;
   var restLength;
   var EDGrestLengthPerp;
   function StickPerp(_a, _b, _c, endurance)
   {
      super();
      this.a = _a;
      this.b = _b;
      this.c = _c;
      this.getPerpRestLengths();
      this.EDGendurance = endurance * this.restLength * 0.5;
   }
   function getPerpRestLengths()
   {
      var _loc4_ = this.c.x - this.b.x;
      var _loc5_ = this.c.y - this.b.y;
      var _loc7_;
      var _loc8_;
      var _loc2_ = this.b.x - this.a.x;
      var _loc3_ = this.b.y - this.a.y;
      var _loc6_ = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      _loc2_ /= _loc6_;
      _loc3_ /= _loc6_;
      this.restLength = _loc4_ * _loc2_ + _loc5_ * _loc3_;
      _loc7_ = - _loc3_;
      _loc8_ = _loc2_;
      this.EDGrestLengthPerp = _loc4_ * _loc7_ + _loc5_ * _loc8_;
   }
   function satisfyDistance()
   {
      var _loc2_;
      var _loc3_;
      var _loc5_;
      var _loc6_;
      var _loc4_;
      _loc2_ = this.b.x - this.a.x;
      _loc3_ = this.b.y - this.a.y;
      _loc4_ = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      var _loc7_ = (_loc4_ - this.EDGrestLengthPerp) / _loc4_ * 0.5;
      if(_loc7_ > this.EDGendurance * 2.5)
      {
         false;
         return true;
      }
      _loc2_ /= _loc4_;
      _loc3_ /= _loc4_;
      _loc5_ = - _loc3_;
      _loc6_ = _loc2_;
      this.c.x = this.b.x + _loc2_ * this.restLength + _loc5_ * this.EDGrestLengthPerp;
      this.c.y = this.b.y + _loc3_ * this.restLength + _loc6_ * this.EDGrestLengthPerp;
      return false;
   }
   function render(target, titleMovieMode)
   {
      if(titleMovieMode)
      {
         target.moveTo(this.b.x - target._x,this.b.y - target._y);
         target.lineTo(this.c.x - target._x,this.c.y - target._y);
      }
      else
      {
         target.moveTo(this.b.x,this.b.y);
         target.lineTo(this.c.x,this.c.y);
      }
   }
}
