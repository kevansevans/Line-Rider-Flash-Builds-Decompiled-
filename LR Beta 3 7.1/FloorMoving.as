class FloorMoving extends Floor
{
    var inv, calculateConstants, __set__lim, currentvx, currentvy, currentdx, currentdy, parent, y1, x1, y2, x2;
    function FloorMoving(_x1, _y1, _x2, _y2, _vx, _vy, _ax, _ay, _inv, _lim)
    {
        super(_x1, _y1, _x2, _y2);
        inv = _inv;
        this.calculateConstants();
        this.__set__lim(_lim == undefined ? (0) : (_lim));
        vx = currentvx = _vx;
        vy = currentvy = _vy;
        ax = _ax;
        ay = _ay;
    } // End of the function
    function updateSegment()
    {
        ++age;
        currentdx = (vx + currentvx) * age + ax * age * age / 2;
        currentdy = (vy + currentvy) * age + ay * age * age / 2;
        parent.clear();
        parent.lineStyle(4 * _root.SCALEDOWN, 0, 100, false, "normal", "round");
        parent.moveTo(x1 + currentdx, y1 + currentdy);
        parent.lineTo(x2 + currentdx, y2 + currentdy);
        return (true);
    } // End of the function
    var type = 6;
    var vx = 0;
    var vy = 0;
    var ax = 0;
    var ay = 0;
    var age = 0;
} // End of Class
