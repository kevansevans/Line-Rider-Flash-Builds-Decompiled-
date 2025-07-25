class FloorParticle extends FloorMoving
{
   var inv;
   var name;
   var mc;
   var parent;
   var currentdx;
   var currentvx;
   var currentdy;
   var currentvy;
   var sage;
   var scurrentdx;
   var scurrentdy;
   var x1;
   var y1;
   var x2;
   var y2;
   var type = 7;
   var life = 0;
   var fade = false;
   var saved = false;
   static var toss = new TransientObjSimService("FloorParticle",true);
   static var id = 0;
   function FloorParticle(_x1, _y1, _x2, _y2, _vx, _vy, _ax, _ay, _life, _fade, _inv, _lim)
   {
      super(_x1,_y1,_x2,_y2,_vx,_vy,_ax,_ay);
      this.inv = _inv;
      this.calculateConstants();
      this.lim = _lim != undefined ? _lim : 0;
      this.life = _life;
      this.fade = _fade;
      this.name = "fp" + FloorParticle.id;
      this.mc = _root.tla.createEmptyMovieClip(this.name,_root.tla.getNextHighestDepth());
      this.parent = this.mc;
      this.renderLine();
      FloorParticle.toss.addObject(this,FloorParticle.id);
      FloorParticle.id = ++FloorParticle.id;
   }
   function simUpdate()
   {
      this.age = this.age + 1;
      this.currentdx = (this.vx + this.currentvx) * this.age + this.ax * this.age * this.age / 2;
      this.currentdy = (this.vy + this.currentvy) * this.age + this.ay * this.age * this.age / 2;
      if(this.age == this.life)
      {
         if(!this.saved)
         {
            this.simClear();
         }
         else
         {
            this.parent.clear();
         }
         return false;
      }
      this.renderLine();
      return true;
   }
   function simSave()
   {
      this.saved = true;
      this.sage = this.age;
      this.scurrentdx = this.currentdx;
      this.scurrentdy = this.currentdy;
   }
   function simRestore()
   {
      if(this.saved)
      {
         this.parent.clear();
         this.age = this.sage;
         this.currentdx = this.scurrentdx;
         this.currentdy = this.scurrentdy;
         this.renderLine();
      }
      else
      {
         this.simClear();
      }
   }
   function simReset()
   {
      this.parent.clear();
      if(!this.saved)
      {
         this.simClear();
      }
   }
   function simClear()
   {
      this.parent.clear();
      _root.tla[this.name].removeMovieClip();
      false;
   }
   function simTrace(index)
   {
      trace(index + ":" + "saved=" + this.saved + " age=" + this.age + ", fade=" + this.fade + ", currentdx=" + this.currentdx + ", currentdy=" + this.currentdy + ", sage=" + this.sage + ", scurrentdx=" + this.scurrentdx + ", scurrentdy=" + this.currentdy);
   }
   function renderLine()
   {
      this.parent.clear();
      this.parent.lineStyle(4 * _root.SCALEDOWN,0,100,false,"normal","round");
      if(this.fade)
      {
         this.parent.lineStyle(4 * _root.SCALEDOWN,0,100 * (1 - this.age / this.life),false,"normal","round");
      }
      this.parent.moveTo(this.x1 + this.currentdx,this.y1 + this.currentdy);
      this.parent.lineTo(this.x2 + this.currentdx,this.y2 + this.currentdy);
   }
}
