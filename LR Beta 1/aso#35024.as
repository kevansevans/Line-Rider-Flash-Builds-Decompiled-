class aso#35024 extends aso#33632
{
    var a, b, getRestLength, restLength;
    function aso#35024(aso#21233, aso#52570)
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
        var _loc5 = Math.sqrt(_loc3 * _loc3 + _loc2 * _loc2);
        var _loc4 = (_loc5 - restLength) / _loc5;
        var _loc7 = _loc3 * _loc4;
        var _loc6 = _loc2 * _loc4;
        b.x = b.x + _loc7;
        b.y = b.y + _loc6;
    } // End of the function
} // End of Class
