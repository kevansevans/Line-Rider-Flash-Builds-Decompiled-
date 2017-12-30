﻿class Point
{
    var x, y, dx, dy, vx, vy, friction, crash, sx, sy, sdx, sdy, svx, svy;
    function Point(__x, __y, __fr, __cr)
    {
        x = __x;
        y = __y;
        dx = 0;
        dy = 0;
        vx = 0;
        vy = 0;
        friction = __fr;
        crash = __cr;
    } // End of the function
    function verlet(a)
    {
        dx = x - vx + a.x;
        dy = y - vy + a.y;
        vx = x;
        vy = y;
        x = x + dx;
        y = y + dy;
    } // End of the function
    function savePoint()
    {
        var _loc2 = x;
        var _loc3 = y;
        var _loc4 = dx;
        var _loc6 = dy;
        var _loc5 = vx;
        var _loc7 = vy;
        sx = _loc2;
        sy = _loc3;
        sdx = _loc4;
        sdy = _loc6;
        svx = _loc5;
        svy = _loc7;
    } // End of the function
    function restore()
    {
        x = sx;
        y = sy;
        dx = sdx;
        dy = sdy;
        vx = svx;
        vy = svy;
    } // End of the function
} // End of Class
