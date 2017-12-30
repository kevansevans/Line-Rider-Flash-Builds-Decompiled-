class aso#99090
{
    var aso#29035, aso#73742, aso#70537, aso#01874, aso#40171, aso#27643, aso#58980, C, invSqrDis, aso#08834, aso#61764, aso#93101, x, y, aso#07863, aso#39200;
    static var aso#83486;
    function aso#99090(aso#41563, aso#04237, aso#72900, aso#35574, _lim)
    {
        aso#29035 = aso#41563;
        aso#73742 = aso#04237;
        aso#70537 = aso#72900;
        aso#01874 = aso#35574;
        aso#40171 = _lim;
        this.aso#00061();
    } // End of the function
    function aso#00061()
    {
        aso#27643 = aso#70537 - aso#29035;
        aso#58980 = aso#01874 - aso#73742;
        C = aso#58980 * aso#29035 - aso#27643 * aso#73742;
        var _loc2 = Math.pow(aso#27643, 2) + Math.pow(aso#58980, 2);
        invSqrDis = 1 / _loc2;
        aso#08834 = Math.sqrt(_loc2);
        var _loc3 = 1 / aso#08834;
        aso#61764 = -aso#58980 * _loc3;
        aso#93101 = aso#27643 * _loc3;
        x = aso#29035 + aso#27643 * 0.500000;
        y = aso#73742 + aso#58980 * 0.500000;
        aso#07863 = Math.abs(aso#27643) * 0.500000;
        aso#39200 = Math.abs(aso#58980) * 0.500000;
    } // End of the function
    function draw(target)
    {
        target.lineStyle(1, 0, 100);
        target.moveTo(aso#29035, aso#73742);
        target.lineTo(aso#70537, aso#01874);
    } // End of the function
    function aso#26801(aso#66911)
    {
        var _loc6 = aso#66911.x - aso#29035;
        var _loc5 = aso#66911.y - aso#73742;
        var _loc3 = aso#61764 * _loc6 + aso#93101 * _loc5;
        var _loc4 = (_loc6 * aso#27643 + _loc5 * aso#58980) * invSqrDis;
        if (aso#66911.aso#27643 * aso#61764 + aso#66911.aso#58980 * aso#93101 > 0)
        {
            if (_loc3 > 0 && _loc3 < aso#99090.aso#83486 && _loc4 >= aso#40171 && _loc4 <= 1)
            {
                aso#66911.x = aso#66911.x - _loc3 * aso#61764;
                aso#66911.y = aso#66911.y - _loc3 * aso#93101;
                aso#66911.aso#66361 = aso#66911.aso#66361 + aso#93101 * aso#66911.aso#61343 * _loc3 * (aso#66911.aso#66361 < aso#66911.x ? (1) : (-1));
                aso#66911.aso#97698 = aso#66911.aso#97698 - aso#61764 * aso#66911.aso#61343 * _loc3 * (aso#66911.aso#97698 < aso#66911.y ? (-1) : (1));
                return (true);
            } // end if
        } // end if
    } // End of the function
    static var blood = [];
} // End of Class
