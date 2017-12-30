class mx.controls.HScrollBar extends mx.controls.scrollClasses.ScrollBar
{
    var aso#37808, aso#69145, _xscale, _rotation, __width, scrollIt, __get__virtualHeight;
    function HScrollBar()
    {
        super();
    } // End of the function
    function getMinWidth(Void)
    {
        return (aso#37808);
    } // End of the function
    function getMinHeight(Void)
    {
        return (aso#69145);
    } // End of the function
    function init(Void)
    {
        super.init();
        _xscale = -100;
        _rotation = -90;
    } // End of the function
    function get virtualHeight()
    {
        return (__width);
    } // End of the function
    function isScrollBarKey(k)
    {
        if (k == 37)
        {
            this.scrollIt("aso#48394", -1);
            return (true);
        }
        else if (k == 39)
        {
            this.scrollIt("aso#48394", 1);
            return (true);
        } // end else if
        return (super.isScrollBarKey(k));
    } // End of the function
    static var symbolName = "HScrollBar";
    static var symbolOwner = mx.core.UIComponent;
    static var version = "2.0.2.126";
    var className = "HScrollBar";
    var minusMode = "Left";
    var plusMode = "Right";
    var minMode = "AtLeft";
    var maxMode = "AtRight";
} // End of Class
