class StickPerp extends Stick
{
    var a, b, c, restLength, EDGendurance, EDGrestLengthPerp;
    function StickPerp(_a, _b, _c, endurance)
    {
        super();
        a = _a;
        b = _b;
        c = _c;
        this.getPerpRestLengths();
        EDGendurance = endurance * restLength * 0.500000;
    } // End of the function
    function getPerpRestLengths()
    {
        var _loc4 = c.x - b.x;
        var _loc5 = c.y - b.y;
        var _loc7;
        var _loc8;
        var _loc2 = b.x - a.x;
        var _loc3 = b.y - a.y;
        var _loc6 = Math.sqrt(_loc2 * _loc2 + _loc3 * _loc3);
        _loc2 = _loc2 / _loc6;
        _loc3 = _loc3 / _loc6;
        restLength = _loc4 * _loc2 + _loc5 * _loc3;
        _loc7 = -_loc3;
        _loc8 = _loc2;
        EDGrestLengthPerp = _loc4 * _loc7 + _loc5 * _loc8;
    } // End of the function
    function satisfyDistance()
    {
        var _loc2;
        var _loc3;
        var _loc5;
        var _loc6;
        var _loc4;
        _loc2 = b.x - a.x;
        _loc3 = b.y - a.y;
        _loc4 = Math.sqrt(_loc2 * _loc2 + _loc3 * _loc3);
        var _loc7 = (_loc4 - EDGrestLengthPerp) / _loc4 * 0.500000;
        if (_loc7 > EDGendurance * 2.500000)
        {
            false;
            return (true);
        } // end if
        _loc2 = _loc2 / _loc4;
        _loc3 = _loc3 / _loc4;
        _loc5 = -_loc3;
        _loc6 = _loc2;
        c.x = b.x + _loc2 * restLength + _loc5 * EDGrestLengthPerp;
        c.y = b.y + _loc3 * restLength + _loc6 * EDGrestLengthPerp;
        return (false);
    } // End of the function
    function render(target, titleMovieMode)
    {
        if (titleMovieMode)
        {
            target.moveTo(b.x - target._x, b.y - target._y);
            target.lineTo(c.x - target._x, c.y - target._y);
        }
        else
        {
            target.moveTo(b.x, b.y);
            target.lineTo(c.x, c.y);
        } // end else if
    } // End of the function
} // End of Class
