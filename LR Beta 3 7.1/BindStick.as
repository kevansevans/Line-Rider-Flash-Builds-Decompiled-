class BindStick extends BreakableStick
{
    var a, b, getRestLength, restLength, endurance, riderref;
    function BindStick(_a, _b, _endurance, _rider)
    {
        super();
        a = _a;
        b = _b;
        this.getRestLength();
        endurance = _endurance * restLength * 0.500000;
        riderref = _rider;
    } // End of the function
    function satisfyDistance()
    {
        var _loc4 = a.x - b.x;
        var _loc5 = a.y - b.y;
        var _loc6 = Math.sqrt(_loc4 * _loc4 + _loc5 * _loc5);
        var _loc3 = (_loc6 - restLength) / _loc6 * 0.500000;
        if (_loc3 > endurance || riderref.crash)
        {
            if (!riderref.crash)
            {
                riderref.setCrash(true, _root.simulation);
            } // end if
            return (true);
        } // end if
        var _loc7 = _loc4 * _loc3;
        var _loc8 = _loc5 * _loc3;
        a.x = a.x - _loc7;
        a.y = a.y - _loc8;
        b.x = b.x + _loc7;
        b.y = b.y + _loc8;
        return (false);
    } // End of the function
} // End of Class
