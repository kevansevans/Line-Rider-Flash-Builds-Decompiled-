class FloorSlow extends FloorAcc
{
    var inv, calculateConstants, __set__lim, nx, ny, x1, y1, dx, dy, invSqrDis, _lim1, _lim2;
    function FloorSlow(_x1, _y1, _x2, _y2, _inv, _lim)
    {
        super(_x1, _y1, _x2, _y2);
        inv = _inv;
        this.calculateConstants();
        this.__set__lim(_lim == undefined ? (0) : (_lim));
    } // End of the function
    function colide(dot)
    {
        if (dot.dx * nx + dot.dy * ny > 0)
        {
            var _loc4 = dot.x + dot.radius * nx - x1;
            var _loc5 = dot.y + dot.radius * ny - y1;
            var _loc3 = nx * _loc4 + ny * _loc5;
            if (_loc3 > 0 && _loc3 < FloorBase.zone)
            {
                var _loc6 = (_loc4 * dx + _loc5 * dy) * invSqrDis;
                if (_loc6 >= _lim1 && _loc6 <= _lim2)
                {
                    dot.x = dot.x - _loc3 * nx;
                    dot.y = dot.y - _loc3 * ny;
                    dot.vx = dot.vx - slowBy * ny * FloorAcc.ACC * (dot.vx > dot.x ? (1) : (-1));
                    dot.vy = dot.vy + slowBy * nx * FloorAcc.ACC * (dot.vy > dot.y ? (-1) : (1));
                    return (true);
                } // end if
            } // end if
        } // end if
    } // End of the function
    var type = 4;
    var slowBy = 0.300000;
} // End of Class
