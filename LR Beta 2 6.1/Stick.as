class Stick
{
    var a, b, restLength;
    function Stick(_a, _b)
    {
        a = _a;
        b = _b;
        this.getRestLength();
    } // End of the function
    function satisfyDistance()
    {
        var _loc3 = a.x - b.x;
        var _loc2 = a.y - b.y;
        var _loc7 = Math.sqrt(_loc3 * _loc3 + _loc2 * _loc2);
        var _loc6 = (_loc7 - restLength) / _loc7 * 0.500000;
        var _loc5 = _loc3 * _loc6;
        var _loc4 = _loc2 * _loc6;
        a.x = a.x - _loc5;
        a.y = a.y - _loc4;
        b.x = b.x + _loc5;
        b.y = b.y + _loc4;
    } // End of the function
    function getRestLength()
    {
        var _loc3 = a.x - b.x;
        var _loc2 = a.y - b.y;
        restLength = Math.sqrt(_loc3 * _loc3 + _loc2 * _loc2);
    } // End of the function
    function render(target)
    {
        target.moveTo(a.x, a.y);
        target.lineTo(b.x, b.y);
    } // End of the function
} // End of Class
