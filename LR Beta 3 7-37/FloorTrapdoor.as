class FloorTrapdoor extends FloorBase
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
   var accx;
   var accy;
   var LIM;
   var currentdx;
   var currentdy;
   var prevLine;
   var nextLine;
   var _lim1;
   var _lim2;
   var countDown;
   var name;
   var parent;
   var sridden;
   var shidden;
   var spercent;
   var scurrentdx;
   var scurrentdy;
   var scountDown;
   var sparentalpha;
   static var ACC = 0.1;
   var type = 3;
   var ridden = false;
   var hidden = false;
   var percent = 0;
   var percentStepSize = 1;
   var saved = false;
   static var toss = new TransientObjSimService("FloorTrapdoor",true);
   function FloorTrapdoor(_unitsStepSize, _x1, _y1, _x2, _y2, _inv, _lim)
   {
      super(_x1,_y1,_x2,_y2);
      this.inv = _inv;
      this.calculateConstants(_unitsStepSize);
      this.lim = _lim != undefined ? _lim : 0;
   }
   function calculateConstants(_unitsStepSize)
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
      this.accx = this.ny * FloorTrapdoor.ACC * (!this.inv ? -1 : 1);
      this.accy = this.nx * FloorTrapdoor.ACC * (!this.inv ? 1 : -1);
      this.LIM = Math.min(0.25,FloorBase.zone / this.dst);
      this.percentStepSize = _unitsStepSize / this.dst;
      this.currentdx = this.currentdy = 0;
   }
   function addPrevLine(line, extend)
   {
      if(extend && line.type == 1)
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
      if(extend && line.type == 1)
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
   function colide(dot)
   {
      if(this.hidden)
      {
         return false;
      }
      var _loc4_;
      var _loc5_;
      var _loc3_;
      var _loc6_;
      if(dot.dx * this.nx + dot.dy * this.ny > 0)
      {
         _loc4_ = dot.x + dot.radius * this.nx - (this.x1 + this.currentdx);
         _loc5_ = dot.y + dot.radius * this.ny - (this.y1 + this.currentdy);
         _loc3_ = this.nx * _loc4_ + this.ny * _loc5_;
         if(_loc3_ > 0 && _loc3_ < FloorBase.zone)
         {
            _loc6_ = (_loc4_ * this.dx + _loc5_ * this.dy) * this.invSqrDis;
            if(_loc6_ >= this._lim1 && _loc6_ <= this._lim2)
            {
               dot.x -= _loc3_ * this.nx;
               dot.y -= _loc3_ * this.ny;
               this.markRidden(true);
               return true;
            }
         }
      }
   }
   function markRidden(setCountDown)
   {
      if(!this.ridden)
      {
         this.ridden = true;
         this.currentdx = this.currentdy = 0;
         if(setCountDown)
         {
            this.countDown = 40;
         }
         FloorTrapdoor.toss.addObject(this,this.name);
      }
      if(!setCountDown)
      {
         this.countDown = 0;
      }
   }
   function simUpdate()
   {
      if(this.countDown > 0)
      {
         this.countDown = this.countDown - 1;
         return true;
      }
      var _loc3_;
      var _loc5_;
      var _loc4_;
      var _loc6_;
      var _loc8_;
      var _loc7_;
      if(this.percent < 1)
      {
         _loc3_ = this.x1 + this.currentdx;
         _loc5_ = this.y1 + this.currentdy;
         this.percent = Math.min(1,this.percent + this.percentStepSize);
         this.currentdx = this.percent * (this.x2 - this.x1);
         this.currentdy = this.percent * (this.y2 - this.y1);
         _loc4_ = this.x1 + this.currentdx;
         _loc6_ = this.y1 + this.currentdy;
         _loc8_ = new FloorParticle(_loc3_,_loc5_,_loc4_,_loc6_,0,0,0,0.375,20,true,this.inv);
         this.dx = this.x2 - (this.x1 + this.currentdx);
         this.dy = this.y2 - (this.y1 + this.currentdy);
         _loc7_ = Math.pow(this.dx,2) + Math.pow(this.dy,2);
         this.invSqrDis = 1 / _loc7_;
         this.parent.clear();
         this.parent.lineStyle(4 * _root.SCALEDOWN,0,100,false,"normal","round");
         this.parent.moveTo(this.x1 + this.currentdx,this.y1 + this.currentdy);
         this.parent.lineTo(this.x2,this.y2);
      }
      if(this.percent >= 1)
      {
         this.parent._alpha = 0;
         this.hidden = true;
         if(this.nextLine != undefined)
         {
            _root.lines["line" + this.nextLine].markRidden(false);
         }
         return false;
      }
      return true;
   }
   function simSave()
   {
      this.sridden = this.ridden;
      this.shidden = this.hidden;
      this.spercent = this.percent;
      this.scurrentdx = this.currentdx;
      this.scurrentdy = this.currentdy;
      this.scountDown = this.countDown;
      this.sparentalpha = this.parent._alpha;
      this.saved = true;
   }
   function simRestore()
   {
      var _loc2_;
      if(!this.saved)
      {
         this.simReset();
      }
      else
      {
         this.ridden = this.sridden;
         this.hidden = this.shidden;
         this.percent = this.spercent;
         this.currentdx = this.scurrentdx;
         this.currentdy = this.scurrentdy;
         this.dx = this.x2 - this.x1;
         this.dy = this.y2 - this.y1;
         _loc2_ = Math.pow(this.dx,2) + Math.pow(this.dy,2);
         this.invSqrDis = 1 / _loc2_;
         this.countDown = this.scountDown;
         this.parent._alpha = this.sparentalpha;
      }
   }
   function simReset()
   {
      this.percent = 0;
      this.parent._alpha = 100;
      this.hidden = this.ridden = false;
      this.currentdx = this.currentdy = 0;
      this.dx = this.x2 - this.x1;
      this.dy = this.y2 - this.y1;
      var _loc2_ = Math.pow(this.dx,2) + Math.pow(this.dy,2);
      this.invSqrDis = 1 / _loc2_;
   }
   function simClear()
   {
   }
   function simTrace(index)
   {
      trace(index + ": name=" + this.name + " countDown=" + this.countDown + " ridden=" + this.ridden + " hidden=" + this.hidden + " perecent=" + this.percent + " currentdx=" + this.currentdx + " currentdy=" + this.currentdy);
   }
}
