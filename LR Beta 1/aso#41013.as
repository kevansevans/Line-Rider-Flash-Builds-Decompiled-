class aso#41013 extends Point
{
    var x, y, aso#27643, aso#58980, aso#66361, aso#97698, aso#60372;
    function aso#41013(aso#14823, aso#46160, aso#53541)
    {
        super();
        x = aso#14823;
        y = aso#46160;
        aso#27643 = 0;
        aso#58980 = 0;
        aso#66361 = 0;
        aso#97698 = 0;
        aso#60372 = aso#53541;
    } // End of the function
    function aso#63156(a)
    {
        aso#27643 = (x - aso#66361) * aso#60372 + a.x;
        aso#58980 = (y - aso#97698) * aso#60372 + a.y;
        aso#66361 = x;
        aso#97698 = y;
        x = x + aso#27643;
        y = y + aso#58980;
    } // End of the function
} // End of Class
