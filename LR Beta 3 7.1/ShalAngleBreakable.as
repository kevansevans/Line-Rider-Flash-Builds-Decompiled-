class ShalAngleBreakable extends Stick
{
    var a, b, c, circleRadius, color, getRestLength, EDGrestLengthPerp, EDGrestLength, EDGendurance, dist;
    function ShalAngleBreakable(_a, _b, _c, degreesAngleLimit, _circleRadius, _color)
    {
        super();
        a = _a;
        b = _b;
        c = _c;
        circleRadius = _circleRadius;
        color = _color;
        this.getRestLength();
        var _loc4 = c.x - b.x;
        var _loc5 = c.y - b.y;
        var _loc3 = Math.sqrt(_loc4 * _loc4 + _loc5 * _loc5);
        var _loc7 = Math.sin(degreesAngleLimit);
        var _loc6 = Math.cos(degreesAngleLimit);
        EDGrestLengthPerp = _loc3 * _loc7;
        EDGrestLength = _loc3 * _loc6;
        EDGendurance = _loc3;
    } // End of the function
    function satisfyDistance()
    {
        if (broken)
        {
            return (true);
        } // end if
        var _loc2;
        var _loc3;
        var _loc6;
        var _loc7;
        var _loc4;
        var _loc5;
        var _loc8;
        var _loc10;
        var _loc11;
        var _loc9;
        _loc4 = b.x - c.x;
        _loc5 = b.y - c.y;
        dist = Math.sqrt(_loc4 * _loc4 + _loc5 * _loc5);
        _loc8 = (dist - EDGendurance) / dist;
        if (_loc8 > EDGendurance * 0.100000)
        {
            broken = true;
            return (true);
        } // end if
        _loc10 = _loc4 * _loc8;
        _loc11 = _loc5 * _loc8;
        c.x = c.x + _loc10;
        c.y = c.y + _loc11;
        _loc2 = b.x - a.x;
        _loc3 = b.y - a.y;
        dist = Math.sqrt(_loc2 * _loc2 + _loc3 * _loc3);
        _loc2 = _loc2 / dist;
        _loc3 = _loc3 / dist;
        _loc6 = -_loc3;
        _loc7 = _loc2;
        _loc4 = c.x - b.x;
        _loc5 = c.y - b.y;
        _loc9 = _loc4 * _loc6 + _loc5 * _loc7;
        if (_loc9 < 0)
        {
            if (_loc9 < -EDGrestLengthPerp)
            {
                c.x = b.x + _loc2 * EDGrestLength + _loc6 * -EDGrestLengthPerp;
                c.y = b.y + _loc3 * EDGrestLength + _loc7 * -EDGrestLengthPerp;
            } // end if
        }
        else if (_loc9 > EDGrestLengthPerp)
        {
            c.x = b.x + _loc2 * EDGrestLength + _loc6 * EDGrestLengthPerp;
            c.y = b.y + _loc3 * EDGrestLength + _loc7 * EDGrestLengthPerp;
        } // end else if
        return (false);
    } // End of the function
    function render(target, titleMovieMode)
    {
        if (circleRadius != 0)
        {
            if (titleMovieMode)
            {
                this.drawCircle(target, (b.x + c.x) / 2 - target._x, (b.y + c.y) / 2 - target._y, circleRadius);
            }
            else
            {
                this.drawCircle(target, (b.x + c.x) / 2, (b.y + c.y) / 2, circleRadius);
            } // end if
        } // end else if
    } // End of the function
    function drawCircle(mc, x, y, r)
    {
        mc.moveTo(x + r, y);
        mc.beginFill(0, 100);
        mc.curveTo(r + x, y, r + x, -0.414214 * r + y);
        mc.curveTo(0.707107 * r + x, -0.707107 * r + y, 0.414214 * r + x, -r + y);
        mc.curveTo(0.707107 * r + x, 0.707107 * r + y, r + x, 0.414214 * r + y);
        mc.curveTo(x, r + y, 0.414214 * r + x, r + y);
        mc.curveTo(-0.707107 * r + x, 0.707107 * r + y, -0.414214 * r + x, r + y);
        mc.curveTo(-r + x, y, -r + x, 0.414214 * r + y);
        mc.curveTo(-0.707107 * r + x, -0.707107 * r + y, -r + x, -0.414214 * r + y);
        mc.curveTo(x, -r + y, -0.414214 * r + x, -r + y);
        mc.endFill();
    } // End of the function
    var broken = false;
} // End of Class
