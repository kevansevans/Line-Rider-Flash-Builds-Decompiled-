function blink()
{
    if (Math.random() < BLINK_RATE)
    {
        world.sankac.face.uch1.play();
        world.sankac.face.uch2.play();
    } // end if
} // End of the function
function onKeyUp()
{
    if (Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "hand") && helpscreen._visible == false)
    {
        cursorImage(cursor.temp);
    } // end if
    if (Key.getCode() == 72 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        helpscreen._visible = !helpscreen._visible;
        if (helpscreen._visible)
        {
            panel._visible = false;
            cursor._visible = false;
            Mouse.show();
            active2 = false;
        }
        else
        {
            panel._visible = true;
            cursor._visible = true;
            Mouse.hide();
            active2 = true;
        } // end if
    } // end else if
    if (Key.getCode() == 81 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.pencilB.onPress();
        cursorImage("pencil");
    } // end if
    if (Key.getCode() == 87 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.lineB.onPress();
        cursorImage("line");
    } // end if
    if (Key.getCode() == 69 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.eraserB.onPress();
        cursorImage("eraser");
    } // end if
    if (Key.getCode() == 82 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.zoomB.onPress();
        cursorImage("zoom");
    } // end if
    if (Key.getCode() == 84 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.handB.onPress();
        cursorImage("hand");
    } // end if
    if (Key.getCode() == 89 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.playB.onPress();
    } // end if
    if (Key.getCode() == 85 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.stopB.onPress();
    } // end if
    if (Key.getCode() == 73 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.flagB.onPress();
    } // end if
    if (Key.getCode() == 79 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.saveB.onPress();
    } // end if
    if (Key.getCode() == 80 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.trashB.onPress();
    } // end if
    if (Key.getCode() == 49 && panel.swatches._visible == true)
    {
        panel.swatches.blue.onPress();
    } // end if
    if (Key.getCode() == 50 && panel.swatches._visible == true)
    {
        panel.swatches.red.onPress();
    } // end if
    if (Key.getCode() == 51 && panel.swatches._visible == true)
    {
        panel.swatches.green.onPress();
    } // end if
    if (Key.getCode() == 9 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        if (tempZoom == undefined || tla._xscale != ttZoom)
        {
            trace (tempLines);
            if (Lines != tempLines)
            {
                tempLines = Lines;
                trace ("gotBounds");
                getBounds();
            } // end if
            tempZoom = tla._xscale;
            showAll();
            ttZoom = tla._xscale;
        }
        else
        {
            var _loc5 = tla._xmouse;
            var _loc4 = tla._ymouse;
            var _loc3 = _xmouse;
            var _loc2 = _ymouse;
            canvasX = tla._x = -(_loc5 * tempZoom * 0.010000 - _loc3);
            canvasY = tla._y = -(_loc4 * tempZoom * 0.010000 - _loc2);
            bufScale = tla._xscale = tla._yscale = tempZoom;
            tempZoom = undefined;
        } // end if
    } // end else if
    if (Key.getCode() == 8 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        undo();
    } // end if
    if (Key.getCode() == 36 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        tmpPoint.x = tla.startPoint._x;
        tmpPoint.y = tla.startPoint._y;
        tla.localToGlobal(tmpPoint);
        canvasX = tla._x = Stage.width * 0.500000 - tmpPoint.x + tla._x;
        canvasY = tla._y = Stage.height * 0.500000 - tmpPoint.y + tla._y;
    } // end if
    if (Key.getCode() == 35 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        var _loc1 = getLastLine();
        if (_loc1 != undefined)
        {
            tmpPoint.x = _loc1.x2;
            tmpPoint.y = _loc1.y2;
            tla.localToGlobal(tmpPoint);
            canvasX = tla._x = Stage.width * 0.500000 - tmpPoint.x + tla._x;
            canvasY = tla._y = Stage.height * 0.500000 - tmpPoint.y + tla._y;
        } // end if
    } // end if
    if (Key.getCode() == 70 && tla.flag._visible == true && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        tmpPoint.x = tla.flag._x;
        tmpPoint.y = tla.flag._y;
        tla.localToGlobal(tmpPoint);
        canvasX = tla._x = Stage.width * 0.500000 - tmpPoint.x + tla._x;
        canvasY = tla._y = Stage.height * 0.500000 - tmpPoint.y + tla._y;
    } // end if
    if (Key.getCode() == 77 && simulation == true)
    {
        slowMotion = !slowMotion;
    } // end if
} // End of the function
function showAll()
{
    var _loc6 = maxX - minX;
    var _loc5 = maxY - minY;
    var _loc4 = Stage.width / _loc6;
    var _loc3 = Stage.height / _loc5;
    var _loc2 = Math.min(_loc4, 3);
    var _loc1 = Math.min(_loc3, 3);
    if (_loc4 > _loc3)
    {
        bufScale = tla._xscale = tla._yscale = _loc1 * 100;
        canvasX = tla._x = -minX * _loc1 + (Stage.width - _loc6 * _loc1) * 0.500000;
        canvasY = tla._y = -minY * _loc1;
    }
    else
    {
        bufScale = tla._xscale = tla._yscale = _loc2 * 100;
        canvasX = tla._x = -minX * _loc2;
        canvasY = tla._y = -minY * _loc2 + (Stage.height - _loc5 * _loc2) * 0.500000;
    } // end else if
} // End of the function
function onKeyDown()
{
    if (Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "line") && drawing == false && helpscreen._visible == false)
    {
        var _loc1 = cursorMode;
        cursor.temp = _loc1;
        cursorImage("hand");
    } // end if
} // End of the function
function pointToStartPoint()
{
    var _loc1 = new Object();
    _loc1.x = tla.startPoint._x;
    _loc1.y = tla.startPoint._y;
    tla.localToGlobal(_loc1);
    compas.distance.text = Math.floor(Math.sqrt(Math.pow(_loc1.x - compas._x, 2) + Math.pow(_loc1.y - compas._y, 2))) + " pixels";
    compas.dial._rotation = Math.atan2(_loc1.y - compas._y, _loc1.x - compas._x) * TO_DEG;
} // End of the function
function removeSpaces(str)
{
    while (str.charAt(str.length - 1) == " ")
    {
        str = str.substr(0, str.length - 1);
    } // end while
    return (str);
} // End of the function
function finishLoad()
{
    panel.onEnterFrame = function ()
    {
    };
    if (lines["line" + savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine] == undefined && typeof(savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine) == "number")
    {
        var _loc1 = [];
        _loc1[0] = 100;
        _loc1[1] = 100;
    }
    else if (typeof(savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine) == "number")
    {
        _loc1 = [];
        _loc1[0] = lines["line" + savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine].x1;
        _loc1[1] = lines["line" + savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine].y1 - 50 * SCALEDOWN;
    }
    else
    {
        _loc1 = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine;
    } // end else if
    tla.startPoint._x = _loc1[0];
    tla.startPoint._y = _loc1[1];
    totLines = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].level;
    panel[lastTool + "B"].onPress();
    cursorImage(cursorMode);
    panelMode("draw");
    pointToStartPoint();
    steuc.text = Lines + " lines";
} // End of the function
function disableFileButtons()
{
    fucusManager.enabled = false;
    panel.fileDilag.saveButton.enabled = panel.fileDilag.loadButton.enabled = panel.fileDilag.deleteButton.enabled = panel.fileDilag.close.enabled = false;
    panel.fileDialog.name.editable = false;
    panel.fileDialog.saveButton.onRelease = panel.fileDialog.loadButton.onRelease = panel.fileDialog.deleteButton.onRelease = panel.fileDialog.close.onPress = function ()
    {
    };
} // End of the function
function enableFileButtons()
{
    panel.fileDilag.saveButton.enabled = panel.fileDilag.loadButton.enabled = panel.fileDilag.deleteButton.enabled = panel.fileDilag.close.enabled = true;
    panel.fileDialog.name.editable = true;
} // End of the function
function disableConfirmButtons()
{
    panel.confirmDialog.Yes.enabled = panel.confirmDialog.No.enabled = false;
    panel.confirmDialog.Yes.onRelease = panel.confirmDialog.No.onRelease = function ()
    {
    };
} // End of the function
function enableConfirmButtons()
{
    panel.confirmDialog.Yes.enabled = panel.confirmDialog.No.enabled = true;
} // End of the function
function getBounds()
{
    maxX = 0;
    maxY = 0;
    minX = Stage.width;
    minY = Stage.height;
    for (var _loc2 in lines)
    {
        var _loc1 = lines[_loc2];
        maxX = Math.max(maxX, Math.max(_loc1.x1, _loc1.x2));
        maxY = Math.max(maxY, Math.max(_loc1.y1, _loc1.y2));
        minX = Math.min(minX, Math.min(_loc1.x1, _loc1.x2));
        minY = Math.min(minY, Math.min(_loc1.y1, _loc1.y2));
    } // end of for...in
} // End of the function
function loadBounds(linez)
{
    maxX = 0;
    maxY = 0;
    minX = Stage.width;
    minY = Stage.height;
    for (var _loc3 in linez)
    {
        var _loc1 = linez[_loc3];
        maxX = Math.max(maxX, Math.max(_loc1[0], _loc1[2]));
        maxY = Math.max(maxY, Math.max(_loc1[1], _loc1[3]));
        minX = Math.min(minX, Math.min(_loc1[0], _loc1[2]));
        minY = Math.min(minY, Math.min(_loc1[1], _loc1[3]));
    } // end of for...in
} // End of the function
function init()
{
    BindStick.crash = false;
    dots = [];
    dots2 = [];
    dots[0] = new Point(0, 0, 0.800000);
    dots[1] = new Point(0, 10, 0);
    dots[2] = new Point(30, 10, 0);
    dots[3] = new Point(35, 0, 0);
    dots[4] = new Point(10, 0, 0.800000);
    dots[5] = new Point(10, -11, 0.800000);
    dots[6] = new Point(23, -10, 0.100000, true);
    dots[7] = new Point(23, -10, 0.100000);
    dots[8] = new Point(20, 10, 0);
    dots[9] = new Point(20, 10, 0);
    dots2[0] = new PointAirFri(7, -10, AIR_FRICTION);
    dots2[1] = new PointAirFri(3, -10, AIR_FRICTION);
    dots2[2] = new PointAirFri(0, -10, AIR_FRICTION);
    dots2[3] = new PointAirFri(-4, -10, AIR_FRICTION);
    dots2[4] = new PointAirFri(-7, -10, AIR_FRICTION);
    dots2[5] = new PointAirFri(-11, -10, AIR_FRICTION);
    for (var _loc1 = 0; _loc1 < dots.length; ++_loc1)
    {
        dots[_loc1].x = dots[_loc1].x * SCALEDOWN;
        dots[_loc1].y = dots[_loc1].y * SCALEDOWN;
    } // end of for
    for (var _loc1 = 0; _loc1 < dots2.length; ++_loc1)
    {
        dots2[_loc1].x = dots2[_loc1].x * SCALEDOWN;
        dots2[_loc1].y = dots2[_loc1].y * SCALEDOWN;
    } // end of for
    world.sanke.gotoAndStop(1);
    world.sanke._xscale = world.sanke._yscale = world.sankac._xscale = world.sankac._yscale = world.roka1._xscale = world.roka1._yscale = world.roka2._xscale = world.roka2._yscale = world.noga1._xscale = world.noga1._yscale = world.noga2._xscale = world.noga2._yscale = SCALEDOWN * 100;
    edges = [];
    edges2 = [];
    edges[0] = new Stick(dots[0], dots[1]);
    edges[1] = new Stick(dots[1], dots[2]);
    edges[2] = new Stick(dots[2], dots[3]);
    edges[3] = new Stick(dots[3], dots[0]);
    edges[4] = new Stick(dots[0], dots[2]);
    edges[5] = new Stick(dots[3], dots[1]);
    edges[6] = new BindStick(dots[0], dots[4], ENDURANCE);
    edges[8] = new BindStick(dots[1], dots[4], ENDURANCE);
    edges[9] = new BindStick(dots[2], dots[4], ENDURANCE);
    edges[10] = new Stick(dots[5], dots[4]);
    edges[11] = new Stick(dots[5], dots[6]);
    edges[12] = new Stick(dots[5], dots[7]);
    edges[13] = new Stick(dots[4], dots[8]);
    edges[14] = new Stick(dots[4], dots[9]);
    edges[15] = new Stick(dots[5], dots[7]);
    edges[16] = new BindStick(dots[5], dots[0], ENDURANCE);
    edges[17] = new BindStick(dots[3], dots[6], ENDURANCE);
    edges[18] = new BindStick(dots[3], dots[7], ENDURANCE);
    edges[19] = new BindStick(dots[8], dots[2], ENDURANCE);
    edges[20] = new BindStick(dots[9], dots[2], ENDURANCE);
    edges[21] = new RepellStick(dots[5], dots[8]);
    edges[22] = new RepellStick(dots[5], dots[9]);
    edges[21].restLength = edges[21].restLength * 0.500000;
    edges[22].restLength = edges[22].restLength * 0.500000;
    edges2[0] = new Shal(dots[5], dots2[0]);
    edges2[1] = new Shal(dots2[0], dots2[1]);
    edges2[2] = new Shal(dots2[1], dots2[2]);
    edges2[3] = new Shal(dots2[2], dots2[3]);
    edges2[4] = new Shal(dots2[3], dots2[4]);
    edges2[5] = new Shal(dots2[4], dots2[5]);
} // End of the function
function reset()
{
    clearFloor();
    lines = new Object();
    Lines = 0;
    totLines = 0;
    grid = [];
    maxX = 0;
    maxY = 0;
    minX = Stage.width;
    minY = Stage.height;
    canvasX = canvasY = tla._x = tla._y = 0;
    tla._xscale = tla._yscale = bufScale = 100;
} // End of the function
function snap(x, y, vert, invert)
{
    var _loc2 = Math.pow(SNAP_DISTANCE / (tla._xscale * 0.010000), 2);
    var _loc11 = x;
    var _loc10 = y;
    var _loc17;
    var _loc18;
    var _loc6;
    var _loc7;
    var _loc9 = false;
    var _loc15 = gridPos(x, y);
    var _loc8;
    if (!Key.isDown(83))
    {
        for (var _loc14 = -1; _loc14 < 2; ++_loc14)
        {
            var _loc4 = "x" + (_loc15.x + _loc14);
            if (grid[_loc4] == undefined)
            {
                continue;
            } // end if
            for (var _loc5 = -1; _loc5 < 2; ++_loc5)
            {
                var _loc3 = "y" + (_loc15.y + _loc5);
                if (grid[_loc4][_loc3] == undefined)
                {
                    continue;
                } // end if
                for (var _loc16 in grid[_loc4][_loc3].storage2)
                {
                    var _loc1 = grid[_loc4][_loc3].storage2[_loc16];
                    _loc6 = Math.pow(x - _loc1.x1, 2) + Math.pow(y - _loc1.y1, 2);
                    _loc7 = Math.pow(x - _loc1.x2, 2) + Math.pow(y - _loc1.y2, 2);
                    if (_loc6 < _loc2 && _loc1.prevLine == undefined)
                    {
                        _loc2 = _loc6;
                        _loc11 = _loc1.x1;
                        _loc10 = _loc1.y1;
                        _loc9 = 1;
                        _loc8 = _loc1;
                    } // end if
                    if (_loc7 < _loc2 && _loc1.nextLine == undefined)
                    {
                        _loc2 = _loc7;
                        _loc11 = _loc1.x2;
                        _loc10 = _loc1.y2;
                        _loc9 = 2;
                        _loc8 = _loc1;
                    } // end if
                } // end of for...in
            } // end of for
        } // end of for
        _loc17 = vert == _loc9;
        _loc18 = invert == _loc8.inv;
        if (!(_loc17 && !_loc18 || !_loc17 && _loc18) || _loc8.type == 2)
        {
            _loc9 = false;
            _loc8 = undefined;
            _loc11 = x;
            _loc10 = y;
        } // end if
    } // end if
    return ([_loc11, _loc10, _loc9, _loc8]);
} // End of the function
function resetPosition()
{
    dots[0].x = 0;
    dots[0].y = 0;
    dots[1].x = 0;
    dots[1].y = 10;
    dots[2].x = 30;
    dots[2].y = 10;
    dots[3].x = 35;
    dots[3].y = 0;
    dots[4].x = 10;
    dots[4].y = 0;
    dots[5].x = 10;
    dots[5].y = -11;
    dots[6].x = 23;
    dots[6].y = -10;
    dots[7].x = 23;
    dots[7].y = -10;
    dots[8].x = 20;
    dots[8].y = 10;
    dots[9].x = 20;
    dots[9].y = 10;
    dots2[0].x = 7;
    dots2[0].y = -10;
    dots2[1].x = 3;
    dots2[1].y = -10;
    dots2[2].x = 0;
    dots2[2].y = -10;
    dots2[3].x = -4;
    dots2[3].y = -10;
    dots2[4].x = -7;
    dots2[4].y = -10;
    dots2[5].x = -11;
    dots2[5].y = -10;
    for (var _loc1 = 0; _loc1 < dots.length; ++_loc1)
    {
        dots[_loc1].x = dots[_loc1].x * SCALEDOWN;
        dots[_loc1].y = dots[_loc1].y * SCALEDOWN;
    } // end of for
    for (var _loc1 = 0; _loc1 < dots2.length; ++_loc1)
    {
        dots2[_loc1].x = dots2[_loc1].x * SCALEDOWN;
        dots2[_loc1].y = dots2[_loc1].y * SCALEDOWN;
    } // end of for
} // End of the function
function erase(x, y)
{
    var _loc15 = gridPos(x, y);
    var _loc8 = 1 / (tla._xscale * 0.010000);
    for (var _loc14 = -1; _loc14 < 2; ++_loc14)
    {
        var _loc6 = "x" + (_loc15.x + _loc14);
        if (grid[_loc6] == undefined)
        {
            continue;
        } // end if
        for (var _loc7 = -1; _loc7 < 2; ++_loc7)
        {
            var _loc4 = "y" + (_loc15.y + _loc7);
            if (grid[_loc6][_loc4] == undefined)
            {
                continue;
            } // end if
            for (var _loc16 in grid[_loc6][_loc4].storage2)
            {
                var _loc1 = grid[_loc6][_loc4].storage2[_loc16];
                var _loc3 = x - _loc1.x1;
                var _loc2 = y - _loc1.y1;
                var _loc9 = Math.sqrt(Math.pow(_loc3, 2) + Math.pow(_loc2, 2));
                var _loc10 = Math.sqrt(Math.pow(x - _loc1.x2, 2) + Math.pow(y - _loc1.y2, 2));
                var _loc11 = Math.abs(_loc1.nx * _loc3 + _loc1.ny * _loc2);
                var _loc5 = (_loc3 * _loc1.dx + _loc2 * _loc1.dy) * _loc1.invSqrDis;
                if (_loc9 < ERASER_SIZE * _loc8 || _loc10 < ERASER_SIZE * _loc8 || _loc11 < ERASER_SIZE * _loc8 && _loc5 >= 0 && _loc5 <= 1)
                {
                    removeLine(_loc1);
                } // end if
            } // end of for...in
        } // end of for
    } // end of for
} // End of the function
function save()
{
    for (var _loc1 in dots)
    {
        dots[_loc1].savePoint();
    } // end of for...in
    for (var _loc2 in dots2)
    {
        dots2[_loc2].savePoint();
    } // end of for...in
} // End of the function
function restore()
{
    for (var _loc1 in dots)
    {
        dots[_loc1].restore();
    } // end of for...in
    for (var _loc2 in dots2)
    {
        dots2[_loc2].restore();
    } // end of for...in
} // End of the function
function pan()
{
    var _loc1 = tla._xscale * 0.010000;
    tla.startDrag(false);
    pointToStartPoint();
} // End of the function
function zoom()
{
    onMouseDown = function ()
    {
        if (active2)
        {
            oldScale = tla._xscale;
            oldy = _ymouse;
            if (cursor._currentframe == 2)
            {
                pan();
            }
            else
            {
                onMouseMove = function ()
                {
                    var _loc1 = Math.min(Math.max(oldScale + (oldy - _ymouse) * 0.500000, 5), 300);
                    tla._xscale = tla._yscale = _loc1;
                    tla._x = Stage.width * 0.500000 + (canvasX - Stage.width * 0.500000) * (_loc1 / oldScale);
                    tla._y = Stage.height * 0.500000 + (canvasY - Stage.height * 0.500000) * (_loc1 / oldScale);
                };
            } // end if
        } // end else if
    };
    onMouseMove = function ()
    {
    };
    onMouseUp = function ()
    {
        stopDrag ();
        pointToStartPoint();
        bufScale = tla._xscale;
        canvasX = tla._x;
        canvasY = tla._y;
        onMouseMove = function ()
        {
        };
    };
    onEnterFrame = function ()
    {
    };
} // End of the function
function makeStartPoint(line)
{
    tla.startPoint._x = line.x1;
    tla.startPoint._y = line.y1 - 50 * SCALEDOWN;
    pointToStartPoint();
} // End of the function
function getLastLine()
{
    var _loc2 = undoList.length - 1;
    var _loc1;
    while (_loc1 == undefined && Lines > 0)
    {
        _loc1 = lines["line" + undoList[_loc2]];
        --_loc2;
    } // end while
    return (_loc1);
} // End of the function
function getFirstLine()
{
    var _loc2 = 0;
    var _loc1;
    while (_loc1 == undefined && Lines > 0)
    {
        _loc1 = lines["line" + undoList[_loc2]];
        ++_loc2;
    } // end while
    return (_loc1);
} // End of the function
function undo()
{
    var _loc1;
    while (_loc1 == undefined && Lines > 0)
    {
        _loc1 = lines["line" + undoList.pop()];
    } // end while
    if (Lines > 0)
    {
        removeLine(_loc1);
    } // end if
} // End of the function
function addLine(line)
{
    line.name = totLines;
    undoList.push(totLines);
    if (Lines == 0)
    {
        makeStartPoint(line);
    } // end if
    ++Lines;
    steuc.text = Lines + " lines";
    ++totLines;
    registerInGrid(line);
    lines["line" + line.name] = line;
    var _loc2 = tla.createEmptyMovieClip(line.name, tla.getNextHighestDepth());
    line.parent = _loc2;
    renderLine(line);
} // End of the function
function removeLine(line)
{
    --Lines;
    steuc.text = Lines + " lines";
    tla[line.name].removeMovieClip();
    removeFromGrid(line);
    if (Lines == 0)
    {
        startLine = undefined;
    } // end if
    if (lines["line" + line.nextLine].prevLine == line.name)
    {
        lines["line" + line.nextLine].prevLine = undefined;
        switch (lines["line" + line.nextLine].lim)
        {
            case 1:
            {
                lines["line" + line.nextLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines["line" + line.nextLine].lim = 2;
                break;
            } 
        } // End of switch
    } // end if
    if (lines["line" + line.nextLine].nextLine == line.name)
    {
        lines["line" + line.nextLine].nextLine = undefined;
        switch (lines["line" + line.nextLine].lim)
        {
            case 2:
            {
                lines["line" + line.nextLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines["line" + line.nextLine].lim = 1;
                break;
            } 
        } // End of switch
    } // end if
    if (lines["line" + line.prevLine].prevLine == line.name)
    {
        lines["line" + line.prevLine].prevLine = undefined;
        switch (lines["line" + line.prevLine].lim)
        {
            case 1:
            {
                lines["line" + line.prevLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines["line" + line.prevLine].lim = 2;
                break;
            } 
        } // End of switch
    } // end if
    if (lines["line" + line.prevLine].nextLine == line.name)
    {
        lines["line" + line.prevLine].nextLine = undefined;
        switch (lines["line" + line.prevLine].lim)
        {
            case 2:
            {
                lines["line" + line.prevLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines["line" + line.prevLine].lim = 1;
                break;
            } 
        } // End of switch
    } // end if
    delete lines["line" + line.name];
    false;
    if (Lines == 0)
    {
        undoList = [];
        if (!compatible)
        {
            switchToRev6(false);
        } // end if
    } // end if
} // End of the function
function clearFloor()
{
    startLine = undefined;
    for (var _loc1 in lines)
    {
        removeLine(lines[_loc1]);
    } // end of for...in
} // End of the function
function checkAngles(line1, line2)
{
    var _loc4 = Math.acos((line1.dx * line2.dx + line1.dy * line2.dy) / (line1.dst * line2.dst));
    var _loc1 = line1.dx * line2.dy - line2.dx * line1.dy > 0;
    var _loc6;
    var _loc5;
    if (tempLine.inv)
    {
        if (line1.inv == line2.inv)
        {
            _loc6 = _loc1 ? (_loc4 < 1.570796) : (true);
            _loc5 = !_loc1;
        }
        else
        {
            _loc6 = _loc1 ? (true) : (_loc4 > 1.570796);
            _loc5 = _loc1;
        } // end else if
    }
    else if (line1.inv == line2.inv)
    {
        _loc6 = _loc1 ? (true) : (_loc4 < 1.570796);
        _loc5 = _loc1;
    }
    else
    {
        _loc6 = _loc1 ? (_loc4 > 1.570796) : (true);
        _loc5 = !_loc1;
    } // end else if
    return ([_loc6, _loc5, _loc4]);
} // End of the function
function drawPencil()
{
    tla._xscale = tla._yscale = bufScale;
    onMouseDown = function ()
    {
        tempLine.valid = false;
        if (active2)
        {
            if (cursor._currentframe == 2)
            {
                pan();
            }
            else
            {
                drawing = true;
                prevLine = undefined;
                snaped = false;
                tempLine.inv = Key.isDown(16);
                tempLine.x1 = tla._xmouse;
                tempLine.y1 = tla._ymouse;
                var _loc1 = snap(tempLine.x1, tempLine.y1, 1, tempLine.inv);
                if (_loc1[2] != false)
                {
                    var _loc4 = _loc1[2] == 2 ? (-1) : (1);
                    tempLine.x1 = _loc1[0];
                    tempLine.y1 = _loc1[1];
                    prevLine = _loc1[3];
                    snaped = _loc1[2];
                } // end if
                onMouseMove = function ()
                {
                    if (active && active2 && cursor._currentframe != 2)
                    {
                        tempLine.x2 = tla._xmouse;
                        tempLine.y2 = tla._ymouse;
                        tempLine.dx = tempLine.x2 - tempLine.x1;
                        tempLine.dy = tempLine.y2 - tempLine.y1;
                        tempLine.dst = Math.sqrt(Math.pow(tempLine.dx, 2) + Math.pow(tempLine.dy, 2));
                        var _loc2 = 1 / (tla._xscale * 0.010000);
                        if (prevLine != undefined && pencilMode != 2)
                        {
                            checks = checkAngles(tempLine, prevLine);
                            tempLine.valid = tempLine.dst > MIN_LENGTH * _loc2 && checks[0] && checks[2] > MIN_ANGLE && tempLine.dst < MAX_LENGTH;
                        }
                        else
                        {
                            tempLine.valid = tempLine.dst > MIN_LENGTH * _loc2 && tempLine.dst < MAX_LENGTH;
                        } // end else if
                        if (tempLine.valid && _xmouse < Stage.width && _xmouse > 0 && _ymouse < Stage.height && _ymouse > 0)
                        {
                            tempLine.valid = false;
                            switch (pencilMode)
                            {
                                case 0:
                                {
                                    var _loc1 = new Floor(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                                    break;
                                } 
                                case 1:
                                {
                                    _loc1 = new FloorAcc(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                                    break;
                                } 
                                case 2:
                                {
                                    _loc1 = new FloorScenery(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2);
                                    break;
                                } 
                            } // End of switch
                            addLine(_loc1);
                            if (pencilMode != 2)
                            {
                                if (prevLine != undefined)
                                {
                                    if (snaped == 1)
                                    {
                                        prevLine.addPrevLine(_loc1, checks[1]);
                                    }
                                    else
                                    {
                                        prevLine.addNextLine(_loc1, checks[1]);
                                    } // end else if
                                    _loc1.addPrevLine(prevLine, checks[1]);
                                } // end if
                                prevLine = _loc1;
                            } // end if
                            tempLine.x1 = tla._xmouse;
                            tempLine.y1 = tla._ymouse;
                            tla.clear();
                        }
                        else
                        {
                            tla.clear();
                            tla.lineStyle(1, 16711680, 100);
                            tla.moveTo(tempLine.x1, tempLine.y1);
                            tla.lineTo(tempLine.x2, tempLine.y2);
                        } // end if
                    } // end else if
                };
            } // end if
        } // end else if
    };
    onMouseUp = function ()
    {
        stopDrag ();
        canvasX = tla._x;
        canvasY = tla._y;
        tla.clear();
        drawing = false;
        onMouseMove = function ()
        {
        };
        pointToStartPoint();
        if (active2 && tempLine.valid && cursor._currentframe != 2)
        {
            nextLine = undefined;
            var _loc2 = snap(tempLine.x2, tempLine.y2, 2, tempLine.inv);
            if (_loc2[2])
            {
                checks2 = checkAngles(_loc2[3], tempLine);
                if (checks2[0])
                {
                    tempLine.x2 = _loc2[0];
                    tempLine.y2 = _loc2[1];
                    nextLine = _loc2[3];
                } // end if
            } // end if
            switch (pencilMode)
            {
                case 0:
                {
                    var _loc1 = new Floor(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                    break;
                } 
                case 1:
                {
                    _loc1 = new FloorAcc(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                    break;
                } 
                case 2:
                {
                    _loc1 = new FloorScenery(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2);
                    break;
                } 
            } // End of switch
            addLine(_loc1);
            if (pencilMode != 2)
            {
                if (prevLine != undefined)
                {
                    if (snaped == 1)
                    {
                        prevLine.addPrevLine(_loc1, checks[1]);
                    }
                    else
                    {
                        prevLine.addNextLine(_loc1, checks[1]);
                    } // end else if
                    _loc1.addPrevLine(prevLine, checks[1]);
                } // end if
                if (nextLine != undefined)
                {
                    if (_loc2[2] == 1)
                    {
                        nextLine.addPrevLine(_loc1, checks2[1]);
                    }
                    else
                    {
                        nextLine.addNextLine(_loc1, checks2[1]);
                    } // end else if
                    _loc1.addNextLine(nextLine, checks2[1]);
                } // end if
            } // end if
        } // end if
    };
    onEnterFrame = function ()
    {
    };
} // End of the function
function drawLine()
{
    tla._xscale = tla._yscale = bufScale;
    onMouseDown = function ()
    {
        tempLine.valid = false;
        if (active2)
        {
            if (cursor._currentframe == 2)
            {
                pan();
            }
            else
            {
                drawing = true;
                prevLine = undefined;
                snaped = false;
                tempLine.inv = Key.isDown(16);
                tempLine.x1 = tla._xmouse;
                tempLine.y1 = tla._ymouse;
                tempLine.valid = false;
                var _loc1 = snap(tempLine.x1, tempLine.y1, 1, tempLine.inv);
                if (_loc1[2] != false)
                {
                    var _loc3 = _loc1[2] == 2 ? (-1) : (1);
                    tempLine.x1 = _loc1[0];
                    tempLine.y1 = _loc1[1];
                    prevLine = _loc1[3];
                    snaped = _loc1[2];
                } // end if
                onMouseMove = function ()
                {
                    tempLine.x2 = tla._xmouse;
                    tempLine.y2 = tla._ymouse;
                    tempLine.dx = tempLine.x2 - tempLine.x1;
                    tempLine.dy = tempLine.y2 - tempLine.y1;
                    tempLine.dst = Math.sqrt(Math.pow(tempLine.dx, 2) + Math.pow(tempLine.dy, 2));
                    var _loc1 = 1 / (tla._xscale * 0.010000);
                    if (prevLine != undefined && pencilMode != 2)
                    {
                        checks = checkAngles(tempLine, prevLine);
                        tempLine.valid = tempLine.dst > MIN_LENGTH * _loc1 && checks[0] && tempLine.dst < MAX_LENGTH;
                    }
                    else
                    {
                        tempLine.valid = tempLine.dst > MIN_LENGTH * _loc1 && tempLine.dst < MAX_LENGTH;
                    } // end else if
                    if (tempLine.valid && _xmouse < Stage.width && _xmouse > 0 && _ymouse < Stage.height && _ymouse > 0 && cursor._currentframe != 2)
                    {
                        tla.clear();
                        tla.lineStyle(1, 7829367, 100);
                        tla.moveTo(tempLine.x1, tempLine.y1);
                        tla.lineTo(tempLine.x2, tempLine.y2);
                    }
                    else
                    {
                        tla.clear();
                        tla.lineStyle(1, 16711680, 100);
                        tla.moveTo(tempLine.x1, tempLine.y1);
                        tla.lineTo(tempLine.x2, tempLine.y2);
                    } // end else if
                };
            } // end if
        } // end else if
    };
    onMouseUp = function ()
    {
        stopDrag ();
        canvasX = tla._x;
        canvasY = tla._y;
        tla.clear();
        onMouseMove = function ()
        {
        };
        drawing = false;
        pointToStartPoint();
        if (active2 && tempLine.valid && cursor._currentframe != 2)
        {
            nextLine = undefined;
            var _loc2 = snap(tempLine.x2, tempLine.y2, 2, tempLine.inv);
            if (_loc2[2])
            {
                checks2 = checkAngles(_loc2[3], tempLine);
                if (checks2[0])
                {
                    tempLine.x2 = _loc2[0];
                    tempLine.y2 = _loc2[1];
                    nextLine = _loc2[3];
                } // end if
            } // end if
            switch (pencilMode)
            {
                case 0:
                {
                    var _loc1 = new Floor(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                    break;
                } 
                case 1:
                {
                    _loc1 = new FloorAcc(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                    break;
                } 
                case 2:
                {
                    _loc1 = new FloorScenery(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2);
                    break;
                } 
            } // End of switch
            addLine(_loc1);
            if (pencilMode != 2)
            {
                if (prevLine != undefined)
                {
                    if (snaped == 1)
                    {
                        prevLine.addPrevLine(_loc1, checks[1]);
                    }
                    else
                    {
                        prevLine.addNextLine(_loc1, checks[1]);
                    } // end else if
                    _loc1.addPrevLine(prevLine, checks[1]);
                } // end if
                if (nextLine != undefined)
                {
                    if (_loc2[2] == 1)
                    {
                        nextLine.addPrevLine(_loc1, checks2[1]);
                    }
                    else
                    {
                        nextLine.addNextLine(_loc1, checks2[1]);
                    } // end else if
                    _loc1.addNextLine(nextLine, checks2[1]);
                } // end if
            } // end if
        } // end if
    };
    onEnterFrame = function ()
    {
    };
    onMouseMove = function ()
    {
    };
} // End of the function
function simulate()
{
    if (!Key.isDown(17))
    {
        onMouseDown = function ()
        {
        };
        onMouseUp = function ()
        {
        };
    } // end if
    bur = getTimer();
    onEnterFrame = function ()
    {
        bur = getTimer();
        if (!slowMotion || bur - pre > 200)
        {
            pre = bur;
            verlet(dots);
            dots2[1].x = dots2[1].x + Math.random() * 0.300000 * -Math.min(dots[5].dx, 125);
            dots2[1].y = dots2[1].y + Math.random() * 0.300000 * -Math.min(dots[5].dy, 125);
            verlet(dots2);
            satisfyConstraints();
            render();
            if (saveNow)
            {
                save();
                if (Key.isDown(67))
                {
                    tla.flag._visible = false;
                    tla.dummy._visible = true;
                    tla.dummy.sankac._x = world.sankac._x;
                    tla.dummy.sankac._y = world.sankac._y;
                    tla.dummy.sankac._rotation = world.sankac._rotation;
                    tla.dummy.roka1._x = world.roka1._x;
                    tla.dummy.roka1._y = world.roka1._y;
                    tla.dummy.roka1._rotation = world.roka1._rotation;
                    tla.dummy.roka2._x = world.roka2._x;
                    tla.dummy.roka2._y = world.roka2._y;
                    tla.dummy.roka2._rotation = world.roka2._rotation;
                    tla.dummy.noga1._x = world.noga1._x;
                    tla.dummy.noga1._y = world.noga1._y;
                    tla.dummy.noga1._rotation = world.noga1._rotation;
                    tla.dummy.noga2._x = world.noga2._x;
                    tla.dummy.noga2._y = world.noga2._y;
                    tla.dummy.noga2._rotation = world.noga2._rotation;
                    tla.dummy.sanke._x = world.sanke._x;
                    tla.dummy.sanke._y = world.sanke._y;
                    tla.dummy.sanke._rotation = world.sanke._rotation;
                    tla.dummy.sanke._yscale = world.sanke._yscale;
                    tla.dummy.sanke.gotoAndStop(world.sanke._currentframe);
                }
                else
                {
                    tla.dummy._visible = false;
                    tla.flag._visible = true;
                    if (BindStick.crash)
                    {
                        tla.flag._x = dots[4].x;
                        tla.flag._y = dots[4].y;
                    }
                    else
                    {
                        tla.flag._x = dots[1].x;
                        tla.flag._y = dots[1].y;
                    } // end else if
                } // end else if
                saveNow = false;
                riding = BindStick.crash;
                sledState = world.sanke._currentframe;
            } // end if
        } // end if
        ++frameCounter;
    };
    onMouseMove = function ()
    {
    };
} // End of the function
function nothing()
{
    onMouseDown = function ()
    {
    };
    onMouseMove = function ()
    {
    };
    onMouseUp = function ()
    {
    };
    onEnterFrame = function ()
    {
    };
} // End of the function
function gridPos(x, y)
{
    ggridPos = new Object();
    ggridPos.x = Math.floor(x / GRIDSIZE);
    ggridPos.y = Math.floor(y / GRIDSIZE);
    ggridPos.gx = x - GRIDSIZE * ggridPos.x;
    ggridPos.gy = y - GRIDSIZE * ggridPos.y;
    return (ggridPos);
} // End of the function
function register(line, x, y)
{
    var _loc1 = "x" + x;
    var _loc2 = "y" + y;
    var _loc4 = new Object();
    _loc4.storage = [];
    _loc4.storage2 = [];
    if (grid[_loc1] == undefined)
    {
        grid[_loc1] = [];
    } // end if
    if (grid[_loc1][_loc2] == undefined)
    {
        grid[_loc1][_loc2] = _loc4;
    } // end if
    line.grids.push([x, y]);
    if (line.type != 2)
    {
        grid[_loc1][_loc2].storage[line.name] = line;
    } // end if
    grid[_loc1][_loc2].storage2[line.name] = line;
} // End of the function
function removeFromGrid(line)
{
    for (var _loc1 = 0; _loc1 < line.grids.length; ++_loc1)
    {
        delete grid["x" + line.grids[_loc1][0]]["y" + line.grids[_loc1][1]].storage[line.name];
        delete grid["x" + line.grids[_loc1][0]]["y" + line.grids[_loc1][1]].storage2[line.name];
    } // end of for
} // End of the function
function lineBoxCheck(line, box)
{
    var _loc7 = line.x - box.x;
    var _loc6 = line.y - box.y;
    var _loc4 = Math.abs(line.nx);
    var _loc3 = Math.abs(line.ny);
    var _loc9 = (_loc4 * box.hx + box.hy * _loc3) * _loc4 + (_loc4 * box.hx + _loc3 * box.hy) * _loc3;
    var _loc5 = line.nx * _loc7 + line.ny * _loc6;
    var _loc8 = Math.abs(_loc5 * line.nx) + Math.abs(_loc5 * line.ny);
    if (line.hx + box.hx < Math.abs(_loc7))
    {
        return (false);
    } // end if
    if (line.hy + box.hy < Math.abs(_loc6))
    {
        return (false);
    } // end if
    if (_loc9 < _loc8)
    {
        return (false);
    } // end if
    return (true);
} // End of the function
function verlet(dots)
{
    for (var _loc1 = 0; _loc1 < dots.length; ++_loc1)
    {
        dots[_loc1].verlet(a);
    } // end of for
} // End of the function
function renderLine(line)
{
    var _loc2 = line.parent;
    _loc2.clear();
    var _loc4 = line.nx > 0 ? (Math.ceil(line.nx)) : (Math.floor(line.nx));
    var _loc3 = line.ny > 0 ? (Math.ceil(line.ny)) : (Math.floor(line.ny));
    switch (line.type)
    {
        case 0:
        {
            _loc2.lineStyle(4 * SCALEDOWN, 26367, 100, true, "normal", "round");
            _loc2.moveTo(line.x1 + _loc4, line.y1 + _loc3);
            _loc2.lineTo(line.x2 + _loc4, line.y2 + _loc3);
            _loc2.lineStyle(4 * SCALEDOWN, 0, 100, true, "normal", "round");
            _loc2.moveTo(line.x1, line.y1);
            _loc2.lineTo(line.x2, line.y2);
            break;
        } 
        case 1:
        {
            _loc2.lineStyle(5 * SCALEDOWN, 13369344, 100, true, "normal", "none", "miter");
            _loc2.moveTo(line.x1 + _loc4, line.y1 + _loc3);
            _loc2.lineTo(line.x2 + _loc4, line.y2 + _loc3);
            _loc2.moveTo(line.x2, line.y2);
            _loc2.lineTo(line.x2 + (line.nx * 4 - line.dx * line.invDst * 5), line.y2 + (line.ny * 4 - line.dy * line.invDst * 5));
            _loc2.lineTo(line.x2 - line.dx * line.invDst * 5, line.y2 - line.dy * line.invDst * 5);
            _loc2.lineStyle(4 * SCALEDOWN, 0, 100, true, "normal", "round");
            _loc2.moveTo(line.x1, line.y1);
            _loc2.lineTo(line.x2, line.y2);
            break;
        } 
        case 2:
        {
            _loc2.lineStyle(4 * SCALEDOWN, 52224, 100, true, "normal", "round");
            _loc2.moveTo(line.x1, line.y1);
            _loc2.lineTo(line.x2, line.y2);
            break;
        } 
    } // End of switch
    _loc2.cacheAsBitmap = true;
} // End of the function
function render()
{
    if (Key.isDown(88))
    {
        var _loc3 = tla._xscale;
        var _loc1 = Math.max(_loc3 * 0.900000, 20);
        world._xscale = world._yscale = tla._xscale = tla._yscale = _loc1;
        world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc1 / _loc3);
        world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc1 / _loc3);
    } // end if
    if (Key.isDown(90))
    {
        _loc3 = tla._xscale;
        _loc1 = Math.min(_loc3 * 1.100000, 1400);
        world._xscale = world._yscale = tla._xscale = tla._yscale = _loc1;
        world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc1 / _loc3);
        world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc1 / _loc3);
    } // end if
    point1.x = dots[0].x;
    point1.y = dots[0].y;
    world.localToGlobal(point1);
    point2.x = dots[4].x;
    point2.y = dots[4].y;
    world.localToGlobal(point2);
    point3.x = dots[5].x;
    point3.y = dots[5].y;
    world.localToGlobal(point3);
    if (point2.x > barrierR)
    {
        var _loc5 = barrierR - point2.x;
    }
    else if (point2.x < barrierL)
    {
        _loc5 = barrierL - point2.x;
    }
    else
    {
        _loc5 = 0;
    } // end else if
    if (point2.y > barrierB)
    {
        offsety = barrierB - point2.y;
    }
    else if (point2.y < barrierT)
    {
        offsety = barrierT - point2.y;
    }
    else
    {
        var offsety = 0;
    } // end else if
    tla._x = world._x = world._x + _loc5;
    tla._y = world._y = world._y + offsety;
    world.clear();
    world.lineStyle(1 * SCALEDOWN, 0, 100);
    if (!BindStick.crash)
    {
        world.lineStyle(1 * SCALEDOWN, 0, 100);
        edges[17].render(world);
        edges[18].render(world);
    } // end if
    world.lineStyle(4 * SCALEDOWN * tla._xscale / 100, 16777215, 100, false, "none", "none");
    edges2[0].render(world);
    edges2[2].render(world);
    edges2[4].render(world);
    world.lineStyle(4 * SCALEDOWN * tla._xscale / 100, 13763074, 100, false, "none", "none");
    edges2[1].render(world);
    edges2[3].render(world);
    edges2[5].render(world);
    world.sanke._x = dots[0].x;
    world.sanke._y = dots[0].y;
    world.sankac._x = dots[4].x;
    world.sankac._y = dots[4].y;
    world.roka1._x = world.roka2._x = dots[5].x;
    world.roka1._y = world.roka2._y = dots[5].y;
    world.noga1._x = world.noga2._x = dots[4].x;
    world.noga1._y = world.noga2._y = dots[4].y;
    var _loc4 = dots[3].x - dots[0].x;
    var _loc2 = dots[3].y - dots[0].y;
    if (_loc4 * (dots[1].y - dots[0].y) - _loc2 * (dots[1].x - dots[0].x) < 0)
    {
        BindStick.crash = true;
        if (world.sanke._yscale != -SCALEDOWN * 100)
        {
            world.sanke._yscale = -SCALEDOWN * 100;
            world.sanke.gotoAndStop(2);
        } // end if
    }
    else if (world.sanke._yscale != SCALEDOWN * 100)
    {
        world.sanke._yscale = SCALEDOWN * 100;
    } // end else if
    if (_loc4 * (dots[5].y - dots[4].y) - _loc2 * (dots[5].x - dots[4].x) > 0)
    {
        BindStick.crash = true;
    } // end if
    world.sanke._rotation = Math.atan2(_loc2, _loc4) * TO_DEG;
    world.sankac._rotation = Math.atan2(dots[5].y - dots[4].y, dots[5].x - dots[4].x) * TO_DEG;
    world.noga1._rotation = Math.atan2(dots[8].y - dots[4].y, dots[8].x - dots[4].x) * TO_DEG;
    world.roka1._rotation = Math.atan2(dots[7].y - dots[5].y, dots[7].x - dots[5].x) * TO_DEG;
    world.noga2._rotation = Math.atan2(dots[9].y - dots[4].y, dots[9].x - dots[4].x) * TO_DEG;
    world.roka2._rotation = Math.atan2(dots[6].y - dots[5].y, dots[6].x - dots[5].x) * TO_DEG;
} // End of the function
function satisfyConstraints()
{
    colided = false;
    for (var _loc1 = 0; _loc1 < ITERATE; ++_loc1)
    {
        satisfyDistance(edges);
        satisfyBoundaries();
    } // end of for
    satisfyDistance(edges2);
} // End of the function
function satisfyBoundaries()
{
    for (var _loc7 = 0; _loc7 < dots.length; ++_loc7)
    {
        var _loc5 = dots[_loc7];
        var _loc6 = gridPos(_loc5.x, _loc5.y);
        for (var _loc4 = -1; _loc4 < 2; ++_loc4)
        {
            var _loc2 = "x" + (_loc6.x + _loc4);
            if (grid[_loc2] == undefined)
            {
                continue;
            } // end if
            for (var _loc3 = -1; _loc3 < 2; ++_loc3)
            {
                var _loc1 = "y" + (_loc6.y + _loc3);
                if (grid[_loc2][_loc1] == undefined)
                {
                    continue;
                } // end if
                for (var _loc8 in grid[_loc2][_loc1].storage2)
                {
                    if (grid[_loc2][_loc1].storage[_loc8].colide(_loc5))
                    {
                        colided = true;
                    } // end if
                } // end of for...in
            } // end of for
        } // end of for
    } // end of for
} // End of the function
function satisfyDistance(edges)
{
    for (var _loc1 = 0; _loc1 < edges.length; ++_loc1)
    {
        if (edges[_loc1].satisfyDistance())
        {
        } // end if
    } // end of for
} // End of the function
function cleanUp()
{
    for (var _loc1 = 0; _loc1 < edges.length; ++_loc1)
    {
        delete edges[_loc1];
    } // end of for
    for (var _loc1 = 0; _loc1 < dots.length; ++_loc1)
    {
        delete dots[_loc1];
    } // end of for
} // End of the function
function framerate()
{
    steuc.text = frameCounter + " fps";
    frameCounter = 0;
} // End of the function
function moveToStartPos()
{
    for (var _loc1 = 0; _loc1 < dots.length; ++_loc1)
    {
        dots[_loc1].x = dots[_loc1].x + tla.startPoint._x;
        dots[_loc1].y = dots[_loc1].y + tla.startPoint._y;
        dots[_loc1].vx = dots[_loc1].x - 0.800000 * SCALEDOWN;
        dots[_loc1].vy = dots[_loc1].y;
    } // end of for
    for (var _loc1 = 0; _loc1 < dots2.length; ++_loc1)
    {
        dots2[_loc1].x = dots2[_loc1].x + tla.startPoint._x;
        dots2[_loc1].y = dots2[_loc1].y + tla.startPoint._y;
        dots2[_loc1].vx = dots2[_loc1].x - 0.800000 * SCALEDOWN;
        dots2[_loc1].vy = dots2[_loc1].y;
    } // end of for
} // End of the function
function switchToRev6(flag)
{
    if (flag)
    {
        compatible = false;
        MAX_LENGTH = 2000;
        registerInGrid = function (line)
        {
            var _loc7 = gridPos(line.x1, line.y1);
            var _loc8 = gridPos(line.x2, line.y2);
            for (var _loc6 = Math.min(_loc7.x, _loc8.x); _loc6 <= Math.max(_loc8.x, _loc7.x); ++_loc6)
            {
                for (var _loc4 = Math.min(_loc7.y, _loc8.y); _loc4 <= Math.max(_loc8.y, _loc7.y); ++_loc4)
                {
                    var _loc1 = new Object();
                    _loc1.storage = [];
                    _loc1.storage2 = [];
                    _loc1.x = _loc6 * GRIDSIZE + GRIDSIZE * 0.500000;
                    _loc1.y = _loc4 * GRIDSIZE + GRIDSIZE * 0.500000;
                    _loc1.hx = _loc1.hy = GRIDSIZE * 0.500000;
                    burek = lineBoxCheck(line, _loc1);
                    if (burek)
                    {
                        var _loc2 = "x" + _loc6;
                        var _loc5 = "y" + _loc4;
                        if (grid[_loc2] == undefined)
                        {
                            grid[_loc2] = [];
                        } // end if
                        if (grid[_loc2][_loc5] == undefined)
                        {
                            grid[_loc2][_loc5] = _loc1;
                        } // end if
                        line.grids.push([_loc6, _loc4]);
                        if (line.type != 2)
                        {
                            grid[_loc2][_loc5].storage[line.name] = line;
                        } // end if
                        grid[_loc2][_loc5].storage2[line.name] = line;
                    } // end if
                } // end of for
            } // end of for
        };
    }
    else
    {
        compatible = true;
        MAX_LENGTH = 10000;
        registerInGrid = function (line)
        {
            var _loc1 = gridPos(line.x1, line.y1);
            var _loc10 = gridPos(line.x2, line.y2);
            if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc10.x && _loc1.y == _loc10.y)
            {
                register(line, _loc1.x, _loc1.y);
                return;
            }
            else
            {
                register(line, _loc1.x, _loc1.y);
            } // end else if
            var _loc12 = line.dx > 0 ? (_loc10.x) : (_loc1.x);
            var _loc15 = line.dx > 0 ? (_loc1.x) : (_loc10.x);
            var _loc11 = line.dy > 0 ? (_loc10.y) : (_loc1.y);
            var _loc14 = line.dy > 0 ? (_loc1.y) : (_loc10.y);
            box2._visible = true;
            var _loc5 = line.x1;
            var _loc2 = line.y1;
            if (line.dx != 0 && line.dy != 0)
            {
                var _loc9 = line.dy / line.dx;
                var _loc13 = 1 / _loc9;
                var _loc8 = line.y1 - _loc9 * line.x1;
            } // end if
            while (true)
            {
                var _loc6 = line.dx > 0 ? (GRIDSIZE - _loc1.gx) : (-(_loc1.gx + 1));
                var _loc4 = line.dy > 0 ? (GRIDSIZE - _loc1.gy) : (-(_loc1.gy + 1));
                if (line.dx == 0)
                {
                    _loc2 = _loc2 + _loc4;
                }
                else if (line.dy == 0)
                {
                    _loc5 = _loc5 + _loc6;
                }
                else
                {
                    var _loc7 = Math.round(_loc9 * (_loc5 + _loc6) + _loc8);
                    if (Math.abs(_loc7 - _loc2) < Math.abs(_loc4))
                    {
                        _loc5 = _loc5 + _loc6;
                        _loc2 = _loc7;
                    }
                    else if (Math.abs(_loc7 - _loc2) == Math.abs(_loc4))
                    {
                        _loc5 = _loc5 + _loc6;
                        _loc2 = _loc2 + _loc4;
                    }
                    else
                    {
                        _loc5 = Math.round((_loc2 + _loc4 - _loc8) * _loc13);
                        _loc2 = _loc2 + _loc4;
                    } // end else if
                } // end else if
                _loc1 = gridPos(_loc5, _loc2);
                if (_loc1.x >= _loc15 && _loc1.x <= _loc12 && _loc1.y >= _loc14 && _loc1.y <= _loc11)
                {
                    register(line, _loc1.x, _loc1.y);
                    continue;
                } // end if
                return;
            } // end while
        };
    } // end else if
} // End of the function
stop ();
Stage.align = "TL";
barrierR = Stage.width * 0.618030;
barrierL = Stage.width * 0.381970;
barrierT = Stage.height * 0.381970;
barrierB = Stage.height * 0.618030;
resize = new Object();
navodila._x = Stage.width * 0.500000;
navodila._y = Stage.height * 0.500000;
navodila.cover._width = Stage.width;
navodila.cover._height = Stage.height;
navodila.cover._x = -Stage.width * 0.500000;
navodila.cover._y = -Stage.height * 0.500000;
resize.onResize = function ()
{
    helpscreen.icons._x = helpscreen.texts._x = panel._x = Stage.width * 0.500000;
    steuc._width = Stage.width - (panel._x + panel._width * 0.500000) - 25;
    steuc._x = Math.max(Stage.width - steuc._width - 15, panel._x + panel._width * 0.500000);
    barrierR = Stage.width * 0.618030;
    barrierL = Stage.width * 0.381970;
    barrierT = Stage.height * 0.381970;
    barrierB = Stage.height * 0.618030;
    navodila._x = Stage.width * 0.500000;
    navodila._y = Stage.height * 0.500000;
    navodila.cover._width = Stage.width;
    navodila.cover._height = Stage.height;
    navodila.cover._x = -Stage.width * 0.500000;
    navodila.cover._y = -Stage.height * 0.500000;
    helpscreen.back._y = help._y = Stage.height - 24;
    compas._y = Stage.height - 14;
    compas._x = Stage.width * 0.500000;
    helpscreen.icons._x = Stage.width * 0.500000;
    helpscreen.background._width = Stage.width;
    helpscreen.background._height = Stage.height;
};
resize.onResize();
Stage.addListener(resize);
var edges;
var edges2;
var dots;
var dots2;
var ITERATE = 6;
var SCALEDOWN = 0.500000;
var INVSCALE = 200;
var ENDURANCE = 0.057000;
var BLINK_RATE = 0.428571;
var AIR_FRICTION = 0.900000;
var SNAP_DISTANCE = 14;
var ERASER_SIZE = 5;
var MAX_LENGTH = 10000;
var MIN_LENGTH = 10;
var MIN_ANGLE = 0.030000;
var GRIDSIZE = 14;
var TO_DEG = 57.295780;
var simulation = false;
var frameCounter = 0;
var canvasX = 0;
var canvasY = 0;
var bufScale = 100;
var a = {x: 0, y: 0.350000 * SCALEDOWN};
var colided;
var active = true;
var active2 = true;
var point1 = new Object();
var point2 = new Object();
var point3 = new Object();
var tmpPoint = new Object();
var dataStorage = new Object();
var startLine;
var saved = false;
var saveNow = false;
var riding;
var sledState;
var Lines = 0;
var totLines = 0;
var lines = new Object();
var pencilMode = 0;
var lastTool;
var tempZoom;
var ttZoom;
var undoList = [];
var pre = 0;
var bur = 0;
var slowMotion = false;
var segments;
var tempLine = new Object();
var checks = [];
var prevLine;
var snaped;
var tempLines;
var loadPerFrame = 15;
var compatible = true;
var VERSION = "6.1";
Key.addListener(this);
BindStick.crash = false;
FloorBase.zone = 20 * SCALEDOWN;
world.sanke._xscale = world.sanke._yscale = world.sankac._xscale = world.sankac._yscale = world.roka1._xscale = world.roka1._yscale = world.roka2._xscale = world.roka2._yscale = world.noga1._xscale = world.noga1._yscale = world.noga2._xscale = world.noga2._yscale = SCALEDOWN * 100;
tla.dummy.sanke._xscale = tla.dummy.sanke._yscale = tla.dummy.sankac._xscale = tla.dummy.sankac._yscale = tla.dummy.roka1._xscale = tla.dummy.roka1._yscale = tla.dummy.roka2._xscale = tla.dummy.roka2._yscale = tla.dummy.noga1._xscale = tla.dummy.noga1._yscale = tla.dummy.noga2._xscale = tla.dummy.noga2._yscale = SCALEDOWN * 100;
tla.dummy._visible = false;
tla.flag._visible = false;
tla.startPoint.help._visible = false;
kakica.focusEnabled = true;
var savedTracks = SharedObject.getLocal("savedLines", "/");
if (savedTracks.data.trackList == undefined)
{
    savedTracks.data.trackList = [];
} // end if
panel.fileDialog.savedTracks.dataProvider = savedTracks.data.trackList;
panel.fileDialog.savedTracks.defaultIcon = "rev6";
panel.fileDialog.savedTracks.iconFunction = function (item)
{
    var _loc1 = item.version;
    if (_loc1 < 6.100000 || _loc1 == undefined)
    {
        return ("rev6");
    }
    else if (_loc1 == 6.100000)
    {
        return ("rev6.1");
    } // end else if
};
panel.fileDialog._visible = false;
panel.confirmDialog._visible = false;
helpscreen._visible = false;
helpscreen.Continue.onPress = function ()
{
    helpscreen._visible = false;
    cursorImage(lastTool);
};
var mouseListener = new Object();
mouseListener.onMouseWheel = function (delta)
{
    if (simulation == false && cursorMode == "zoom")
    {
        var _loc1 = tla._xscale;
        var _loc2 = Math.min(Math.max(_loc1 + _loc1 * 0.040000 * delta, 5), 300);
        tla._x = Stage.width * 0.500000 + (canvasX - Stage.width * 0.500000) * (_loc2 / _loc1);
        tla._y = Stage.height * 0.500000 + (canvasY - Stage.height * 0.500000) * (_loc2 / _loc1);
        tla._xscale = tla._yscale = _loc2;
        bufScale = tla._xscale;
        canvasX = tla._x;
        canvasY = tla._y;
    } // end if
};
Mouse.addListener(mouseListener);
cursor.onMouseMove = function ()
{
    cursor._x = _xmouse;
    cursor._y = _ymouse;
};
cursorImage = function (Mode)
{
    switch (Mode)
    {
        case "pencil":
        {
            Mouse.hide();
            cursor._visible = true;
            cursor.gotoAndStop(1);
            cursorMode = Mode;
            break;
        } 
        case "hand":
        {
            Mouse.hide();
            cursor._visible = true;
            cursor.gotoAndStop(2);
            cursorMode = Mode;
            break;
        } 
        case "eraser":
        {
            Mouse.hide();
            cursor._visible = true;
            cursor.gotoAndStop(3);
            cursorMode = Mode;
            break;
        } 
        case "zoom":
        {
            Mouse.hide();
            cursor._visible = true;
            cursor.gotoAndStop(4);
            cursorMode = Mode;
            break;
        } 
        case "normal":
        {
            Mouse.show();
            cursor._visible = false;
            cursorMode = Mode;
            break;
        } 
        case "line":
        {
            Mouse.hide();
            cursor._visible = true;
            cursor.gotoAndStop(5);
            cursorMode = Mode;
            break;
        } 
    } // End of switch
};
panelMode = function (Mode)
{
    if (Mode == "draw")
    {
        panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = true;
        panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 100;
        panel.flagB.gotoAndStop(2);
        active2 = true;
        compas._visible = true;
        tla.startPoint._visible = true;
    }
    else if (Mode == "simulate")
    {
        panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = false;
        panel.saveB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = true;
        panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = 30;
        panel.saveB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 100;
        panel.flagB.gotoAndStop(1);
        panel.swatches._visible = false;
        compas._visible = false;
        tla.startPoint._visible = false;
    }
    else if (Mode == "save")
    {
        panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = false;
        panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 30;
        panel.flagB.gotoAndStop(1);
        panel.swatches._visible = false;
    } // end else if
};
panel.lineB.onRollOver = panel.swatches.green.onRollOver = panel.swatches.red.onRollOver = panel.swatches.blue.onRollOver = panel.zoomB.onRollOver = panel.eraserB.onRollOver = panel.flagB.onRollOver = panel.handB.onRollOver = panel.pencilB.onRollOver = panel.playB.onRollOver = panel.stopB.onRollOver = panel.saveB.onRollOver = panel.trashB.onRollOver = function ()
{
    active2 = false;
    cursor._visible = false;
    Mouse.show();
};
panel.lineB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.lineB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel.playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.trashB.onReleaseOutside = function ()
{
    active2 = true;
    cursorImage(cursorMode);
};
tla.startPoint.onPress = function ()
{
    if (Key.isDown(68))
    {
        if (Key.isDown(16))
        {
            var _loc1 = getFirstLine();
            if (_loc1 != undefined)
            {
                tla.startPoint._x = _loc1.x1;
                tla.startPoint._y = _loc1.y1 - 50 * SCALEDOWN;
                pointToStartPoint();
            } // end if
        }
        else
        {
            startDrag (tla.startPoint, false);
            tla.startPoint.gotoAndStop(2);
            tla.startPoint.onMouseMove = function ()
            {
                pointToStartPoint();
            };
        } // end if
    } // end else if
};
tla.startPoint.onRelease = function ()
{
    stopDrag ();
    tla.startPoint.gotoAndStop(1);
    tla.startPoint.onMouseMove = function ()
    {
    };
};
tla.startPoint.onRollOver = function ()
{
    tla.startPoint.help._visible = true;
    active2 = false;
    cursor._visible = false;
    Mouse.show();
};
tla.startPoint.onRollOut = function ()
{
    tla.startPoint.help._visible = false;
    active2 = true;
    cursorImage(cursorMode);
};
tla.startPoint.onReleaseOutside = function ()
{
    tla.startPoint.onRelease();
    tla.startPoint.onRollOut();
};
panel.handB.onPress = function ()
{
    cursorMode = "hand";
    drawPencil();
    tla._x = canvasX;
    tla._y = canvasY;
    panel.swatches._visible = false;
    lastTool = "hand";
};
panel.swatches.blue.onPress = function ()
{
    pencilMode = 0;
    cursor.pencil.gotoAndStop(1);
    panel.swatches.selected._x = 15;
};
panel.swatches.red.onPress = function ()
{
    pencilMode = 1;
    cursor.pencil.gotoAndStop(2);
    panel.swatches.selected._x = 45;
};
panel.swatches.green.onPress = function ()
{
    pencilMode = 2;
    cursor.pencil.gotoAndStop(3);
    panel.swatches.selected._x = 75;
};
panel.pencilB.onPress = function ()
{
    cursorMode = "pencil";
    drawPencil();
    tla._x = canvasX;
    tla._y = canvasY;
    panel.swatches._visible = true;
    lastTool = "pencil";
};
panel.lineB.onPress = function ()
{
    cursorMode = "line";
    drawLine();
    tla._x = canvasX;
    tla._y = canvasY;
    panel.swatches._visible = true;
    lastTool = "line";
};
panel.trashB.onPress = function ()
{
    cursorImage("normal");
    switchToRev6(false);
    panelMode("save");
    panel.confirmDialog._visible = true;
    panel.confirmDialog.text.text = "Are you sure you want to delete the track?";
    enableConfirmButtons();
    panel.confirmDialog.Yes.onRelease = function ()
    {
        disableConfirmButtons();
        saved = false;
        tla.dummy._visible = false;
        tla.flag._visible = false;
        steuc.text = "0 lines";
        reset();
        panel.confirmDialog._visible = false;
        cursorImage(lastTool);
        panelMode("draw");
        panel[lastTool + "B"].onPress();
        undoList = [];
    };
    panel.confirmDialog.No.onRelease = function ()
    {
        panel.confirmDialog._visible = false;
        cursorImage(lastTool);
        panelMode("draw");
        panel[lastTool + "B"].onPress();
        disableConfirmButtons();
    };
};
panel.zoomB.onPress = function ()
{
    if (Key.isDown(16))
    {
        var _loc2 = tla._xscale;
        var _loc1 = 100;
        tla._xscale = tla._yscale = _loc1;
        tla._x = Stage.width * 0.500000 + (canvasX - Stage.width * 0.500000) * (_loc1 / _loc2);
        tla._y = Stage.height * 0.500000 + (canvasY - Stage.height * 0.500000) * (_loc1 / _loc2);
    } // end if
    cursorMode = "zoom";
    panel.swatches._visible = false;
    zoom();
    lastTool = "zoom";
};
panel.playB.onPress = function ()
{
    if (Lines > 0)
    {
        clearInterval(framerateInterval);
        framerateInterval = setInterval(framerate, 1000);
        var _loc5 = cursorMode;
        slowMotion = false;
        cursorImage("normal");
        if (saved && !Key.isDown(65))
        {
            restore();
            if (!riding)
            {
                BindStick.crash = false;
                world.sanke.gotoAndStop(sledState);
            } // end if
        }
        else
        {
            if (!saved)
            {
                cleanUp();
                init();
            }
            else
            {
                resetPosition();
                BindStick.crash = false;
                world.sanke.gotoAndStop(1);
            } // end else if
            moveToStartPos();
        } // end else if
        tla.clear();
        if (!simulation)
        {
            simulation = true;
            panelMode("simulate");
            for (var _loc2 in lines)
            {
                var _loc1 = lines[_loc2];
                _loc1.parent.clear();
                _loc1.parent.lineStyle(4 * SCALEDOWN, 0, 100, false, "normal", "round");
                _loc1.parent.moveTo(_loc1.x1, _loc1.y1);
                _loc1.parent.lineTo(_loc1.x2, _loc1.y2);
            } // end of for...in
        } // end if
        if (!Key.isDown(16))
        {
            tla._xscale = tla._yscale = world._xscale = world._yscale = INVSCALE;
        } // end if
        world._xscale = world._yscale = tla._yscale;
        world._visible = true;
        help._visible = false;
        if (Key.isDown(90))
        {
            var _loc4 = tla._xscale;
            var _loc3 = Math.max(_loc4 * 0.900000, 20);
            world._xscale = world._yscale = tla._xscale = tla._yscale = _loc3;
            world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc3 / _loc4);
            world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc3 / _loc4);
        } // end if
        if (Key.isDown(88))
        {
            _loc4 = tla._xscale;
            _loc3 = Math.min(_loc4 * 1.100000, 400);
            world._xscale = world._yscale = tla._xscale = tla._yscale = _loc3;
            world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc3 / _loc4);
            world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc3 / _loc4);
        } // end if
        render();
        simulate();
    } // end if
};
panel.stopB.onPress = function ()
{
    panel[lastTool + "B"].onPress();
    if (tla.flag._visible)
    {
        panel.flagB.flagUp.gotoAndStop(2);
    } // end if
    world._visible = false;
    tla._x = canvasX;
    tla._y = canvasY;
    tla._xscale = tla._yscale = bufScale;
    simulation = false;
    for (var _loc1 in lines)
    {
        renderLine(lines[_loc1]);
    } // end of for...in
    clearInterval(framerateInterval);
    steuc.text = Lines + " lines";
    panelMode("draw");
    help._visible = true;
};
panel.saveB.onPress = function ()
{
    panel.stopB.onPress();
    cursorImage("normal");
    active = false;
    active2 = false;
    panel.fileDialog._visible = true;
    enableFileButtons();
    panelMode("save");
    var ver = compatible ? (VERSION) : ("6");
    trace ("save" + ver);
    panel.fileDialog.saveButton.onRelease = function ()
    {
        disableFileButtons();
        if (Lines > 0)
        {
            active = true;
            var _loc6 = new Array(Lines);
            var _loc3 = 0;
            for (var _loc7 in lines)
            {
                var _loc1 = lines[_loc7];
                _loc6[_loc3] = [_loc1.x1, _loc1.y1, _loc1.x2, _loc1.y2, _loc1.lim, Number(_loc1.inv), _loc1.prevLine, _loc1.nextLine, _loc1.name, _loc1.type];
                ++_loc3;
            } // end of for...in
            var _loc5 = removeSpaces(panel.fileDialog.name.text);
            var _loc4;
            for (var _loc2 = 0; _loc2 < savedTracks.data.trackList.length; ++_loc2)
            {
                if (savedTracks.data.trackList[_loc2].label == _loc5)
                {
                    _loc4 = _loc2;
                } // end if
            } // end of for
            if (_loc4 != undefined)
            {
                var _loc13 = savedTracks.data.trackList.splice(_loc4, 1);
            } // end if
            savedTracks.data.trackList.addItemAt(0, {label: _loc5, data: _loc6, level: totLines, startLine: [tla.startPoint._x, tla.startPoint._y], version: ver});
            savedTracks.flush(savedTracks.getSize());
            panel.fileDialog._visible = false;
            panelMode("draw");
            panel[lastTool + "B"].onPress();
            cursorImage(cursorMode);
        }
        else
        {
            panel.fileDialog.name.text = "there is nothing to save:)";
        } // end else if
    };
    panel.fileDialog.loadButton.onRelease = function ()
    {
        if (panel.fileDialog.savedTracks.selectedIndex != undefined)
        {
            disableFileButtons();
            undoList = [];
            reset();
            active = true;
            saved = false;
            tla.dummy._visible = false;
            tla.flag._visible = false;
            trace (panel.fileDialog.savedTracks.selectedIndex);
            buffer = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].data;
            var _loc5 = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].version;
            trace (savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].icon);
            trace ("load" + _loc5);
            switchToRev6(_loc5 < 6.100000 || _loc5 == undefined);
            panel.fileDialog._visible = false;
            segments = buffer.length - 1;
            perFrame = 0;
            loadBounds(buffer);
            showAll();
            if (tla._xscale > 100)
            {
                tla._xscale = tla._yscale = bufScale = 100;
                tla._x = tla._y = canvasX = canvasY = 0;
            } // end if
            panel.onEnterFrame = function ()
            {
                if (segments > 0)
                {
                    if (segments > loadPerFrame - 2)
                    {
                        segments = segments - loadPerFrame;
                        perFrame = loadPerFrame;
                    }
                    else
                    {
                        perFrame = segments;
                        segments = 0;
                    } // end else if
                    var _loc3 = 0;
                    if (_loc3 < perFrame + (segments == 0) ? (1) : (0))
                    {
                        var _loc1 = buffer[segments + perFrame - _loc3];
                        if (_loc1[9] == undefined)
                        {
                            _loc1[9] = 0;
                        } // end if
                        switch (_loc1[9])
                        {
                            case 0:
                            {
                                var _loc2 = new Floor(_loc1[0], _loc1[1], _loc1[2], _loc1[3], Boolean(_loc1[5]), _loc1[4]);
                                break;
                            } 
                            case 1:
                            {
                                _loc2 = new FloorAcc(_loc1[0], _loc1[1], _loc1[2], _loc1[3], Boolean(_loc1[5]), _loc1[4]);
                                break;
                            } 
                            case 2:
                            {
                                _loc2 = new FloorScenery(_loc1[0], _loc1[1], _loc1[2], _loc1[3]);
                                break;
                            } 
                        } // End of switch
                        ++Lines;
                        _loc2.name = _loc1[8];
                        undoList.push(_loc1[8]);
                        _loc2.prevLine = _loc1[6];
                        _loc2.nextLine = _loc1[7];
                        registerInGrid(_loc2);
                        lines["line" + _loc2.name] = _loc2;
                        var _loc4 = tla.createEmptyMovieClip(_loc2.name, tla.getNextHighestDepth());
                        _loc2.parent = _loc4;
                        renderLine(_loc2);
                        ++_loc3;
                        
                    } // end if
                    var _loc5 = Math.floor((buffer.length - segments) / buffer.length * 100);
                    steuc.text = Math.floor((buffer.length - segments) / buffer.length * 100) + "% loaded";
                }
                else
                {
                    finishLoad();
                } // end else if
            };
        } // end if
    };
    panel.fileDialog.deleteButton.onRelease = function ()
    {
        enableConfirmButtons();
        panel.confirmDialog._visible = true;
        panel.confirmDialog.text.text = "Are you sure you want to delete the track?";
        panel.confirmDialog.Yes.onRelease = function ()
        {
            disableConfirmButtons();
            panel.confirmDialog._visible = false;
            var _loc1 = panel.fileDialog.savedTracks.selectedIndex;
            savedTracks.data.trackList.removeItemAt(_loc1);
            panel.fileDialog.savedTracks.selectedIndex = Math.min(_loc1, panel.fileDialog.savedTracks.length - 1);
        };
        panel.confirmDialog.No.onRelease = function ()
        {
            disableConfirmButtons();
            panel.confirmDialog._visible = false;
        };
    };
    panel.fileDialog.close.onPress = function ()
    {
        active = true;
        panel[lastTool + "B"].onPress();
        cursorImage(cursorMode);
        panel.fileDialog._visible = false;
        panelMode("draw");
        disableFileButtons();
    };
};
panel.flagB.onPress = function ()
{
    if (simulation)
    {
        saveNow = true;
        saved = true;
    }
    else
    {
        saved = false;
        tla.dummy._visible = false;
        tla.flag._visible = false;
    } // end else if
};
panel.eraserB.onPress = function ()
{
    cursorMode = "eraser";
    panel.swatches._visible = false;
    onMouseDown = function ()
    {
        if (active2)
        {
            if (cursor._currentframe == 2)
            {
                pan();
            }
            else
            {
                erase(tla._xmouse, tla._ymouse);
                onMouseMove = function ()
                {
                    erase(tla._xmouse, tla._ymouse);
                };
            } // end if
        } // end else if
    };
    onMouseUp = function ()
    {
        canvasX = tla._x;
        canvasY = tla._y;
        onMouseMove = function ()
        {
        };
        stopDrag ();
        pointToStartPoint();
    };
    onEnterFrame = function ()
    {
    };
    lastTool = "eraser";
};
var oldScale;
var oldy;
var bufScale = 100;
registerInGrid = function (line)
{
    var _loc1 = gridPos(line.x1, line.y1);
    var _loc10 = gridPos(line.x2, line.y2);
    if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc10.x && _loc1.y == _loc10.y)
    {
        register(line, _loc1.x, _loc1.y);
        return;
    }
    else
    {
        register(line, _loc1.x, _loc1.y);
    } // end else if
    var _loc12 = line.dx > 0 ? (_loc10.x) : (_loc1.x);
    var _loc15 = line.dx > 0 ? (_loc1.x) : (_loc10.x);
    var _loc11 = line.dy > 0 ? (_loc10.y) : (_loc1.y);
    var _loc14 = line.dy > 0 ? (_loc1.y) : (_loc10.y);
    box2._visible = true;
    var _loc5 = line.x1;
    var _loc2 = line.y1;
    if (line.dx != 0 && line.dy != 0)
    {
        var _loc9 = line.dy / line.dx;
        var _loc13 = 1 / _loc9;
        var _loc8 = line.y1 - _loc9 * line.x1;
    } // end if
    while (true)
    {
        var _loc6 = line.dx > 0 ? (GRIDSIZE - _loc1.gx) : (-(_loc1.gx + 1));
        var _loc4 = line.dy > 0 ? (GRIDSIZE - _loc1.gy) : (-(_loc1.gy + 1));
        if (line.dx == 0)
        {
            _loc2 = _loc2 + _loc4;
        }
        else if (line.dy == 0)
        {
            _loc5 = _loc5 + _loc6;
        }
        else
        {
            var _loc7 = Math.round(_loc9 * (_loc5 + _loc6) + _loc8);
            if (Math.abs(_loc7 - _loc2) < Math.abs(_loc4))
            {
                _loc5 = _loc5 + _loc6;
                _loc2 = _loc7;
            }
            else if (Math.abs(_loc7 - _loc2) == Math.abs(_loc4))
            {
                _loc5 = _loc5 + _loc6;
                _loc2 = _loc2 + _loc4;
            }
            else
            {
                _loc5 = Math.round((_loc2 + _loc4 - _loc8) * _loc13);
                _loc2 = _loc2 + _loc4;
            } // end else if
        } // end else if
        _loc1 = gridPos(_loc5, _loc2);
        if (_loc1.x >= _loc15 && _loc1.x <= _loc12 && _loc1.y >= _loc14 && _loc1.y <= _loc11)
        {
            register(line, _loc1.x, _loc1.y);
            continue;
        } // end if
        return;
    } // end while
};
helpscreen.icons.pencilB.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(2);
    mouse.show();
};
helpscreen.icons.lineB.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(3);
    mouse.show();
};
helpscreen.icons.eraserB.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(4);
    mouse.show();
};
helpscreen.icons.zoomB.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(6);
    mouse.show();
};
helpscreen.icons.handB.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(7);
    mouse.show();
};
helpscreen.icons.playB.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(8);
    mouse.show();
};
helpscreen.icons.stopB.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(9);
    mouse.show();
};
helpscreen.icons.flagB.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(10);
    mouse.show();
};
helpscreen.icons.saveB.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(11);
    mouse.show();
};
helpscreen.icons.trashB.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(12);
    mouse.show();
};
helpscreen.icons.editor.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(13);
    mouse.show();
};
helpscreen.icons.simulator.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(14);
    mouse.show();
};
helpscreen.icons.red.onRollOver = helpscreen.icons.green.onRollOver = helpscreen.icons.blue.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(5);
    mouse.show();
};
helpscreen.icons.startPoint.onRollOver = function ()
{
    helpscreen.texts.gotoAndStop(15);
    mouse.show();
};
init();
reset();
drawPencil();
setInterval(blink, 1000);
panel.pencilB.onPress();
cursorImage("pencil");
