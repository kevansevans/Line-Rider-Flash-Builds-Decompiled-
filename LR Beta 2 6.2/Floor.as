class Floor extends FloorBase
{
    var inv, __set__lim, x2, x1, dx, y2, y1, dy, C, invSqrDis, dst, invDst, nx, ny, x, y, hx, hy, LIM, __get__lim, prevLine, nextLine, _lim1, _lim2;
    function Floor(_x1, _y1, _x2, _y2, _inv, _lim)
    {
        super(_x1, _y1, _x2, _y2);
        inv = _inv;
        this.calculateConstants();
        this.__set__lim(_lim == undefined ? (0) : (_lim));
    } // End of the function
    function calculateConstants()
    {
        dx = x2 - x1;
        dy = y2 - y1;
        C = dy * x1 - dx * y1;
        var _loc2 = Math.pow(dx, 2) + Math.pow(dy, 2);
        invSqrDis = 1 / _loc2;
        dst = Math.sqrt(_loc2);
        invDst = 1 / dst;
        nx = dy * invDst * (inv ? (1) : (-1));
        ny = dx * invDst * (inv ? (-1) : (1));
        x = x1 + dx * 0.500000;
        y = y1 + dy * 0.500000;
        hx = Math.abs(dx) * 0.500000;
        hy = Math.abs(dy) * 0.500000;
        LIM = Math.min(0.250000, FloorBase.zone / dst);
    } // End of the function
    function addPrevLine(line, extend)
    {
        if (extend)
        {
            switch (this.__get__lim())
            {
                case 0:
                {
                    this.__set__lim(1);
                    break;
                } 
                case 2:
                {
                    this.__set__lim(3);
                    break;
                } 
            } // End of switch
        } // end if
        prevLine = line.name;
    } // End of the function
    function addNextLine(line, extend)
    {
        if (extend)
        {
            switch (this.__get__lim())
            {
                case 0:
                {
                    this.__set__lim(2);
                    break;
                } 
                case 1:
                {
                    this.__set__lim(3);
                    break;
                } 
            } // End of switch
        } // end if
        nextLine = line.name;
    } // End of the function
    function colide(dot)
    {
        var _loc6 = dot.x - x1;
        var _loc5 = dot.y - y1;
        var _loc3 = nx * _loc6 + ny * _loc5;
        var _loc4 = (_loc6 * dx + _loc5 * dy) * invSqrDis;
        if (dot.dx * nx + dot.dy * ny > 0)
        {
            if (_loc3 > 0 && _loc3 < FloorBase.zone && _loc4 >= _lim1 && _loc4 <= _lim2)
            {
                dot.x = dot.x - _loc3 * nx;
                dot.y = dot.y - _loc3 * ny;
                dot.vx = dot.vx + ny * dot.friction * _loc3 * (dot.vx < dot.x ? (1) : (-1));
                dot.vy = dot.vy - nx * dot.friction * _loc3 * (dot.vy < dot.y ? (-1) : (1));
                return (true);
            } // end if
        } // end if
    } // End of the function
    var type = 0;
} // End of Class
