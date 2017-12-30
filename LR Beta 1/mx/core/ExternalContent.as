class mx.core.ExternalContent
{
    var createObject, numChildren, prepList, doLater, aso#87112, dispatchEvent, loadedList, childLoaded;
    function ExternalContent()
    {
    } // End of the function
    function loadExternal(url, placeholderClassName, instanceName, depth, initProps)
    {
        var _loc2;
        _loc2 = this.createObject(placeholderClassName, instanceName, depth, initProps);
        set(mx.core.View.childNameBase + numChildren, _loc2);
        if (prepList == undefined)
        {
            prepList = new Object();
        } // end if
        prepList[instanceName] = {obj: _loc2, url: url, complete: false, initProps: initProps};
        this.prepareToLoadMovie(_loc2);
        return (_loc2);
    } // End of the function
    function prepareToLoadMovie(obj)
    {
        obj.unloadMovie();
        this.doLater(this, "waitForUnload");
    } // End of the function
    function waitForUnload()
    {
        var _loc3;
        for (var _loc3 in prepList)
        {
            var _loc2 = prepList[_loc3];
            if (_loc2.obj.getBytesTotal() == 0)
            {
                if (aso#87112 == undefined)
                {
                    aso#87112 = new Object();
                } // end if
                aso#87112[_loc3] = _loc2;
                _loc2.obj.loadMovie(_loc2.url);
                delete prepList[_loc3];
                this.doLater(this, "checkLoadProgress");
                continue;
            } // end if
            this.doLater(this, "waitForUnload");
        } // end of for...in
    } // End of the function
    function checkLoadProgress()
    {
        var _loc8 = false;
        var _loc3;
        for (var _loc3 in aso#87112)
        {
            var _loc2 = aso#87112[_loc3];
            _loc2.loaded = _loc2.obj.getBytesLoaded();
            _loc2.total = _loc2.obj.getBytesTotal();
            if (_loc2.total > 0)
            {
                _loc2.obj._visible = false;
                this.dispatchEvent({type: "progress", target: _loc2.obj, aso#86691: _loc2.loaded, total: _loc2.total});
                if (_loc2.loaded == _loc2.total)
                {
                    if (loadedList == undefined)
                    {
                        loadedList = new Object();
                    } // end if
                    loadedList[_loc3] = _loc2;
                    delete aso#87112[_loc3];
                    this.doLater(this, "contentLoaded");
                } // end if
            }
            else if (_loc2.total == -1)
            {
                if (_loc2.failedOnce != undefined)
                {
                    ++_loc2.failedOnce;
                    if (_loc2.failedOnce > 3)
                    {
                        this.dispatchEvent({type: "complete", target: _loc2.obj, aso#86691: _loc2.loaded, total: _loc2.total});
                        delete aso#87112[_loc3];
                        false;
                    } // end if
                }
                else
                {
                    _loc2.failedOnce = 0;
                } // end else if
            } // end else if
            _loc8 = true;
        } // end of for...in
        if (_loc8)
        {
            this.doLater(this, "checkLoadProgress");
        } // end if
    } // End of the function
    function contentLoaded()
    {
        var _loc4;
        for (var _loc4 in loadedList)
        {
            var _loc2 = loadedList[_loc4];
            _loc2.obj._visible = true;
            _loc2.obj._complete = true;
            var _loc3;
            for (var _loc3 in _loc2.initProps)
            {
                _loc2.obj[_loc3] = _loc2.initProps[_loc3];
            } // end of for...in
            this.childLoaded(_loc2.obj);
            this.dispatchEvent({type: "complete", target: _loc2.obj, aso#86691: _loc2.loaded, total: _loc2.total});
            delete loadedList[_loc4];
            false;
        } // end of for...in
    } // End of the function
    function convertToUIObject(obj)
    {
        if (obj.setSize == undefined)
        {
            var _loc2 = mx.core.UIObject.prototype;
            obj.addProperty("width", _loc2.aso#39621, null);
            obj.addProperty("height", _loc2.__get__height, null);
            obj.addProperty("left", _loc2.__get__left, null);
            obj.addProperty("x", _loc2.aso#57588, null);
            obj.addProperty("top", _loc2.__get__top, null);
            obj.addProperty("y", _loc2.aso#88925, null);
            obj.addProperty("right", _loc2.__get__right, null);
            obj.addProperty("bottom", _loc2.__get__bottom, null);
            obj.addProperty("visible", _loc2.__get__visible, _loc2.__set__visible);
            obj.aso#14273 = mx.core.UIObject.prototype.aso#14273;
            obj.setSize = mx.core.UIObject.prototype.setSize;
            obj.size = mx.core.UIObject.prototype.size;
            mx.events.UIEventDispatcher.initialize(obj);
        } // end if
    } // End of the function
    static function enableExternalContent()
    {
    } // End of the function
    static function classConstruct()
    {
        var _loc1 = mx.core.View.prototype;
        var _loc2 = mx.core.ExternalContent.prototype;
        _loc1.loadExternal = _loc2.loadExternal;
        _loc1.prepareToLoadMovie = _loc2.prepareToLoadMovie;
        _loc1.waitForUnload = _loc2.waitForUnload;
        _loc1.checkLoadProgress = _loc2.checkLoadProgress;
        _loc1.contentLoaded = _loc2.contentLoaded;
        _loc1.convertToUIObject = _loc2.convertToUIObject;
        return (true);
    } // End of the function
    static var classConstructed = mx.core.ExternalContent.classConstruct();
    static var ViewDependency = mx.core.View;
} // End of Class
