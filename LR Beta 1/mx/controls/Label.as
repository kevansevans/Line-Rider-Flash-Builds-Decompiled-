class mx.controls.Label extends mx.core.UIObject
{
    var _yscale, _xscale, labelField, tabEnabled, tabChildren, useHandCursor, _color, __get__html, __get__text, initText, __autoSize, __get__autoSize, _getTextFormat, __width, setSize, _x, __height, getStyle, __get__styleSheet, __set__autoSize, __set__html, __set__styleSheet, __set__text;
    function Label()
    {
        super();
    } // End of the function
    function init(Void)
    {
        super.init();
        _xscale = _yscale = 100;
        labelField.selectable = false;
        labelField.styleName = this;
        tabEnabled = false;
        tabChildren = false;
        useHandCursor = false;
        _color = mx.core.UIObject.textColorList;
    } // End of the function
    function get html()
    {
        return (this.getHtml());
    } // End of the function
    function set html(value)
    {
        this.setHtml(value);
        //return (this.html());
        null;
    } // End of the function
    function getHtml()
    {
        return (labelField.html);
    } // End of the function
    function setHtml(value)
    {
        if (value != labelField.html)
        {
            labelField.html = value;
        } // end if
    } // End of the function
    function get text()
    {
        return (this.getText());
    } // End of the function
    function set text(t)
    {
        this.setText(t);
        //return (this.text());
        null;
    } // End of the function
    function getText()
    {
        if (aso#45610)
        {
            return (initText);
        } // end if
        var _loc2 = labelField;
        if (_loc2.html == true)
        {
            return (_loc2.htmlText);
        } // end if
        return (_loc2.text);
    } // End of the function
    function setText(t)
    {
        if (aso#45610)
        {
            initText = t;
        }
        else
        {
            var _loc2 = labelField;
            if (_loc2.html == true)
            {
                _loc2.htmlText = t;
            }
            else
            {
                _loc2.text = t;
            } // end else if
            this.adjustForAutoSize();
        } // end else if
    } // End of the function
    function get autoSize()
    {
        return (__autoSize);
    } // End of the function
    function set autoSize(v)
    {
        if (_global.isLivePreview == true)
        {
            v = "none";
        } // end if
        __autoSize = v;
        if (!aso#45610)
        {
            this.draw();
        } // end if
        //return (this.autoSize());
        null;
    } // End of the function
    function draw(Void)
    {
        var _loc2 = labelField;
        if (aso#45610)
        {
            var _loc4 = this.__get__text();
            aso#45610 = false;
            this.setText(_loc4);
            delete this.initText;
        } // end if
        if (_loc2.html)
        {
            _loc4 = _loc2.htmlText;
        } // end if
        var _loc3 = this._getTextFormat();
        _loc2.embedFonts = _loc3.embedFonts == true;
        if (_loc3 != undefined)
        {
            _loc2.setTextFormat(_loc3);
            _loc2.setNewTextFormat(_loc3);
        } // end if
        if (_loc2.html)
        {
            _loc2.htmlText = _loc4;
        } // end if
        this.adjustForAutoSize();
    } // End of the function
    function adjustForAutoSize()
    {
        var _loc2 = labelField;
        var _loc3 = __autoSize;
        if (_loc3 != undefined && _loc3 != "none")
        {
            _loc2._height = _loc2.textHeight + 3;
            var _loc4 = __width;
            this.setSize(_loc2.textWidth + 4, _loc2._height);
            if (_loc3 == "right")
            {
                _x = _x + (_loc4 - __width);
            }
            else if (_loc3 == "center")
            {
                _x = _x + (_loc4 - __width) / 2;
            }
            else if (_loc3 == "left")
            {
                _x = _x + 0;
            } // end else if
        }
        else
        {
            _loc2._x = 0;
            _loc2._width = __width;
            _loc2._height = __height;
        } // end else if
    } // End of the function
    function size(Void)
    {
        var _loc2 = labelField;
        _loc2._width = __width;
        _loc2._height = __height;
    } // End of the function
    function setEnabled(aso#49365)
    {
        var _loc2 = this.getStyle(aso#49365 ? ("color") : ("disabledColor"));
        if (_loc2 == undefined)
        {
            _loc2 = aso#49365 ? (0) : (8947848);
        } // end if
        this.setColor(_loc2);
    } // End of the function
    function setColor(aso#77497)
    {
        labelField.textColor = aso#77497;
    } // End of the function
    function get styleSheet()
    {
        return (labelField.styleSheet);
    } // End of the function
    function set styleSheet(v)
    {
        labelField.styleSheet = v;
        //return (this.styleSheet());
        null;
    } // End of the function
    static var symbolName = "Label";
    static var symbolOwner = Object(mx.controls.Label);
    var className = "Label";
    static var version = "2.0.2.126";
    var aso#45610 = true;
    var clipParameters = {text: 1, html: 1, autoSize: 1};
    static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(mx.controls.Label.prototype.clipParameters, mx.core.UIObject.prototype.clipParameters);
} // End of Class
