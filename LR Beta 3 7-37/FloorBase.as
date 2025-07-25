class FloorBase
{
   var x1;
   var y1;
   var x2;
   var y2;
   var grids;
   var _lim1;
   var _lim2;
   var LIM;
   var __lim;
   static var zone = 10;
   function FloorBase(_x1, _y1, _x2, _y2)
   {
      this.x1 = _x1;
      this.y1 = _y1;
      this.x2 = _x2;
      this.y2 = _y2;
      this.grids = [];
   }
   function set lim(input)
   {
      switch(input)
      {
         case 0:
            this._lim1 = 0;
            this._lim2 = 1;
            break;
         case 1:
            this._lim1 = - this.LIM;
            this._lim2 = 1;
            break;
         case 2:
            this._lim1 = 0;
            this._lim2 = 1 + this.LIM;
            break;
         case 3:
            this._lim1 = - this.LIM;
            this._lim2 = 1 + this.LIM;
      }
      this.__lim = input;
      null;
   }
   function get lim()
   {
      return this.__lim;
   }
   function save()
   {
   }
   function restore()
   {
   }
}
