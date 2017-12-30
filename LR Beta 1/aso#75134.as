class aso#75134 extends aso#33632
{
    var a, b, getRestLength, restLength, aso#52991;
    function aso#75134(aso#21233, aso#52570, aso#13431)
    {
        super();
        a = aso#21233;
        b = aso#52570;
        this.getRestLength();
        aso#52991 = aso#13431 * restLength;
    } // End of the function
    function aso#79731()
    {
        var _loc3 = a.x - b.x;
        var _loc2 = a.y - b.y;
        var _loc7 = Math.sqrt(_loc3 * _loc3 + _loc2 * _loc2);
        var _loc4 = (_loc7 - restLength) / _loc7 * 0.500000;
        if (_loc4 > aso#52991 * 0.500000)
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
