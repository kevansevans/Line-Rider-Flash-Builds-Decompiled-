class RepellStick extends Stick
{
    var a, b, getRestLength, restLength;
    function RepellStick(_a, _b)
    {
        super();
        a = _a;
        b = _b;
        this.getRestLength();
    } // End of the function
    function satisfyDistance()
    {
        var _loc3 = a.x - b.x;
        var _loc2 = a.y - b.y;
        var _loc4 = Math.sqrt(_loc3 * _loc3 + _loc2 * _loc2);
        if (_loc4 < restLength)
        {
            var _loc7 = (_loc4 - restLength) / _loc4 * 0.500000;
            var _loc6 = _loc3 * _loc7;
            var _loc5 = _loc2 * _loc7;
            a.x = a.x - _loc6;
            a.y = a.y - _loc5;
            b.x = b.x + _loc6;
            b.y = b.y + _loc5;
        } // end if
    } // End of the function
} // End of Class
