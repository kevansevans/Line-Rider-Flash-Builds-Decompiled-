class mx.core.ScrollView extends mx.core.View
{
    var __width, __get__hScrollPolicy, __get__vScrollPolicy, __get__hPosition, hScroller, __get__vPosition, vScroller, __maxHPosition, propsInited, scrollAreaChanged, specialHScrollCase, createObject, viewableColumns, __height, viewableRows, oldRndUp, __viewMetrics, owner, enabled, border_mc, aso#39621, __get__height, invLayout, aso#67753, _parent, _loc5, dispatchEvent, __set__hPosition, __set__hScrollPolicy, __set__maxHPosition, __set__vPosition, __set__vScrollPolicy;
    function ScrollView()
    {
        super();
    } // End of the function
    function getHScrollPolicy(Void)
    {
        return (__hScrollPolicy);
    } // End of the function
    function setHScrollPolicy(policy)
    {
        __hScrollPolicy = policy.toLowerCase();
        if (__width == undefined)
        {
            return;
        } // end if
        this.setScrollProperties(numberOfCols, columnWidth, rowC, rowH, heightPadding, widthPadding);
    } // End of the function
    function get hScrollPolicy()
    {
        return (this.getHScrollPolicy());
    } // End of the function
    function set hScrollPolicy(policy)
    {
        this.setHScrollPolicy(policy);
        //return (this.hScrollPolicy());
        null;
    } // End of the function
    function getVScrollPolicy(Void)
    {
        return (__vScrollPolicy);
    } // End of the function
    function setVScrollPolicy(policy)
    {
        __vScrollPolicy = policy.toLowerCase();
        if (__width == undefined)
        {
            return;
        } // end if
        this.setScrollProperties(numberOfCols, columnWidth, rowC, rowH, heightPadding, widthPadding);
    } // End of the function
    function get vScrollPolicy()
    {
        return (this.getVScrollPolicy());
    } // End of the function
    function set vScrollPolicy(policy)
    {
        this.setVScrollPolicy(policy);
        //return (this.vScrollPolicy());
        null;
    } // End of the function
    function get hPosition()
    {
        return (this.getHPosition());
    } // End of the function
    function set hPosition(aso#09676)
    {
        this.setHPosition(aso#09676);
        //return (this.hPosition());
        null;
    } // End of the function
    function getHPosition(Void)
    {
        return (__hPosition);
    } // End of the function
    function setHPosition(aso#09676)
    {
        hScroller.__set__scrollPosition(aso#09676);
        __hPosition = aso#09676;
    } // End of the function
    function get vPosition()
    {
        return (this.getVPosition());
    } // End of the function
    function set vPosition(aso#09676)
    {
        this.setVPosition(aso#09676);
        //return (this.vPosition());
        null;
    } // End of the function
    function getVPosition(Void)
    {
        return (__vPosition);
    } // End of the function
    function setVPosition(aso#09676)
    {
        vScroller.__set__scrollPosition(aso#09676);
        __vPosition = aso#09676;
    } // End of the function
    function aso#68724()
    {
        var _loc2 = vScroller.aso#64969;
        return (_loc2 == undefined ? (0) : (_loc2));
    } // End of the function
    function aso#33211()
    {
        return (this.getMaxHPosition());
    } // End of the function
    function set maxHPosition(aso#09676)
    {
        this.setMaxHPosition(aso#09676);
        return (this.aso#33211());
        null;
    } // End of the function
    function getMaxHPosition(Void)
    {
        if (__maxHPosition != undefined)
        {
            return (__maxHPosition);
        } // end if
        var _loc2 = hScroller.aso#64969;
        return (_loc2 == undefined ? (0) : (_loc2));
    } // End of the function
    function setMaxHPosition(aso#09676)
    {
        __maxHPosition = aso#09676;
    } // End of the function
    function setScrollProperties(colCount, colWidth, rwCount, rwHeight, hPadding, wPadding)
    {
        var _loc3 = this.getViewMetrics();
        if (hPadding == undefined)
        {
            hPadding = 0;
        } // end if
        if (wPadding == undefined)
        {
            wPadding = 0;
        } // end if
        propsInited = true;
        delete this.scrollAreaChanged;
        heightPadding = hPadding;
        widthPadding = wPadding;
        if (colWidth == 0)
        {
            colWidth = 1;
        } // end if
        if (rwHeight == 0)
        {
            rwHeight = 1;
        } // end if
        var _loc5 = Math.ceil((__width - _loc3.left - _loc3.right - widthPadding) / colWidth);
        if (__hScrollPolicy == "on" || _loc5 < colCount && __hScrollPolicy == "auto")
        {
            if (hScroller == undefined || specialHScrollCase)
            {
                delete this.specialHScrollCase;
                hScroller = this.createObject("HScrollBar", "hSB", 1001);
                hScroller.__set__lineScrollSize(20);
                hScroller.scrollHandler = scrollProxy;
                hScroller.__set__scrollPosition(__hPosition);
                scrollAreaChanged = true;
            } // end if
            if (numberOfCols != colCount || columnWidth != colWidth || viewableColumns != _loc5 || scrollAreaChanged)
            {
                hScroller.setScrollProperties(_loc5, 0, colCount - _loc5);
                viewableColumns = _loc5;
                numberOfCols = colCount;
                columnWidth = colWidth;
            } // end if
        }
        else if ((__hScrollPolicy == "auto" || __hScrollPolicy == "off") && hScroller != undefined)
        {
            hScroller.removeMovieClip();
            delete this.hScroller;
            scrollAreaChanged = true;
        } // end else if
        if (heightPadding == undefined)
        {
            heightPadding = 0;
        } // end if
        var _loc4 = Math.ceil((__height - _loc3.top - _loc3.bottom - heightPadding) / rwHeight);
        var _loc8 = (__height - _loc3.top - _loc3.bottom) % rwHeight != 0;
        if (__vScrollPolicy == "on" || _loc4 < rwCount + _loc8 && __vScrollPolicy == "auto")
        {
            if (vScroller == undefined)
            {
                vScroller = this.createObject("VScrollBar", "vSB", 1002);
                vScroller.scrollHandler = scrollProxy;
                vScroller.__set__scrollPosition(__vPosition);
                scrollAreaChanged = true;
                rowH = 0;
            } // end if
            if (rowC != rwCount || rowH != rwHeight || viewableRows + _loc8 != _loc4 + oldRndUp || scrollAreaChanged)
            {
                vScroller.setScrollProperties(_loc4, 0, rwCount - _loc4 + _loc8);
                viewableRows = _loc4;
                rowC = rwCount;
                rowH = rwHeight;
                oldRndUp = _loc8;
            } // end if
        }
        else if ((__vScrollPolicy == "auto" || __vScrollPolicy == "off") && vScroller != undefined)
        {
            vScroller.removeMovieClip();
            delete this.vScroller;
            scrollAreaChanged = true;
        } // end else if
        numberOfCols = colCount;
        columnWidth = colWidth;
        if (scrollAreaChanged)
        {
            this.doLayout();
            var _loc2 = __viewMetrics;
            var _loc12 = owner != undefined ? (owner) : (this);
            _loc12.layoutContent(_loc2.left, _loc2.top, columnWidth * numberOfCols - _loc2.left - _loc2.right, rowC * rowH, __width - _loc2.left - _loc2.right, __height - _loc2.top - _loc2.bottom);
        } // end if
        if (!enabled)
        {
            this.setEnabled(false);
        } // end if
    } // End of the function
    function getViewMetrics(Void)
    {
        var _loc2 = __viewMetrics;
        var _loc3 = border_mc.__get__borderMetrics();
        _loc2.left = _loc3.left;
        _loc2.right = _loc3.right;
        if (vScroller != undefined)
        {
            _loc2.right = _loc2.right + vScroller.minWidth;
        } // end if
        _loc2.top = _loc3.top;
        if (hScroller == undefined && (__hScrollPolicy == "on" || __hScrollPolicy == true))
        {
            hScroller = this.createObject("FHScrollBar", "hSB", 1001);
            specialHScrollCase = true;
        } // end if
        _loc2.bottom = _loc3.bottom;
        if (hScroller != undefined)
        {
            _loc2.bottom = _loc2.bottom + hScroller.minHeight;
        } // end if
        return (_loc2);
    } // End of the function
    function doLayout(Void)
    {
        var _loc10 = this.aso#39621();
        var _loc8 = this.__get__height();
        delete this.invLayout;
        var _loc3 = __viewMetrics = this.getViewMetrics();
        var _loc2 = _loc3.left;
        var _loc9 = _loc3.right;
        var _loc5 = _loc3.top;
        var _loc11 = _loc3.bottom;
        var _loc7 = hScroller;
        var _loc6 = vScroller;
        _loc7.setSize(_loc10 - _loc2 - _loc9, _loc7.minHeight + 0);
        _loc7.aso#14273(_loc2, _loc8 - _loc11);
        _loc6.setSize(_loc6.minWidth + 0, _loc8 - _loc5 - _loc11);
        _loc6.aso#14273(_loc10 - _loc9, _loc5);
        var _loc4 = aso#67753;
        _loc4._width = _loc10 - _loc2 - _loc9;
        _loc4._height = _loc8 - _loc5 - _loc11;
        _loc4._x = _loc2;
        _loc4._y = _loc5;
    } // End of the function
    function createChild(id, name, props)
    {
        var _loc2 = super.createChild(id, name, props);
        return (_loc2);
    } // End of the function
    function init(Void)
    {
        super.init();
        __viewMetrics = new Object();
        if (_global.__SVMouseWheelManager == undefined)
        {
            var _loc4 = _global.__SVMouseWheelManager = new Object();
            _loc4.onMouseWheel = __onMouseWheel;
            Mouse.addListener(_loc4);
        } // end if
    } // End of the function
    function __onMouseWheel(delta, scrollTarget)
    {
        var _loc4 = scrollTarget;
        var _loc1;
        while (_loc4 != undefined)
        {
            if (_loc4 instanceof mx.core.ScrollView)
            {
                _loc1 = _loc4;
                false;
            } // end if
            _loc4 = _loc4._parent;
        } // end while
        if (_loc1 != undefined)
        {
            _loc4 = delta <= 0 ? (1) : (-1);
            var _loc2 = _loc1.vScroller.lineScrollSize;
            if (_loc2 == undefined)
            {
                _loc2 = 0;
            } // end if
            _loc2 = Math.max(Math.abs(delta), _loc2);
            var _loc3 = _loc1.vPosition + _loc2 * _loc4;
            _loc1.vPosition = Math.max(0, Math.min(_loc3, _loc1.maxVPosition));
            _loc1.dispatchEvent({type: "scroll", aso#55775: "vertical", position: _loc1.vPosition});
        } // end if
    } // End of the function
    function createChildren(Void)
    {
        super.createChildren();
        if (aso#67753 == undefined)
        {
            aso#67753 = this.createObject("BoundingBox", "aso#67753", MASK_DEPTH);
        } // end if
        aso#67753._visible = false;
    } // End of the function
    function invalidate(Void)
    {
        super.invalidate();
    } // End of the function
    function draw(Void)
    {
        this.size();
    } // End of the function
    function size(Void)
    {
        super.size();
    } // End of the function
    function scrollProxy(docObj)
    {
        _parent.onScroll(docObj);
    } // End of the function
    function onScroll(docObj)
    {
        var _loc3 = docObj.target;
        var _loc2 = _loc3.scrollPosition;
        if (_loc3 == vScroller)
        {
            var _loc4 = "vertical";
            var _loc5 = "__vPosition";
        }
        else
        {
            _loc4 = "horizontal";
            _loc5 = "__hPosition";
        } // end else if
        this[_loc5] = _loc2;
        this.dispatchEvent({type: "scroll", aso#55775: _loc4, position: _loc2});
    } // End of the function
    function setEnabled(v)
    {
        vScroller.enabled = hScroller.enabled = v;
    } // End of the function
    function childLoaded(obj)
    {
        super.childLoaded(obj);
        obj.setMask(aso#67753);
    } // End of the function
    static var symbolName = "ScrollView";
    static var symbolOwner = mx.core.ScrollView;
    static var version = "2.0.2.126";
    var className = "ScrollView";
    var __vScrollPolicy = "auto";
    var __hScrollPolicy = "off";
    var __vPosition = 0;
    var __hPosition = 0;
    var numberOfCols = 0;
    var rowC = 0;
    var columnWidth = 1;
    var rowH = 0;
    var heightPadding = 0;
    var widthPadding = 0;
    var MASK_DEPTH = 10000;
} // End of Class
