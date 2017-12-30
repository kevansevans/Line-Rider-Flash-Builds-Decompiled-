class FloorInvisible extends Floor
{
    var inv, calculateConstants, __set__lim;
    function FloorInvisible(_x1, _y1, _x2, _y2, _inv, _lim)
    {
        super(_x1, _y1, _x2, _y2);
        inv = _inv;
        this.calculateConstants();
        this.__set__lim(_lim == undefined ? (0) : (_lim));
    } // End of the function
    var type = 5;
} // End of Class
