class RiderInfo
{
    var rworld, dummy, compas, startPoint, rscaleFactor, type, typeOld, _x, _y, swapDepths, help, arrows;
    function RiderInfo(_active, _world, _dummy, _compas, _startPoint, scaleFactor, _riderType)
    {
        active = _active;
        rworld = _world;
        dummy = _dummy;
        dummy._visible = false;
        compas = _compas;
        compas._visible = false;
        startPoint = _startPoint;
        startPoint._visible = false;
        startPoint.rscaleFactor = rscaleFactor = scaleFactor;
        startPoint.help._visible = false;
        startPoint.arrows._visible = false;
        this.setStartPointFunctions();
        type = _riderType;
        typeOld = -1;
    } // End of the function
    function showStartPoint(bVisible)
    {
        startPoint._visible = bVisible;
        if (type != 0)
        {
            startPoint.gotoAndStop(type);
        } // end if
    } // End of the function
    function showStartPointHelp(bVisible)
    {
        startPoint.help._visible = bVisible;
    } // End of the function
    function showStartPointArrows(bVisible)
    {
        startPoint.arrows._visible = bVisible;
    } // End of the function
    function showDummy(bVisible)
    {
        dummy._visible = bVisible;
    } // End of the function
    function showCompass(bVisible)
    {
        compas._visible = bVisible;
        if (type != 0)
        {
            compas.gotoAndStop(type);
        } // end if
    } // End of the function
    function pointToStartPoint()
    {
        _root.pointACompasToAStartPoint(startPoint, compas);
    } // End of the function
    function activateRider(bActive)
    {
        active = bActive;
        if (_root.Lines != 0)
        {
            this.showCompass(bActive);
            this.showStartPoint(bActive);
        } // end if
        if (_root.ridersInfo[1] == this)
        {
            if (active == false)
            {
                _root.ridersInfo[0].compas._x = Stage.width * 0.500000;
                _root.ridersInfo[0].pointToStartPoint();
            }
            else
            {
                _root.ridersInfo[0].compas._x = Stage.width * 0.400000;
                _root.ridersInfo[0].pointToStartPoint();
            } // end if
        } // end else if
    } // End of the function
    function setOnEvents(bFlag)
    {
        if (bFlag)
        {
            this.setStartPointFunctions();
        }
        else
        {
            startPoint.onPress = startPoint.onRelease = startPoint.onRollOver = startPoint.onRollOut = startPoint.onReleaseOutside = function ()
            {
            };
        } // end else if
    } // End of the function
    function setStartPointFunctions()
    {
        startPoint.onPress = function ()
        {
            if (_root.active)
            {
                if (Key.isDown(68))
                {
                    if (Key.isDown(16))
                    {
                        var _loc3 = _root.getFirstLine();
                        if (_loc3 != undefined)
                        {
                            _x = _loc3.x1;
                            _y = _loc3.y1 - 50 * rscaleFactor;
                            if (_root.riders[1].startPoint == this)
                            {
                                _y = _y - 60 * rscaleFactor;
                            } // end if
                            this.pointToStartPoint();
                        } // end if
                    }
                    else
                    {
                        this.swapDepths(_root.tla.getNextHighestDepth());
                        startDrag (this, false);
                        help._visible = false;
                        arrows._visible = true;
                        _root.tooltip_mc.tip.text = "To restore position hold Shift+D and click the start point.";
                    } // end else if
                }
                else
                {
                    help._visible = false;
                    arrows._visible = false;
                    _root.openTrackDialog();
                } // end if
            } // end else if
        };
        startPoint.onRelease = function ()
        {
            function onMouseMove()
            {
            } // End of the function
            arrows._visible = false;
        };
        startPoint.onRollOver = function ()
        {
            if (_root.active)
            {
                help._visible = true;
                _root.active2 = false;
                _root.cursor._visible = false;
                Mouse.show();
                _root.tipRollOver(this);
            } // end if
        };
        startPoint.onRollOut = function ()
        {
            help._visible = false;
            _root.active2 = true;
            _root.cursorImage(_root.cursorMode);
            _root.tipRollOut();
        };
        startPoint.onReleaseOutside = function ()
        {
            if (!Key.isDown(68))
            {
                arrows._visible = false;
                help._visible = false;
            } // end if
        };
    } // End of the function
    var active = false;
} // End of Class
