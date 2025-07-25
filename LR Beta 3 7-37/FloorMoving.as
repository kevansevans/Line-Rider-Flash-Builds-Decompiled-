class FloorMoving extends Floor
{
   var inv;
   var currentvx;
   var currentvy;
   var currentdx;
   var currentdy;
   var parent;
   var x1;
   var y1;
   var x2;
   var y2;
   var type = 6;
   var vx = 0;
   var vy = 0;
   var ax = 0;
   var ay = 0;
   var age = 0;
   function FloorMoving(_x1, _y1, _x2, _y2, _vx, _vy, _ax, _ay, _inv, _lim)
   {
      super(_x1,_y1,_x2,_y2);
      this.inv = _inv;
      this.calculateConstants();
      this.lim = _lim != undefined ? _lim : 0;
      this.vx = this.currentvx = _vx;
      this.vy = this.currentvy = _vy;
      this.ax = _ax;
      this.ay = _ay;
   }
   function updateSegment()
   {
      this.age = this.age + 1;
      this.currentdx = (this.vx + this.currentvx) * this.age + this.ax * this.age * this.age / 2;
      this.currentdy = (this.vy + this.currentvy) * this.age + this.ay * this.age * this.age / 2;
      this.parent.clear();
      this.parent.lineStyle(4 * _root.SCALEDOWN,0,100,false,"normal","round");
      this.parent.moveTo(this.x1 + this.currentdx,this.y1 + this.currentdy);
      this.parent.lineTo(this.x2 + this.currentdx,this.y2 + this.currentdy);
      return true;
   }
}
