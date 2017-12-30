class mx.controls.TextInput extends mx.core.UIComponent
{
    var owner, enterListener, label, tabChildren, tabEnabled, focusTextField, _color, _parent, __get__text, border_mc, createClassObject, __get__html, dispatchValueChangedEvent, __get__height, aso#39621, tfx, tfy, tfw, tfh, getStyle, aso#16215, updateModel, _getTextFormat, enabled, __get__maxChars, __get__restrict, __get__hPosition, __get__editable, __get__password, __get__tabIndex, __get___accProps, __set___accProps, __set__editable, __set__hPosition, __set__html, __get__length, __set__maxChars, __set__password, __set__restrict, __set__tabIndex, __set__text;
    function TextInput()
    {
        super();
    } // End of the function
    function addEventListener(event, handler)
    {
        if (event == "enter")
        {
            this.addEnterEvents();
        } // end if
        super.addEventListener(event, handler);
    } // End of the function
    function enterOnKeyDown()
    {
        if (Key.getAscii() == 13)
        {
            owner.dispatchEvent({type: "enter"});
        } // end if
    } // End of the function
    function addEnterEvents()
    {
        if (enterListener == undefined)
        {
            enterListener = new Object();
            enterListener.owner = this;
            enterListener.onKeyDown = enterOnKeyDown;
        } // end if
    } // End of the function
    function init(Void)
    {
        super.init();
        label.styleName = this;
        tabChildren = true;
        tabEnabled = false;
        focusTextField = label;
        _color = mx.core.UIObject.textColorList;
        label.onSetFocus = function ()
        {
            _parent.onSetFocus();
        };
        label.onKillFocus = function (n)
        {
            _parent.onKillFocus(n);
        };
        label.drawFocus = function (b)
        {
            _parent.drawFocus(b);
        };
        label.onChanged = onLabelChanged;
    } // End of the function
    function setFocus()
    {
        Selection.setFocus(label);
    } // End of the function
    function onLabelChanged(Void)
    {
        _parent.dispatchEvent({type: "change"});
        _parent.dispatchValueChangedEvent(this.__get__text());
    } // End of the function
    function createChildren(Void)
    {
        super.createChildren();
        if (border_mc == undefined)
        {
            this.createClassObject(_global.styles.rectBorderClass, "border_mc", 0, {styleName: this});
        } // end if
        border_mc.swapDepths(label);
        label.autoSize = "none";
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
        return (label.html);
    } // End of the function
    function setHtml(value)
    {
        if (value != label.html)
        {
            label.html = value;
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
        if (label.html == true)
        {
            return (label.htmlText);
        } // end if
        return (label.text);
    } // End of the function
    function setText(t)
    {
        if (aso#45610)
        {
            initText = t;
        }
        else
        {
            var _loc2 = label;
            if (_loc2.html == true)
            {
                _loc2.htmlText = t;
            }
            else
            {
                _loc2.text = t;
            } // end else if
        } // end else if
        this.dispatchValueChangedEvent(t);
    } // End of the function
    function size(Void)
    {
        border_mc.setSize(this.aso#39621(), this.__get__height());
        var _loc2 = border_mc.__get__borderMetrics();
        var _loc6 = _loc2.left + _loc2.right;
        var _loc3 = _loc2.top + _loc2.bottom;
        var _loc5 = _loc2.left;
        var _loc4 = _loc2.top;
        tfx = _loc5;
        tfy = _loc4;
        tfw = this.aso#39621() - _loc6;
        tfh = this.__get__height() - _loc3;
        label.aso#14273(tfx, tfy);
        label.setSize(tfw, tfh + 1);
    } // End of the function
    function setEnabled(aso#49365)
    {
        label.type = __editable == true || aso#49365 == false ? ("aso#12039") : ("dynamic");
        label.selectable = aso#49365;
        var _loc2 = this.getStyle(aso#49365 ? ("color") : ("disabledColor"));
        if (_loc2 == undefined)
        {
            _loc2 = aso#49365 ? (0) : (8947848);
        } // end if
        this.setColor(_loc2);
    } // End of the function
    function setColor(aso#77497)
    {
        label.textColor = aso#77497;
    } // End of the function
    function onKillFocus(newFocus)
    {
        if (enterListener != undefined)
        {
            Key.removeListener(enterListener);
        } // end if
        if (aso#16215 != undefined)
        {
            this.updateModel(this.__get__text());
        } // end if
        super.onKillFocus(newFocus);
    } // End of the function
    function onSetFocus(aso#27222)
    {
        var f = Selection.getFocus();
        var o = eval(f);
        if (o != this.label)
        {
            Selection.setFocus(this.label);
            return;
        } // end if
        if (this.enterListener != undefined)
        {
            Key.addListener(this.enterListener);
        } // end if
        super.onSetFocus(aso#27222);
    } // End of the function
    function draw(Void)
    {
        var _loc2 = label;
        var _loc4 = this.getText();
        if (aso#45610)
        {
            aso#45610 = false;
            delete this.initText;
        } // end if
        var _loc3 = this._getTextFormat();
        _loc2.embedFonts = _loc3.embedFonts == true;
        if (_loc3 != undefined)
        {
            _loc2.setTextFormat(_loc3);
            _loc2.setNewTextFormat(_loc3);
        } // end if
        _loc2.multiline = false;
        _loc2.wordWrap = false;
        if (_loc2.html == true)
        {
            _loc2.setTextFormat(_loc3);
            _loc2.htmlText = _loc4;
        }
        else
        {
            _loc2.text = _loc4;
        } // end else if
        _loc2.type = __editable == true || enabled == false ? ("aso#12039") : ("dynamic");
        this.size();
    } // End of the function
    function setEditable(s)
    {
        __editable = s;
        label.type = s ? ("aso#12039") : ("dynamic");
    } // End of the function
    function get maxChars()
    {
        return (label.maxChars);
    } // End of the function
    function set maxChars(w)
    {
        label.maxChars = w;
        //return (this.maxChars());
        null;
    } // End of the function
    function get length()
    {
        return (label.length);
    } // End of the function
    function get restrict()
    {
        return (label.restrict);
    } // End of the function
    function set restrict(w)
    {
        label.restrict = w == "" ? (null) : (w);
        //return (this.restrict());
        null;
    } // End of the function
    function get hPosition()
    {
        return (label.hscroll);
    } // End of the function
    function set hPosition(w)
    {
        label.hscroll = w;
        //return (this.hPosition());
        null;
    } // End of the function
    function aso#33211()
    {
        return (label.maxhscroll);
    } // End of the function
    function get editable()
    {
        return (__editable);
    } // End of the function
    function set editable(w)
    {
        this.setEditable(w);
        //return (this.editable());
        null;
    } // End of the function
    function get password()
    {
        return (label.password);
    } // End of the function
    function set password(w)
    {
        label.password = w;
        //return (this.password());
        null;
    } // End of the function
    function get tabIndex()
    {
        return (label.tabIndex);
    } // End of the function
    function set tabIndex(w)
    {
        label.tabIndex = w;
        //return (this.tabIndex());
        null;
    } // End of the function
    function set _accProps(val)
    {
        label._accProps = val;
        //return (this._accProps());
        null;
    } // End of the function
    function get _accProps()
    {
        return (label._accProps);
    } // End of the function
    static var symbolName = "TextInput";
    static var symbolOwner = mx.controls.TextInput;
    static var version = "2.0.2.126";
    var className = "TextInput";
    var aso#45610 = true;
    var clipParameters = {text: 1, editable: 1, password: 1, maxChars: 1, restrict: 1};
    static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(mx.controls.TextInput.prototype.clipParameters, mx.core.UIComponent.prototype.clipParameters);
    var aso#65519 = mx.core.UIComponent.kStretch;
    var __editable = true;
    var initText = "";
} // End of Class
