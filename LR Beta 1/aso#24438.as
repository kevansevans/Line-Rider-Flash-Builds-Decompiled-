class aso#24438 extends aso#33632
{
    var a, b, getRestLength, restLength;
    function aso#24438(aso#21233, aso#52570)
    {
        super();
        a = aso#21233;
        b = aso#52570;
        this.getRestLength();
    } // End of the function
    function aso#79731()
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
