class Floor extends FloorBase
{
   var inv;
   var dx;
   var x2;
   var x1;
   var dy;
   var y2;
   var y1;
   var C;
   var invSqrDis;
   var dst;
   var invDst;
   var nx;
   var ny;
   var x;
   var y;
   var hx;
   var hy;
   var LIM;
   var prevLine;
   var nextLine;
   var parent;
   var _lim1;
   var _lim2;
   var type = 0;
   function Floor(_x1, _y1, _x2, _y2, _inv, _lim)
   {
      super(_x1,_y1,_x2,_y2);
      this.inv = _inv;
      this.calculateConstants();
      this.lim = _lim != undefined ? _lim : 0;
   }
   function calculateConstants()
   {
      this.dx = this.x2 - this.x1;
      this.dy = this.y2 - this.y1;
      this.C = this.dy * this.x1 - this.dx * this.y1;
      var _loc2_ = Math.pow(this.dx,2) + Math.pow(this.dy,2);
      this.invSqrDis = 1 / _loc2_;
      this.dst = Math.sqrt(_loc2_);
      this.invDst = 1 / this.dst;
      this.nx = this.dy * this.invDst * (!this.inv ? -1 : 1);
      this.ny = this.dx * this.invDst * (!this.inv ? 1 : -1);
      this.x = this.x1 + this.dx * 0.5;
      this.y = this.y1 + this.dy * 0.5;
      this.hx = Math.abs(this.dx) * 0.5;
      this.hy = Math.abs(this.dy) * 0.5;
      this.LIM = Math.min(0.25,FloorBase.zone / this.dst);
   }
   function addPrevLine(line, extend)
   {
      if(extend)
      {
         switch(this.lim)
         {
            case 0:
               this.lim = 1;
               break;
            case 2:
               this.lim = 3;
         }
      }
      this.prevLine = line.name;
   }
   function addNextLine(line, extend)
   {
      if(extend)
      {
         switch(this.lim)
         {
            case 0:
               this.lim = 2;
               break;
            case 1:
               this.lim = 3;
         }
      }
      this.nextLine = line.name;
   }
   function particle(dot)
   {
      var part = this.parent._parent.attachMovie("particle",Math.random(),this.parent._parent.getNextHighestDepth());
      var _loc4_ = Math.random();
      var _loc3_ = (Math.abs(dot.dx) + Math.abs(dot.dy)) * 0.25;
      part._x = dot.x - (dot.x - dot.vx) * _loc4_;
      part._y = dot.y - (dot.y - dot.vy) * _loc4_;
      part.dx = (- this.nx) * _loc3_;
      part.dy = (- this.ny) * _loc3_;
      part.life = 10;
      part.onEnterFrame = function()
      {
         part._x += part.dx * Math.random();
         part._y += part.dy * Math.random();
         part._xscale = part._yscale = part._alpha = 10 * part.life;
         if(part.life < 0)
         {
            part.removeMovieClip();
         }
         part.life--;
      };
   }
   function colide(dot)
   {
      var _loc6_ = dot.x - this.x1;
      var _loc5_ = dot.y - this.y1;
      var _loc3_ = this.nx * _loc6_ + this.ny * _loc5_;
      var _loc4_ = (_loc6_ * this.dx + _loc5_ * this.dy) * this.invSqrDis;
      if(dot.dx * this.nx + dot.dy * this.ny > 0)
      {
         if(_loc3_ > 0 && _loc3_ < FloorBase.zone && _loc4_ >= this._lim1 && _loc4_ <= this._lim2)
         {
            dot.x -= _loc3_ * this.nx;
            dot.y -= _loc3_ * this.ny;
            dot.vx += this.ny * dot.friction * _loc3_ * (dot.vx >= dot.x ? -1 : 1);
            dot.vy -= this.nx * dot.friction * _loc3_ * (dot.vy >= dot.y ? 1 : -1);
            dot.crash = this;
            return true;
         }
      }
   }
}
