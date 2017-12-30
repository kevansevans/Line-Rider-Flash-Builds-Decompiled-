class BreakableStick extends Stick
{
    var a, b, getRestLength, restLength, endurance;
    function BreakableStick(_a, _b, _endurance)
    {
        super();
        a = _a;
        b = _b;
        this.getRestLength();
        endurance = _endurance * restLength;
    } // End of the function
    function satisfyDistance()
    {
        var _loc3 = a.x - b.x;
        var _loc2 = a.y - b.y;
        var _loc7 = Math.sqrt(_loc3 * _loc3 + _loc2 * _loc2);
        var _loc4 = (_loc7 - restLength) / _loc7 * 0.500000;
        if (_loc4 > endurance * 0.500000)
        {
            false;
            return (true);
        } // end if
        var _loc6 = _loc3 * _loc4;
        var _loc5 = _loc2 * _loc4;
        a.x = a.x - _loc6;
        a.y = a.y - _loc5;
        b.x = b.x + _loc6;
        b.y = b.y + _loc5;
        return (false);
    } // End of the function
} // End of Class
