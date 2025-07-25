class FloorInvisible extends Floor
{
   var inv;
   var type = 5;
   function FloorInvisible(_x1, _y1, _x2, _y2, _inv, _lim)
   {
      super(_x1,_y1,_x2,_y2);
      this.inv = _inv;
      this.calculateConstants();
      this.lim = _lim != undefined ? _lim : 0;
   }
}
