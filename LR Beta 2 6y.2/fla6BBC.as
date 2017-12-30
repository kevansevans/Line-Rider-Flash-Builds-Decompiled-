function displayZoom(zoom)
{
    var _loc1;
    if (slowMotion && simulation)
    {
        _loc1 = 1000 / slowMoFrameRate * 40;
    }
    else
    {
        _loc1 = 1000;
    } // end else if
    displayMessage(String(Math.round(zoom * 100) / 100), _loc1);
} // End of the function
function displayMessage(msg, len)
{
    zoomText._visible = true;
    zoomText.text = msg;
    clearInterval(zoomTextInterval);
    zoomTextInterval = setInterval(function ()
    {
        zoomText._visible = false;
        clearInterval(zoomTextInterval);
    }, len);
} // End of the function
function saveTrack(trackName, ver)
{
    var _loc4 = new Array(Lines);
    var _loc3 = 0;
    for (var _loc7 in lines)
    {
        var _loc1 = lines[_loc7];
        _loc4[_loc3] = [_loc1.x1, _loc1.y1, _loc1.x2, _loc1.y2, _loc1.lim, Number(_loc1.inv), _loc1.prevLine, _loc1.nextLine, _loc1.name, _loc1.type];
        ++_loc3;
    } // end of for...in
    var _loc5 = trackName;
    currTrackName = trackName;
    var _loc6;
    for (var _loc2 = 0; _loc2 < savedTracks.data.trackList.length; ++_loc2)
    {
        if (savedTracks.data.trackList[_loc2].label == _loc5)
        {
            _loc6 = _loc2;
        } // end if
    } // end of for
    if (_loc6 != undefined)
    {
        var _loc14 = savedTracks.data.trackList.splice(_loc6, 1);
    } // end if
    savedTracks.data.trackList.addItemAt(0, {label: _loc5, data: _loc4, level: totLines, startLine: [tla.startPoint._x, tla.startPoint._y], version: ver});
    savedTracks.flush(savedTracks.getSize());
} // End of the function
function saveAVersion()
{
    var _loc1 = new Date();
    var _loc2 = currTrackName.indexOf("_$") != -1 ? (currTrackName.substr(0, currTrackName.indexOf("_$"))) : (currTrackName);
    currTrackName = _loc2;
    tName = _loc2 + "_$(" + Lines + ")@" + _loc1.getFullYear() + "-" + _loc1.getMonth() + "-" + _loc1.getDay() + "@" + _loc1.getHours() + ":" + _loc1.getMinutes();
    saveTrack(tName, compatible);
    displayMessage("Saved " + tName, DEFAULT_MSG_LEN);
} // End of the function
function incrementLineCounts(lineType)
{
    ++Lines;
    if (lineType == 0)
    {
        ++blueLines;
    } // end if
    if (lineType == 1)
    {
        ++redLines;
    } // end if
    if (lineType == 2)
    {
        ++greenLines;
    } // end if
} // End of the function
function blink()
{
    if (Math.random() < BLINK_RATE)
    {
        world.body.face.uch1.play();
        world.body.face.uch2.play();
    } // end if
} // End of the function
function onKeyUp()
{
    if (Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "hand"))
    {
        cursorImage(cursor.temp);
    } // end if
    if (Key.getCode() == 81 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        panel.pencilB.onPress();
        cursorImage("pencil");
        setManipPoints();
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
    if (Key.getCode() == 49 && panel.swatches._visible == true && !numberEntry)
    {
        panel.swatches.blue.onPress();
    } // end if
    if (Key.getCode() == 50 && panel.swatches._visible == true && !numberEntry)
    {
        panel.swatches.red.onPress();
    } // end if
    if (Key.getCode() == 51 && panel.swatches._visible == true && !numberEntry)
    {
        panel.swatches.green.onPress();
    } // end if
    if ((Key.getCode() >= 48 && Key.getCode <= 57 || Key.getCode() >= 96 && Key.getCode <= 105) && numberEntry)
    {
        numberText = numberText + ("" + (Key.getAscii() - 48));
        displayMessage(numberText, DEFAULT_MSG_LEN);
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
        if (!Key.isDown(16))
        {
            undo();
        } // end if
        if (Key.isDown(16))
        {
            redo();
        } // end if
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
    if (Key.getCode() == 77 && !Key.isDown(16) && simulation == true)
    {
        slowMotion = !slowMotion;
    } // end if
    if (Key.getCode() == 86 && Lines > 0)
    {
        saveAVersion();
    } // end if
    if (Key.getCode() == 66 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        numberEntry = true;
        numberText = "";
        displayMessage("Type a zoom.", DEFAULT_MSG_LEN);
        var inter;
        inter = setInterval(function ()
        {
            numberEntry = false;
            if (numberText == "")
            {
                displayMessage("Never mind.", DEFAULT_MSG_LEN);
            }
            else
            {
                setZoom(new Number(numberText));
            } // end else if
            clearInterval(inter);
        }, 1000);
    } // end if
    if (Key.getCode() == 76 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        numberEntry = true;
        numberText = "";
        displayMessage("Type a slow motion frame rate.", DEFAULT_MSG_LEN);
        var inter;
        inter = setInterval(function ()
        {
            numberEntry = false;
            if (numberText == "")
            {
                displayMessage("Never mind.", DEFAULT_MSG_LEN);
            }
            else
            {
                slowMoFrameRate = Math.max(Math.min(new Number(numberText), 40), 1);
                displayMessage("Slow motion is now " + slowMoFrameRate + " fps", DEFAULT_MSG_LEN);
            } // end else if
            clearInterval(inter);
        }, 1000);
    } // end if
    if (Key.getCode() == 78 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        if (Key.isDown(16))
        {
            markedZoom = tla._xscale;
            displayMessage("Zoom marked at " + Math.round(markedZoom * 100) / 100, DEFAULT_MSG_LEN);
        }
        else
        {
            setZoom(markedZoom);
        } // end if
    } // end else if
} // End of the function
function showAll()
{
    var _loc3 = maxX - minX;
    var _loc4 = maxY - minY;
    var _loc5 = Stage.width / _loc3;
    var _loc6 = Stage.height / _loc4;
    var _loc1 = Math.min(_loc5, 3);
    var _loc2 = Math.min(_loc6, 3);
    if (_loc5 > _loc6)
    {
        bufScale = tla._xscale = tla._yscale = _loc2 * 100;
        canvasX = tla._x = -minX * _loc2 + (Stage.width - _loc3 * _loc2) * 0.500000;
        canvasY = tla._y = -minY * _loc2;
    }
    else
    {
        bufScale = tla._xscale = tla._yscale = _loc1 * 100;
        canvasX = tla._x = -minX * _loc1;
        canvasY = tla._y = -minY * _loc1 + (Stage.height - _loc4 * _loc1) * 0.500000;
    } // end else if
} // End of the function
function onKeyDown()
{
    if (Key.getCode() == 88 && Key.isDown(16) && advancedMode && !simulation)
    {
        xysnap_toggled = !xysnap_toggled;
        displayMessage(xysnap_toggled ? ("XY Snap Toggle: ON") : ("XY Snap Toggle: OFF"), DEFAULT_MSG_LEN);
    } // end if
    if (Key.getCode() == 67 && !simulation && Key.isDown(16))
    {
        colorPlaybackToggle = !colorPlaybackToggle;
        displayMessage(colorPlaybackToggle ? ("Color Playback Toggle: ON") : ("Color Playback Toggle: OFF"), DEFAULT_MSG_LEN);
    } // end if
    if (Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "line") && drawing == false)
    {
        var _loc2 = cursorMode;
        cursor.temp = _loc2;
        cursorImage("hand");
    } // end if
    if (Key.getCode() == 77 && Key.isDown(16))
    {
        stickySlowMo = !stickySlowMo;
        displayMessage(stickySlowMo ? ("Sticky Slow Motion Toggle: ON") : ("Sticky Slow Motion Toggle: OFF"), DEFAULT_MSG_LEN);
    } // end if
    if (Key.getCode() == 71 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
    {
        var _loc1 = !panel._visible;
        panel._visible = statusText._visible = statusText_blue._visible = statusText_red._visible = statusText_green._visible = compas._visible = swatchTypes._visible = _loc1;
        if (simulation)
        {
            compas._visible = false;
        } // end if
        if (panel._visible)
        {
            swatchTypes._visible = countsVisible;
        } // end if
        if (!_loc1)
        {
            displayMessage("GUI Hidden. Press G to bring it back.", DEFAULT_MSG_LEN);
        }
        else
        {
            displayMessage("GUI restored.", DEFAULT_MSG_LEN);
        } // end if
    } // end else if
} // End of the function
function setZoom(temp1)
{
    temp1 = Math.min(Math.max(temp1, ZOOM_MIN), ZOOM_MAX);
    var _loc1 = new Object();
    _loc1.x = Stage.width * 0.500000;
    _loc1.y = Stage.height * 0.500000;
    tla.globalToLocal(_loc1);
    world._xscale = world._yscale = tla._xscale = tla._yscale = temp1;
    showPos(_loc1.x, _loc1.y);
    displayZoom(temp1);
} // End of the function
function showPos(xPos, yPos)
{
    tmpPoint.x = xPos;
    tmpPoint.y = yPos;
    tla.localToGlobal(tmpPoint);
    world._x = tla._x = Stage.width * 0.500000 - tmpPoint.x + tla._x;
    world._y = tla._y = Stage.height * 0.500000 - tmpPoint.y + tla._y;
    if (!simulation)
    {
        canvasX = tla._x;
        canvasY = tla._y;
    } // end if
} // End of the function
function pointToStartPoint()
{
    var _loc2 = new Object();
    _loc2.x = tla.startPoint._x;
    _loc2.y = tla.startPoint._y;
    var _loc1 = new Object();
    _loc1.x = compas._x;
    _loc1.y = compas._y;
    tla.globalToLocal(_loc1);
    compas.distance.text = Math.floor(Math.sqrt(Math.pow(_loc2.x - _loc1.x, 2) + Math.pow(_loc2.y - _loc1.y, 2))) + " pixels";
    compas.dial._rotation = Math.atan2(_loc2.y - _loc1.y, _loc2.x - _loc1.x) * TO_DEG;
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
    totLines = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].level;
    panel[lastTool + "B"].onPress();
    cursorImage(cursorMode);
    panelMode("draw");
    pointToStartPoint();
    statusText.text = Lines + " lines";
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
function loadBounds(lineArray)
{
    maxX = 0;
    maxY = 0;
    minX = Stage.width;
    minY = Stage.height;
    for (var _loc3 in lineArray)
    {
        var _loc1 = lineArray[_loc3];
        maxX = Math.max(maxX, Math.max(_loc1[0], _loc1[2]));
        maxY = Math.max(maxY, Math.max(_loc1[1], _loc1[3]));
        minX = Math.min(minX, Math.min(_loc1[0], _loc1[2]));
        minY = Math.min(minY, Math.min(_loc1[1], _loc1[3]));
    } // end of for...in
} // End of the function
function init()
{
    BindStick.crash = false;
    riderAnchors = [];
    scarfAnchors = [];
    riderAnchors[0] = new Point(0, 0, 0.800000);
    riderAnchors[1] = new Point(0, 10, 0);
    riderAnchors[2] = new Point(30, 10, 0);
    riderAnchors[3] = new Point(35, 0, 0);
    riderAnchors[4] = new Point(10, 0, 0.800000);
    riderAnchors[5] = new Point(10, -11, 0.800000);
    riderAnchors[6] = new Point(23, -10, 0.100000, true);
    riderAnchors[7] = new Point(23, -10, 0.100000);
    riderAnchors[8] = new Point(20, 10, 0);
    riderAnchors[9] = new Point(20, 10, 0);
    scarfAnchors[0] = new PointAirFri(7, -10, AIR_FRICTION);
    scarfAnchors[1] = new PointAirFri(3, -10, AIR_FRICTION);
    scarfAnchors[2] = new PointAirFri(0, -10, AIR_FRICTION);
    scarfAnchors[3] = new PointAirFri(-4, -10, AIR_FRICTION);
    scarfAnchors[4] = new PointAirFri(-7, -10, AIR_FRICTION);
    scarfAnchors[5] = new PointAirFri(-11, -10, AIR_FRICTION);
    for (var _loc1 = 0; _loc1 < riderAnchors.length; ++_loc1)
    {
        riderAnchors[_loc1].x = riderAnchors[_loc1].x * SCALEDOWN;
        riderAnchors[_loc1].y = riderAnchors[_loc1].y * SCALEDOWN;
    } // end of for
    for (var _loc1 = 0; _loc1 < scarfAnchors.length; ++_loc1)
    {
        scarfAnchors[_loc1].x = scarfAnchors[_loc1].x * SCALEDOWN;
        scarfAnchors[_loc1].y = scarfAnchors[_loc1].y * SCALEDOWN;
    } // end of for
    world.sled.gotoAndStop(1);
    world.sled._xscale = world.sled._yscale = world.body._xscale = world.body._yscale = world.arm1._xscale = world.arm1._yscale = world.arm2._xscale = world.arm2._yscale = world.leg1._xscale = world.leg1._yscale = world.leg2._xscale = world.leg2._yscale = SCALEDOWN * 100;
    edges = [];
    edges2 = [];
    edges[0] = new Stick(riderAnchors[0], riderAnchors[1]);
    edges[1] = new Stick(riderAnchors[1], riderAnchors[2]);
    edges[2] = new Stick(riderAnchors[2], riderAnchors[3]);
    edges[3] = new Stick(riderAnchors[3], riderAnchors[0]);
    edges[4] = new Stick(riderAnchors[0], riderAnchors[2]);
    edges[5] = new Stick(riderAnchors[3], riderAnchors[1]);
    edges[6] = new BindStick(riderAnchors[0], riderAnchors[4], ENDURANCE);
    edges[8] = new BindStick(riderAnchors[1], riderAnchors[4], ENDURANCE);
    edges[9] = new BindStick(riderAnchors[2], riderAnchors[4], ENDURANCE);
    edges[10] = new Stick(riderAnchors[5], riderAnchors[4]);
    edges[11] = new Stick(riderAnchors[5], riderAnchors[6]);
    edges[12] = new Stick(riderAnchors[5], riderAnchors[7]);
    edges[13] = new Stick(riderAnchors[4], riderAnchors[8]);
    edges[14] = new Stick(riderAnchors[4], riderAnchors[9]);
    edges[15] = new Stick(riderAnchors[5], riderAnchors[7]);
    edges[16] = new BindStick(riderAnchors[5], riderAnchors[0], ENDURANCE);
    edges[17] = new BindStick(riderAnchors[3], riderAnchors[6], ENDURANCE);
    edges[18] = new BindStick(riderAnchors[3], riderAnchors[7], ENDURANCE);
    edges[19] = new BindStick(riderAnchors[8], riderAnchors[2], ENDURANCE);
    edges[20] = new BindStick(riderAnchors[9], riderAnchors[2], ENDURANCE);
    edges[21] = new RepellStick(riderAnchors[5], riderAnchors[8]);
    edges[22] = new RepellStick(riderAnchors[5], riderAnchors[9]);
    edges[21].restLength = edges[21].restLength * 0.500000;
    edges[22].restLength = edges[22].restLength * 0.500000;
    edges2[0] = new Shal(riderAnchors[5], scarfAnchors[0]);
    edges2[1] = new Shal(scarfAnchors[0], scarfAnchors[1]);
    edges2[2] = new Shal(scarfAnchors[1], scarfAnchors[2]);
    edges2[3] = new Shal(scarfAnchors[2], scarfAnchors[3]);
    edges2[4] = new Shal(scarfAnchors[3], scarfAnchors[4]);
    edges2[5] = new Shal(scarfAnchors[4], scarfAnchors[5]);
} // End of the function
function reset()
{
    redoLineList = [];
    redoList = [];
    lineToUndo = 0;
    startLine = undefined;
    for (var _loc1 in lines)
    {
        removeLine(lines[_loc1]);
    } // end of for...in
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
    flagTime = 0;
    currTrackName = "Untitled Track";
} // End of the function
function snap(x, y, vert, invert)
{
    var _loc2 = Math.pow(SNAP_DISTANCE / (tla._xscale * 0.010000), 2);
    var _loc11 = x;
    var _loc10 = y;
    var _loc18;
    var _loc17;
    var _loc7;
    var _loc6;
    var _loc8 = false;
    var _loc15 = gridPos(x, y);
    var _loc9;
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
                    _loc7 = Math.pow(x - _loc1.x1, 2) + Math.pow(y - _loc1.y1, 2);
                    _loc6 = Math.pow(x - _loc1.x2, 2) + Math.pow(y - _loc1.y2, 2);
                    if (_loc7 < _loc2 && _loc1.prevLine == undefined)
                    {
                        _loc2 = _loc7;
                        _loc11 = _loc1.x1;
                        _loc10 = _loc1.y1;
                        _loc8 = 1;
                        _loc9 = _loc1;
                    } // end if
                    if (_loc6 < _loc2 && _loc1.nextLine == undefined)
                    {
                        _loc2 = _loc6;
                        _loc11 = _loc1.x2;
                        _loc10 = _loc1.y2;
                        _loc8 = 2;
                        _loc9 = _loc1;
                    } // end if
                } // end of for...in
            } // end of for
        } // end of for
        _loc18 = vert == _loc8;
        _loc17 = invert == _loc9.inv;
        if (!(_loc18 && !_loc17 || !_loc18 && _loc17) || _loc9.type == 2)
        {
            _loc8 = false;
            _loc9 = undefined;
            _loc11 = x;
            _loc10 = y;
        } // end if
    } // end if
    return ([_loc11, _loc10, _loc8, _loc9]);
} // End of the function
function resetPosition()
{
    riderAnchors[0].x = 0;
    riderAnchors[0].y = 0;
    riderAnchors[1].x = 0;
    riderAnchors[1].y = 10;
    riderAnchors[2].x = 30;
    riderAnchors[2].y = 10;
    riderAnchors[3].x = 35;
    riderAnchors[3].y = 0;
    riderAnchors[4].x = 10;
    riderAnchors[4].y = 0;
    riderAnchors[5].x = 10;
    riderAnchors[5].y = -11;
    riderAnchors[6].x = 23;
    riderAnchors[6].y = -10;
    riderAnchors[7].x = 23;
    riderAnchors[7].y = -10;
    riderAnchors[8].x = 20;
    riderAnchors[8].y = 10;
    riderAnchors[9].x = 20;
    riderAnchors[9].y = 10;
    scarfAnchors[0].x = 7;
    scarfAnchors[0].y = -10;
    scarfAnchors[1].x = 3;
    scarfAnchors[1].y = -10;
    scarfAnchors[2].x = 0;
    scarfAnchors[2].y = -10;
    scarfAnchors[3].x = -4;
    scarfAnchors[3].y = -10;
    scarfAnchors[4].x = -7;
    scarfAnchors[4].y = -10;
    scarfAnchors[5].x = -11;
    scarfAnchors[5].y = -10;
    for (var _loc1 = 0; _loc1 < riderAnchors.length; ++_loc1)
    {
        riderAnchors[_loc1].x = riderAnchors[_loc1].x * SCALEDOWN;
        riderAnchors[_loc1].y = riderAnchors[_loc1].y * SCALEDOWN;
    } // end of for
    for (var _loc1 = 0; _loc1 < scarfAnchors.length; ++_loc1)
    {
        scarfAnchors[_loc1].x = scarfAnchors[_loc1].x * SCALEDOWN;
        scarfAnchors[_loc1].y = scarfAnchors[_loc1].y * SCALEDOWN;
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
                var _loc2 = x - _loc1.x1;
                var _loc3 = y - _loc1.y1;
                var _loc10 = Math.sqrt(Math.pow(_loc2, 2) + Math.pow(_loc3, 2));
                var _loc9 = Math.sqrt(Math.pow(x - _loc1.x2, 2) + Math.pow(y - _loc1.y2, 2));
                var _loc11 = Math.abs(_loc1.nx * _loc2 + _loc1.ny * _loc3);
                var _loc5 = (_loc2 * _loc1.dx + _loc3 * _loc1.dy) * _loc1.invSqrDis;
                if (_loc10 < ERASER_SIZE * _loc8 || _loc9 < ERASER_SIZE * _loc8 || _loc11 < ERASER_SIZE * _loc8 && _loc5 >= 0 && _loc5 <= 1)
                {
                    if (colorEraser != true)
                    {
                        removeLine(_loc1);
                    } // end if
                    if (colorEraser && _loc1.type == pencilMode)
                    {
                        removeLine(_loc1);
                    } // end if
                } // end if
            } // end of for...in
        } // end of for
    } // end of for
} // End of the function
function save()
{
    for (var _loc2 in riderAnchors)
    {
        riderAnchors[_loc2].savePoint();
    } // end of for...in
    for (var _loc1 in scarfAnchors)
    {
        scarfAnchors[_loc1].savePoint();
    } // end of for...in
} // End of the function
function restore()
{
    for (var _loc2 in riderAnchors)
    {
        riderAnchors[_loc2].restore();
    } // end of for...in
    for (var _loc1 in scarfAnchors)
    {
        scarfAnchors[_loc1].restore();
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
                    var _loc2 = Key.isDown(16) ? (0.250000) : (0.500000);
                    var _loc1 = Math.min(Math.max(oldScale + (oldy - _ymouse) * _loc2, ZOOM_MIN), ZOOM_MAX);
                    tla._xscale = tla._yscale = _loc1;
                    tla._x = Stage.width * 0.500000 + (canvasX - Stage.width * 0.500000) * (_loc1 / oldScale);
                    tla._y = Stage.height * 0.500000 + (canvasY - Stage.height * 0.500000) * (_loc1 / oldScale);
                    displayZoom(tla._xscale);
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
    var _loc1 = undoList.length - 1;
    var _loc2;
    while (_loc2 == undefined && Lines > 0)
    {
        _loc2 = lines[undoList[_loc1]];
        --_loc1;
    } // end while
    return (_loc2);
} // End of the function
function getFirstLine()
{
    var _loc1 = 0;
    var _loc2;
    while (_loc2 == undefined && Lines > 0)
    {
        _loc2 = lines[undoList[_loc1]];
        ++_loc1;
    } // end while
    return (_loc2);
} // End of the function
function undo()
{
    var _loc1;
    while (_loc1 == undefined && Lines > 0)
    {
        _loc1 = lines[undoList.pop()];
    } // end while
    if (Lines > 0)
    {
        removeLine(_loc1);
    } // end if
} // End of the function
function updateInfoText()
{
    statusText_blue.text = blueLines + "   .";
    statusText_red.text = redLines + "   .";
    statusText_green.text = greenLines + "   .";
    swatchTypes._visible = panel._visible;
    countsVisible = true;
} // End of the function
function addLine(line)
{
    if (newLines == autoSaveThreshold)
    {
        autosave();
        newLines = 0;
    } // end if
    ++newLines;
    line.name = totLines;
    undoList.push(totLines);
    if (Lines == 0)
    {
        makeStartPoint(line);
    } // end if
    incrementLineCounts(line.type);
    statusText.text = Lines + " lines";
    updateInfoText();
    ++totLines;
    registerInGrid(line);
    lines[line.name] = line;
    var _loc2 = tla.createEmptyMovieClip(line.name, tla.getNextHighestDepth());
    line.parent = _loc2;
    renderLine(line);
    redoList[line.name] = new Array(line.x1, line.y1, line.x2, line.y2, line.inv, line.type);
} // End of the function
function redo()
{
    var _loc1;
    lineToUndo = redoLineList[0];
    trace (redoLineList);
    switch (redoList[lineToUndo][5])
    {
        case 0:
        {
            _loc1 = new Floor(redoList[lineToUndo][0], redoList[lineToUndo][1], redoList[lineToUndo][2], redoList[lineToUndo][3], redoList[lineToUndo][4]);
            break;
        } 
        case 1:
        {
            _loc1 = new FloorAcc(redoList[lineToUndo][0], redoList[lineToUndo][1], redoList[lineToUndo][2], redoList[lineToUndo][3], redoList[lineToUndo][4]);
            break;
        } 
        case 2:
        {
            _loc1 = new FloorScenery(redoList[lineToUndo][0], redoList[lineToUndo][1], redoList[lineToUndo][2], redoList[lineToUndo][3]);
            break;
        } 
    } // End of switch
    if (redoList[lineToUndo][0] != undefined)
    {
        addLine(_loc1);
    } // end if
    if (redoLineList.length == 1)
    {
        redoLineList[0] = undefined;
    } // end if
    redoLineList.shift();
} // End of the function
function removeLine(line)
{
    if (line.type == 0)
    {
        --blueLines;
    } // end if
    if (line.type == 1)
    {
        --redLines;
    } // end if
    if (line.type == 2)
    {
        --greenLines;
    } // end if
    --Lines;
    statusText.text = Lines + " lines";
    updateInfoText();
    tla[line.name].removeMovieClip();
    redoLineList.unshift(line.name);
    removeFromGrid(line);
    if (Lines == 0)
    {
        startLine = undefined;
    } // end if
    if (lines[line.nextLine].prevLine == line.name)
    {
        lines[line.nextLine].prevLine = undefined;
        switch (lines[line.nextLine].lim)
        {
            case 1:
            {
                lines[line.nextLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines[line.nextLine].lim = 2;
                break;
            } 
        } // End of switch
    } // end if
    if (lines[line.nextLine].nextLine == line.name)
    {
        lines[line.nextLine].nextLine = undefined;
        switch (lines[line.nextLine].lim)
        {
            case 2:
            {
                lines[line.nextLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines[line.nextLine].lim = 1;
                break;
            } 
        } // End of switch
    } // end if
    if (lines[line.prevLine].prevLine == line.name)
    {
        lines[line.prevLine].prevLine = undefined;
        switch (lines[line.prevLine].lim)
        {
            case 1:
            {
                lines[line.prevLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines[line.prevLine].lim = 2;
                break;
            } 
        } // End of switch
    } // end if
    if (lines[line.prevLine].nextLine == line.name)
    {
        lines[line.prevLine].nextLine = undefined;
        switch (lines[line.prevLine].lim)
        {
            case 2:
            {
                lines[line.prevLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines[line.prevLine].lim = 1;
                break;
            } 
        } // End of switch
    } // end if
    delete lines[line.name];
    false;
    if (Lines == 0)
    {
        undoList = [];
        switchToVersion(VERSION);
    } // end if
} // End of the function
function checkAngles(line1, line2)
{
    var _loc4 = Math.acos((line1.dx * line2.dx + line1.dy * line2.dy) / (line1.dst * line2.dst));
    var _loc1 = line1.dx * line2.dy - line2.dx * line1.dy > 0;
    var _loc5;
    var _loc6;
    if (line1.inv)
    {
        if (line1.inv == line2.inv)
        {
            _loc5 = _loc1 ? (_loc4 < 1.570796) : (true);
            _loc6 = !_loc1;
        }
        else
        {
            _loc5 = _loc1 ? (true) : (_loc4 > 1.570796);
            _loc6 = _loc1;
        } // end else if
    }
    else if (line1.inv == line2.inv)
    {
        _loc5 = _loc1 ? (true) : (_loc4 < 1.570796);
        _loc6 = _loc1;
    }
    else
    {
        _loc5 = _loc1 ? (_loc4 > 1.570796) : (true);
        _loc6 = !_loc1;
    } // end else if
    return ([_loc5, _loc6, _loc4]);
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
                    var _loc3 = _loc1[2] == 2 ? (-1) : (1);
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
                var xysnap = Key.isDown(88) | xysnap_toggled;
                drawing = true;
                prevLine = undefined;
                snaped = false;
                tempLine.inv = Key.isDown(16);
                tempLine.x1 = tla._xmouse;
                tempLine.y1 = tla._ymouse;
                tempLine.valid = false;
                var _loc3 = snap(tempLine.x1, tempLine.y1, 1, tempLine.inv);
                if (_loc3[2] != false)
                {
                    var _loc4 = _loc3[2] == 2 ? (-1) : (1);
                    tempLine.x1 = _loc3[0];
                    tempLine.y1 = _loc3[1];
                    prevLine = _loc3[3];
                    snaped = _loc3[2];
                } // end if
                onMouseMove = function ()
                {
                    tempLine.dx = tempLine.x2 - tempLine.x1;
                    tempLine.dy = tempLine.y2 - tempLine.y1;
                    if (xysnap || Key.isDown(88))
                    {
                        var _loc1 = tla._xmouse - tempLine.x1;
                        var _loc2 = tla._ymouse - tempLine.y1;
                        angle = Math.atan(_loc2 / _loc1) / 0.017453;
                        if (_loc1 < 0)
                        {
                            angle = angle + 180;
                        } // end if
                        if (_loc1 >= 0 && _loc2 < 0)
                        {
                            angle = angle + 360;
                        } // end if
                        trace (angle);
                        lineAngle = angle * -1;
                        trace (angle);
                        if (lineAngle == 0 || lineAngle >= -45 || lineAngle <= -315)
                        {
                            tempLine.x2 = tla._xmouse;
                            tempLine.y2 = tempLine.y1;
                        } // end if
                        if (lineAngle <= -135 && lineAngle >= -225)
                        {
                            tempLine.x2 = tla._xmouse;
                            tempLine.y2 = tempLine.y1;
                        } // end if
                        if (lineAngle >= -135 && lineAngle <= -45)
                        {
                            tempLine.y2 = tla._ymouse;
                            tempLine.x2 = tempLine.x1;
                        } // end if
                        if (lineAngle >= -315 && lineAngle <= -225)
                        {
                            tempLine.y2 = tla._ymouse;
                            tempLine.x2 = tempLine.x1;
                        } // end if
                    }
                    else if (Key.isDown(90))
                    {
                    }
                    else
                    {
                        tempLine.x2 = tla._xmouse;
                        tempLine.y2 = tla._ymouse;
                    } // end else if
                    tempLine.dst = Math.sqrt(Math.pow(tempLine.dx, 2) + Math.pow(tempLine.dy, 2));
                    var _loc3 = 1 / (tla._xscale * 0.010000);
                    if (prevLine != undefined && pencilMode != 2)
                    {
                        checks = checkAngles(tempLine, prevLine);
                        tempLine.valid = tempLine.dst > MIN_LENGTH * _loc3 && checks[0] && tempLine.dst < MAX_LENGTH;
                    }
                    else
                    {
                        tempLine.valid = tempLine.dst > MIN_LENGTH * _loc3 && tempLine.dst < MAX_LENGTH;
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
function formatTimeString(seconds, frames)
{
    var _loc1 = "";
    var _loc2 = int(seconds / 60);
    if (seconds >= 60)
    {
        _loc1 = _loc1 + (_loc2 + ".");
    } // end if
    if (_loc2 > 0 && seconds - _loc2 * 60 < 10)
    {
        _loc1 = _loc1 + "0";
    } // end if
    if (_loc2 > 0)
    {
        _loc1 = _loc1 + (seconds - _loc2 * 60);
    }
    else
    {
        _loc1 = _loc1 + seconds;
    } // end else if
    if (frames < 10)
    {
        _loc1 = _loc1 + ";0";
    }
    else
    {
        _loc1 = _loc1 + ";";
    } // end else if
    _loc1 = _loc1 + frames;
    return (_loc1);
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
    var topSpeed = 0;
    var topSpeedTime = "";
    swatchTypes._visible = false;
    onEnterFrame = function ()
    {
        bur = getTimer();
        if (!slowMotion || bur - pre > 1000 / slowMoFrameRate)
        {
            pre = bur;
            ++frames;
            if (framesInSecond < 40)
            {
                ++framesInSecond;
            }
            else
            {
                framesInSecond = 1;
                blink();
            } // end else if
            var _loc2 = int(frames / 40);
            var _loc4 = frames - _loc2 * 40;
            var _loc3 = formatTimeString(_loc2, _loc4);
            statusText.text = gameFPS + " fps";
            statusText_blue.text = _loc3;
            var _loc1 = Math.sqrt(riderAnchors[5].dx * riderAnchors[5].dx + riderAnchors[5].dy * riderAnchors[5].dy);
            _loc1 = int(_loc1 * 100) / 100;
            if (_loc1 < 0)
            {
                _loc1 = _loc1 * -1;
            } // end if
            statusText_red.text = _loc1 + " p/f";
            if (_loc1 > topSpeed)
            {
                topSpeed = _loc1;
                topSpeedTime = _loc3;
            } // end if
            statusText_green.text = topSpeed + " @ " + topSpeedTime;
            verlet(riderAnchors);
            scarfAnchors[1].x = scarfAnchors[1].x + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dx, 125);
            scarfAnchors[1].y = scarfAnchors[1].y + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dy, 125);
            verlet(scarfAnchors);
            satisfyConstraints();
            render();
            if (saveNow)
            {
                flagTime = frames;
                save();
                if (Key.isDown(67))
                {
                    tla.flag._visible = false;
                    tla.dummy._visible = true;
                    tla.dummy.body._x = world.body._x;
                    tla.dummy.body._y = world.body._y;
                    tla.dummy.body._rotation = world.body._rotation;
                    tla.dummy.arm1._x = world.arm1._x;
                    tla.dummy.arm1._y = world.arm1._y;
                    tla.dummy.arm1._rotation = world.arm1._rotation;
                    tla.dummy.arm2._x = world.arm2._x;
                    tla.dummy.arm2._y = world.arm2._y;
                    tla.dummy.arm2._rotation = world.arm2._rotation;
                    tla.dummy.leg1._x = world.leg1._x;
                    tla.dummy.leg1._y = world.leg1._y;
                    tla.dummy.leg1._rotation = world.leg1._rotation;
                    tla.dummy.leg2._x = world.leg2._x;
                    tla.dummy.leg2._y = world.leg2._y;
                    tla.dummy.leg2._rotation = world.leg2._rotation;
                    tla.dummy.sled._x = world.sled._x;
                    tla.dummy.sled._y = world.sled._y;
                    tla.dummy.sled._rotation = world.sled._rotation;
                    tla.dummy.sled._yscale = world.sled._yscale;
                    tla.dummy.sled.gotoAndStop(world.sled._currentframe);
                    tla.dummy.body.face.gotoAndStop(world.body.face._currentframe);
                }
                else
                {
                    tla.dummy._visible = false;
                    tla.flag._visible = true;
                    if (BindStick.crash)
                    {
                        tla.flag._x = riderAnchors[4].x;
                        tla.flag._y = riderAnchors[4].y;
                    }
                    else
                    {
                        tla.flag._x = riderAnchors[1].x;
                        tla.flag._y = riderAnchors[1].y;
                    } // end else if
                } // end else if
                saveNow = false;
                riding = BindStick.crash;
                sledState = world.sled._currentframe;
                faceState = body.face._currentframe;
            } // end if
        } // end if
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
    var _loc3 = "y" + y;
    var _loc4 = new Object();
    _loc4.storage = [];
    _loc4.storage2 = [];
    if (grid[_loc1] == undefined)
    {
        grid[_loc1] = [];
    } // end if
    if (grid[_loc1][_loc3] == undefined)
    {
        grid[_loc1][_loc3] = _loc4;
    } // end if
    line.grids.push([x, y]);
    if (line.type != 2)
    {
        grid[_loc1][_loc3].storage[line.name] = line;
    } // end if
    grid[_loc1][_loc3].storage2[line.name] = line;
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
    var _loc5 = line.x - box.x;
    var _loc6 = line.y - box.y;
    var _loc3 = Math.abs(line.nx);
    var _loc4 = Math.abs(line.ny);
    var _loc8 = (_loc3 * box.hx + box.hy * _loc4) * _loc3 + (_loc3 * box.hx + _loc4 * box.hy) * _loc4;
    var _loc7 = line.nx * _loc5 + line.ny * _loc6;
    var _loc9 = Math.abs(_loc7 * line.nx) + Math.abs(_loc7 * line.ny);
    if (line.hx + box.hx < Math.abs(_loc5))
    {
        return (false);
    } // end if
    if (line.hy + box.hy < Math.abs(_loc6))
    {
        return (false);
    } // end if
    if (_loc8 < _loc9)
    {
        return (false);
    } // end if
    return (true);
} // End of the function
function verlet(anchors)
{
    for (var _loc1 = 0; _loc1 < anchors.length; ++_loc1)
    {
        anchors[_loc1].verlet(a);
    } // end of for
} // End of the function
function renderLine(line)
{
    var _loc2 = line.parent;
    _loc2.clear();
    var _loc3 = line.nx > 0 ? (Math.ceil(line.nx)) : (Math.floor(line.nx));
    var _loc4 = line.ny > 0 ? (Math.ceil(line.ny)) : (Math.floor(line.ny));
    switch (line.type)
    {
        case 0:
        {
            _loc2.lineStyle(4 * SCALEDOWN, 26367, 100, true, "normal", "round");
            _loc2.moveTo(line.x1 + _loc3, line.y1 + _loc4);
            _loc2.lineTo(line.x2 + _loc3, line.y2 + _loc4);
            _loc2.lineStyle(4 * SCALEDOWN, 0, 100, true, "normal", "round");
            _loc2.moveTo(line.x1, line.y1);
            _loc2.lineTo(line.x2, line.y2);
            break;
        } 
        case 1:
        {
            _loc2.lineStyle(5 * SCALEDOWN, 13369344, 100, true, "normal", "none", "miter");
            _loc2.moveTo(line.x1 + _loc3, line.y1 + _loc4);
            _loc2.lineTo(line.x2 + _loc3, line.y2 + _loc4);
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
    var _loc6 = Key.isDown(16) ? (1.010000) : (1.100000);
    if (Key.isDown(88))
    {
        var _loc2 = tla._xscale;
        var _loc1 = Math.max(_loc2 * (1 / _loc6), ZOOM_MIN);
        world._xscale = world._yscale = tla._xscale = tla._yscale = _loc1;
        world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc1 / _loc2);
        world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc1 / _loc2);
        displayZoom(_loc1);
    } // end if
    if (Key.isDown(90))
    {
        _loc2 = tla._xscale;
        _loc1 = Math.min(_loc2 * _loc6, ZOOM_MAX);
        world._xscale = world._yscale = tla._xscale = tla._yscale = _loc1;
        world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc1 / _loc2);
        world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc1 / _loc2);
        displayZoom(_loc1);
    } // end if
    point1.x = riderAnchors[0].x;
    point1.y = riderAnchors[0].y;
    world.localToGlobal(point1);
    point2.x = riderAnchors[4].x;
    point2.y = riderAnchors[4].y;
    world.localToGlobal(point2);
    point3.x = riderAnchors[5].x;
    point3.y = riderAnchors[5].y;
    world.localToGlobal(point3);
    if (point2.x > barrierR)
    {
        var _loc3 = barrierR - point2.x;
    }
    else if (point2.x < barrierL)
    {
        _loc3 = barrierL - point2.x;
    }
    else
    {
        _loc3 = 0;
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
    tla._x = world._x = world._x + _loc3;
    tla._y = world._y = world._y + offsety;
    world.clear();
    world.lineStyle(1 * SCALEDOWN, 0, 100);
    if (!BindStick.crash)
    {
        world.lineStyle(1 * SCALEDOWN, 0, 100);
        edges[17].render(world);
        edges[18].render(world);
    }
    else if (world.body.face._currentframe != 14)
    {
        world.body.face.play();
    } // end else if
    world.lineStyle(4 * SCALEDOWN * tla._xscale / 100, 16777215, 100, false, "none", "none");
    edges2[0].render(world);
    edges2[2].render(world);
    edges2[4].render(world);
    world.lineStyle(4 * SCALEDOWN * tla._xscale / 100, 13763074, 100, false, "none", "none");
    edges2[1].render(world);
    edges2[3].render(world);
    edges2[5].render(world);
    world.sled._x = riderAnchors[0].x;
    world.sled._y = riderAnchors[0].y;
    world.body._x = riderAnchors[4].x;
    world.body._y = riderAnchors[4].y;
    world.arm1._x = world.arm2._x = riderAnchors[5].x;
    world.arm1._y = world.arm2._y = riderAnchors[5].y;
    world.leg1._x = world.leg2._x = riderAnchors[4].x;
    world.leg1._y = world.leg2._y = riderAnchors[4].y;
    var _loc4 = riderAnchors[3].x - riderAnchors[0].x;
    var _loc5 = riderAnchors[3].y - riderAnchors[0].y;
    if (_loc4 * (riderAnchors[1].y - riderAnchors[0].y) - _loc5 * (riderAnchors[1].x - riderAnchors[0].x) < 0)
    {
        BindStick.crash = true;
        if (world.sled._yscale != -SCALEDOWN * 100)
        {
            world.sled._yscale = -SCALEDOWN * 100;
            world.sled.gotoAndStop(2);
        } // end if
    }
    else if (world.sled._yscale != SCALEDOWN * 100)
    {
        world.sled._yscale = SCALEDOWN * 100;
    } // end else if
    if (_loc4 * (riderAnchors[5].y - riderAnchors[4].y) - _loc5 * (riderAnchors[5].x - riderAnchors[4].x) > 0)
    {
        BindStick.crash = true;
    } // end if
    world.sled._rotation = Math.atan2(_loc5, _loc4) * TO_DEG;
    world.body._rotation = Math.atan2(riderAnchors[5].y - riderAnchors[4].y, riderAnchors[5].x - riderAnchors[4].x) * TO_DEG;
    world.leg1._rotation = Math.atan2(riderAnchors[8].y - riderAnchors[4].y, riderAnchors[8].x - riderAnchors[4].x) * TO_DEG;
    world.arm1._rotation = Math.atan2(riderAnchors[7].y - riderAnchors[5].y, riderAnchors[7].x - riderAnchors[5].x) * TO_DEG;
    world.leg2._rotation = Math.atan2(riderAnchors[9].y - riderAnchors[4].y, riderAnchors[9].x - riderAnchors[4].x) * TO_DEG;
    world.arm2._rotation = Math.atan2(riderAnchors[6].y - riderAnchors[5].y, riderAnchors[6].x - riderAnchors[5].x) * TO_DEG;
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
    for (var _loc7 = 0; _loc7 < riderAnchors.length; ++_loc7)
    {
        var _loc5 = riderAnchors[_loc7];
        var _loc6 = gridPos(_loc5.x, _loc5.y);
        for (var _loc4 = -1; _loc4 < 2; ++_loc4)
        {
            var _loc1 = "x" + (_loc6.x + _loc4);
            if (grid[_loc1] == undefined)
            {
                continue;
            } // end if
            for (var _loc3 = -1; _loc3 < 2; ++_loc3)
            {
                var _loc2 = "y" + (_loc6.y + _loc3);
                if (grid[_loc1][_loc2] == undefined)
                {
                    continue;
                } // end if
                for (var _loc8 in grid[_loc1][_loc2].storage2)
                {
                    if (grid[_loc1][_loc2].storage[_loc8].colide(_loc5))
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
    for (var _loc1 = 0; _loc1 < riderAnchors.length; ++_loc1)
    {
        delete riderAnchors[_loc1];
    } // end of for
} // End of the function
function moveToStartPos()
{
    for (var _loc1 = 0; _loc1 < riderAnchors.length; ++_loc1)
    {
        riderAnchors[_loc1].x = riderAnchors[_loc1].x + tla.startPoint._x;
        riderAnchors[_loc1].y = riderAnchors[_loc1].y + tla.startPoint._y;
        riderAnchors[_loc1].vx = riderAnchors[_loc1].x - 0.800000 * SCALEDOWN;
        riderAnchors[_loc1].vy = riderAnchors[_loc1].y;
    } // end of for
    for (var _loc1 = 0; _loc1 < scarfAnchors.length; ++_loc1)
    {
        scarfAnchors[_loc1].x = scarfAnchors[_loc1].x + tla.startPoint._x;
        scarfAnchors[_loc1].y = scarfAnchors[_loc1].y + tla.startPoint._y;
        scarfAnchors[_loc1].vx = scarfAnchors[_loc1].x - 0.800000 * SCALEDOWN;
        scarfAnchors[_loc1].vy = scarfAnchors[_loc1].y;
    } // end of for
} // End of the function
function switchToVersion(ver)
{
    switch (ver)
    {
        case "6":
        {
            compatible = "6";
            MAX_LENGTH = 2000;
            trace ("version 6 mode");
            registerInGrid = function (line)
            {
                var _loc8 = gridPos(line.x1, line.y1);
                var _loc7 = gridPos(line.x2, line.y2);
                for (var _loc6 = Math.min(_loc8.x, _loc7.x); _loc6 <= Math.max(_loc7.x, _loc8.x); ++_loc6)
                {
                    for (var _loc4 = Math.min(_loc8.y, _loc7.y); _loc4 <= Math.max(_loc7.y, _loc8.y); ++_loc4)
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
            break;
        } 
        case "6.1":
        {
            compatible = "6.1";
            MAX_LENGTH = 2000;
            trace ("version 6.1 mode");
            registerInGrid = function (line)
            {
                var _loc1 = gridPos(line.x1, line.y1);
                var _loc10 = gridPos(line.x2, line.y2);
                var _loc14 = line.dx > 0 ? (_loc10.x) : (_loc1.x);
                var _loc11 = line.dx > 0 ? (_loc1.x) : (_loc10.x);
                var _loc15 = line.dy > 0 ? (_loc10.y) : (_loc1.y);
                var _loc12 = line.dy > 0 ? (_loc1.y) : (_loc10.y);
                if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc10.x && _loc1.y == _loc10.y)
                {
                    register(line, _loc1.x, _loc1.y);
                    return;
                }
                else
                {
                    register(line, _loc1.x, _loc1.y);
                } // end else if
                var _loc3 = line.x1;
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
                    var _loc5 = line.dy > 0 ? (GRIDSIZE - _loc1.gy) : (-(_loc1.gy + 1));
                    if (line.dx == 0)
                    {
                        _loc2 = _loc2 + _loc5;
                    }
                    else if (line.dy == 0)
                    {
                        _loc3 = _loc3 + _loc6;
                    }
                    else
                    {
                        var _loc7 = Math.round(_loc9 * (_loc3 + _loc6) + _loc8);
                        if (Math.abs(_loc7 - _loc2) < Math.abs(_loc5))
                        {
                            _loc3 = _loc3 + _loc6;
                            _loc2 = _loc7;
                        }
                        else if (Math.abs(_loc7 - _loc2) == Math.abs(_loc5))
                        {
                            _loc3 = _loc3 + _loc6;
                            _loc2 = _loc2 + _loc5;
                        }
                        else
                        {
                            _loc3 = Math.round((_loc2 + _loc5 - _loc8) * _loc13);
                            _loc2 = _loc2 + _loc5;
                        } // end else if
                    } // end else if
                    _loc1 = gridPos(_loc3, _loc2);
                    if (_loc1.x >= _loc11 && _loc1.x <= _loc14 && _loc1.y >= _loc12 && _loc1.y <= _loc15)
                    {
                        register(line, _loc1.x, _loc1.y);
                        continue;
                    } // end if
                    return;
                } // end while
            };
            break;
        } 
        case "6.2":
        {
            compatible = "6.2";
            MAX_LENGTH = 2000;
            trace ("version 6.2 mode");
            registerInGrid = function (line)
            {
                var _loc1 = gridPos(line.x1, line.y1);
                var _loc10 = gridPos(line.x2, line.y2);
                var _loc13 = line.dx > 0 ? (_loc10.x) : (_loc1.x);
                var _loc11 = line.dx > 0 ? (_loc1.x) : (_loc10.x);
                var _loc7 = line.dy > 0 ? (_loc10.y) : (_loc1.y);
                var _loc12 = line.dy > 0 ? (_loc1.y) : (_loc10.y);
                if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc10.x && _loc1.y == _loc10.y)
                {
                    register(line, _loc1.x, _loc1.y);
                    return;
                }
                else
                {
                    register(line, _loc1.x, _loc1.y);
                } // end else if
                var _loc4 = line.x1;
                var _loc3 = line.y1;
                var _loc8 = 1 / line.dx;
                var _loc9 = 1 / line.dy;
                while (true)
                {
                    var _loc5;
                    if (_loc1.x < 0)
                    {
                        difX = line.dx > 0 ? (GRIDSIZE + _loc1.gx) : (-GRIDSIZE - _loc1.gx);
                    }
                    else
                    {
                        difX = line.dx > 0 ? (GRIDSIZE - _loc1.gx) : (-(_loc1.gx + 1));
                    } // end else if
                    if (_loc1.y < 0)
                    {
                        _loc5 = line.dy > 0 ? (GRIDSIZE + _loc1.gy) : (-GRIDSIZE - _loc1.gy);
                    }
                    else
                    {
                        _loc5 = line.dy > 0 ? (GRIDSIZE - _loc1.gy) : (-(_loc1.gy + 1));
                    } // end else if
                    if (line.dx == 0)
                    {
                        _loc3 = _loc3 + _loc5;
                    }
                    else if (line.dy == 0)
                    {
                        _loc4 = _loc4 + difX;
                    }
                    else
                    {
                        var _loc6 = _loc3 + line.dy * difX * _loc8;
                        if (Math.abs(_loc6 - _loc3) < Math.abs(_loc5))
                        {
                            _loc4 = _loc4 + difX;
                            _loc3 = _loc6;
                        }
                        else if (Math.abs(_loc6 - _loc3) == Math.abs(_loc5))
                        {
                            _loc4 = _loc4 + difX;
                            _loc3 = _loc3 + _loc5;
                        }
                        else
                        {
                            _loc4 = _loc4 + line.dx * _loc5 * _loc9;
                            _loc3 = _loc3 + _loc5;
                        } // end else if
                    } // end else if
                    _loc1 = gridPos(_loc4, _loc3);
                    if (_loc1.x >= _loc11 && _loc1.x <= _loc13 && _loc1.y >= _loc12 && _loc1.y <= _loc7)
                    {
                        register(line, _loc1.x, _loc1.y);
                        continue;
                    } // end if
                    return;
                } // end while
            };
            break;
        } 
    } // End of switch
} // End of the function
function panelMode(Mode)
{
    if (Mode == "draw")
    {
        panel.saveB.enabled = panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = true;
        panel.saveB._alpha = panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 100;
        panel.flagB.gotoAndStop(2);
        active2 = true;
        compas._visible = panel._visible;
        tla.startPoint._visible = true;
    }
    else if (Mode == "simulate")
    {
        panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = false;
        panel.saveB.enabled = panel.saveB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = true;
        panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = 30;
        panel.saveB._alpha = panel.saveB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 100;
        panel.flagB.gotoAndStop(1);
        panel.swatches._visible = false;
        compas._visible = false;
        tla.startPoint._visible = false;
    }
    else if (Mode == "save")
    {
        panel.saveB.enabled = panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = false;
        panel.saveB._alpha = panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 30;
        panel.flagB.gotoAndStop(1);
        panel.swatches._visible = false;
    } // end else if
} // End of the function
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
var ZOOM_MAX = 1400;
var ZOOM_MIN = 5;
var markedZoom = 200;
var advancedMode = true;
var stickySlowMo = false;
var slowMoWasOn = false;
var edges;
var edges2;
var riderAnchors;
var scarfAnchors;
var flagTime = 0;
var slowMoFrameRate = 5;
var simulation = false;
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
var faceState;
var Lines = 0;
var totLines = 0;
var lines = new Object();
var redoList = [];
var pencilMode = 0;
var lastTool;
var tempZoom;
var ttZoom;
var undoList = [];
var pre = 0;
var bur = 0;
var slowMotion = false;
var segmentsRemainingToLoad;
var tempLine = new Object();
var checks = [];
var prevLine;
var snaped;
var tempLines;
var loadPerFrame = 15;
var VERSION = "6.2";
var lineToUndo = 0;
var redoLineList = [];
var compatible = VERSION;
var currTrackName = "Untitled Track";
var newLines = 0;
var redLines = 0;
var blueLines = 0;
var greenLines = 0;
var frames = 0;
var colorEraser = false;
var xysnap_toggled = false;
var framesInSecond = 0;
var countsVisible = true;
var loadSecondsTimer;
var gameFPS;
var linesPerChunk;
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
compas.distance.autoSize = "left";
swatchTypes._visible = false;
resize.onResize = function ()
{
    statusText._width = Stage.width - (panel._x + panel._width * 0.500000) - 25;
    statusText._x = Math.floor(Math.max(Stage.width - statusText._width - 15, panel._x + panel._width * 0.500000));
    statusText_blue._width = statusText._width;
    statusText_blue._x = statusText._x;
    statusText_red._width = statusText._width;
    statusText_red._x = statusText._x;
    statusText_green._width = statusText._width;
    statusText_green._x = statusText._x;
    swatchTypes._x = Stage.width - 26;
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
    compas._y = Stage.height - 14;
    compas._x = Stage.width * 0.500000;
    panel._x = Stage.width * 0.500000;
    zoomText._y = Stage.height - 24;
};
resize.onResize();
Stage.addListener(resize);
Key.addListener(this);
world._visible = false;
BindStick.crash = false;
FloorBase.zone = 20 * SCALEDOWN;
world.sled._xscale = world.sled._yscale = world.body._xscale = world.body._yscale = world.arm1._xscale = world.arm1._yscale = world.arm2._xscale = world.arm2._yscale = world.leg1._xscale = world.leg1._yscale = world.leg2._xscale = world.leg2._yscale = SCALEDOWN * 100;
tla.dummy.sled._xscale = tla.dummy.sled._yscale = tla.dummy.body._xscale = tla.dummy.body._yscale = tla.dummy.arm1._xscale = tla.dummy.arm1._yscale = tla.dummy.arm2._xscale = tla.dummy.arm2._yscale = tla.dummy.leg1._xscale = tla.dummy.leg1._yscale = tla.dummy.leg2._xscale = tla.dummy.leg2._yscale = SCALEDOWN * 100;
tla.dummy._visible = false;
tla.flag._visible = false;
tla.startPoint.help._visible = false;
zoomText._visible = false;
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
    switch (_loc1)
    {
        case "6.1":
        {
            return ("rev6.1");
            break;
        } 
        case "6.2":
        {
            return ("rev6.2");
            break;
        } 
        default:
        {
            return ("rev6");
            break;
        } 
    } // End of switch
};
panel.fileDialog._visible = false;
panel.confirmDialog._visible = false;
var mouseListener = new Object();
mouseListener.onMouseWheel = function (delta)
{
    if (simulation == false && active2)
    {
        var _loc3 = 1.050000;
        var _loc4 = delta > 0 ? (1) : (-1);
        var _loc5 = _loc4 == 1 ? (_loc3) : (1 / _loc3);
        var _loc2 = tla._xscale;
        var _loc1 = Math.min(Math.max(_loc2 * _loc5, ZOOM_MIN), ZOOM_MAX);
        tla._x = Stage.width * 0.500000 + (canvasX - Stage.width * 0.500000) * (_loc1 / _loc2);
        tla._y = Stage.height * 0.500000 + (canvasY - Stage.height * 0.500000) * (_loc1 / _loc2);
        tla._xscale = tla._yscale = _loc1;
        bufScale = tla._xscale;
        canvasX = tla._x;
        canvasY = tla._y;
        displayZoom(tla._xscale);
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
var zoomTextInterval;
var DEFAULT_MSG_LEN = 1500;
var colorPlaybackToggle = false;
panel.lineB.onRollOver = panel.swatches.green.onRollOver = panel.swatches.red.onRollOver = panel.swatches.blue.onRollOver = panel.zoomB.onRollOver = panel.eraserB.onRollOver = panel.flagB.onRollOver = panel.handB.onRollOver = panel.pencilB.onRollOver = panel.playB.onRollOver = panel.stopB.onRollOver = panel.saveB.onRollOver = panel.saveB.onRollOver = panel.trashB.onRollOver = function ()
{
    active2 = false;
    cursor._visible = false;
    Mouse.hide();
    Mouse.hide();
    Mouse.show();
    trace ("Showing mouse");
};
panel.lineB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.lineB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel.playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.trashB.onReleaseOutside = function ()
{
    active2 = true;
    cursorImage(cursorMode);
};
tla.startPoint.onPress = function ()
{
    if (Key.isDown(68))
    {
        active2 = false;
        cursor._visible = false;
        Mouse.show();
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
    active2 = true;
    cursorImage(cursorMode);
    tla.startPoint.gotoAndStop(1);
    tla.startPoint.onMouseMove = function ()
    {
    };
};
tla.startPoint.onRollOver = function ()
{
    tla.startPoint.help._visible = true;
};
tla.startPoint.onRollOut = function ()
{
    tla.startPoint.help._visible = false;
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
    switchToVersion(VERSION);
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
        statusText.text = "0 lines";
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
        countsVisible = false;
        if (simulation)
        {
            slowMoWasOn = slowMotion;
        } // end if
        frames = 0;
        clearInterval(framerateInterval);
        framerateInterval = setInterval(framerate, 1000);
        var _loc8 = cursorMode;
        slowMotion = Key.isDown(77) || stickySlowMo && slowMoWasOn;
        cursorImage("normal");
        world.body.face.gotoAndStop(1);
        if (saved && !Key.isDown(65))
        {
            frames = flagTime;
            restore();
            if (!riding)
            {
                BindStick.crash = false;
                world.sled.gotoAndStop(sledState);
                world.body.face.gotoAndStop(faceState);
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
                world.sled.gotoAndStop(1);
            } // end else if
            moveToStartPos();
        } // end else if
        tla.clear();
        if (!simulation)
        {
            simulation = true;
            panelMode("simulate");
            if (!Key.isDown(67) && !colorPlaybackToggle)
            {
                for (var _loc5 in lines)
                {
                    var _loc1 = lines[_loc5];
                    _loc1.parent.clear();
                    _loc1.parent.lineStyle(4 * SCALEDOWN, 0, 100, false, "normal", "round");
                    _loc1.parent.moveTo(_loc1.x1, _loc1.y1);
                    _loc1.parent.lineTo(_loc1.x2, _loc1.y2);
                } // end of for...in
            } // end if
        } // end if
        if (!Key.isDown(16))
        {
            tla._xscale = tla._yscale = world._xscale = world._yscale = markedZoom;
        } // end if
        world._xscale = world._yscale = tla._yscale;
        world._visible = true;
        help._visible = false;
        if (Key.isDown(90))
        {
            var _loc2 = tla._xscale;
            var _loc3 = Math.max(_loc2 * 0.900000, 20);
            world._xscale = world._yscale = tla._xscale = tla._yscale = _loc3;
            world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc3 / _loc2);
            world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc3 / _loc2);
        } // end if
        if (Key.isDown(88))
        {
            _loc2 = tla._xscale;
            _loc3 = Math.min(_loc2 * 1.100000, 400);
            world._xscale = world._yscale = tla._xscale = tla._yscale = _loc3;
            world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc3 / _loc2);
            world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc3 / _loc2);
        } // end if
        var _loc4 = new Object();
        _loc4.x = riderAnchors[4].x;
        _loc4.y = riderAnchors[4].y;
        world.localToGlobal(_loc4);
        var _loc7 = Stage.width * 0.500000 - _loc4.x;
        var _loc6 = Stage.height * 0.500000 - _loc4.y;
        tla._x = world._x = world._x + _loc7;
        tla._y = world._y = world._y + _loc6;
        render();
        simulate();
    } // end if
};
panel.stopB.onPress = function ()
{
    frames = 0;
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
    statusText.text = Lines + " lines";
    panelMode("draw");
    help._visible = true;
    slowMoWasOn = slowMotion;
    countsVisible = false;
    if (stickySlowMo)
    {
        displayMessage(slowMoWasOn ? ("Playback will start in slow motion.") : ("Playback will start at full speed."), DEFAULT_MSG_LEN);
    } // end if
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
    var ver = compatible;
    trace ("save mode " + ver);
    panel.fileDialog.saveButton.onRelease = function ()
    {
        if (Lines > 0 && !backupMode)
        {
            active = true;
            saveTrack(panel.fileDialog.name.text, ver);
            panel.fileDialog._visible = false;
            panelMode("draw");
            panel[lastTool + "B"].onPress();
            cursorImage(cursorMode);
            disableFileButtons();
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
            if (lines[savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine] == undefined && typeof(savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine) == "number")
            {
                tla.startPoint._x = 100;
                tla.startPoint._y = 100;
            }
            else if (typeof(savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine) == "number")
            {
                tla.startPoint._x = lines[savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine].x1;
                tla.startPoint._y = lines[savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine].y1 - 50 * SCALEDOWN;
            }
            else
            {
                tla.startPoint._x = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine[0];
                tla.startPoint._y = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine[1];
            } // end else if
            disableFileButtons();
            undoList = [];
            reset();
            active = true;
            saved = false;
            tla.dummy._visible = false;
            tla.flag._visible = false;
            trace (panel.fileDialog.savedTracks.selectedIndex);
            currTrackName = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].label;
            trace (currTrackName);
            buffer = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].data;
            var _loc5 = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].version;
            if (_loc5 == undefined)
            {
                _loc5 = "6";
            } // end if
            switchToVersion(_loc5);
            panel.fileDialog._visible = false;
            segmentsRemainingToLoad = buffer.length;
            loadBounds(buffer);
            showAll();
            loadStartTime = getTimer();
            if (tla._xscale > 100)
            {
                tla._xscale = tla._yscale = bufScale = 100;
                tla._x = tla._y = canvasX = canvasY = 0;
            } // end if
            linesPerChunk = 200;
            panel.onEnterFrame = function ()
            {
                if (segmentsRemainingToLoad > 0)
                {
                    for (var _loc3 = 0; _loc3 < linesPerChunk; ++_loc3)
                    {
                        var _loc1 = buffer[segmentsRemainingToLoad - 1];
                        --segmentsRemainingToLoad;
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
                        redoList[_loc1[8]] = new Array(_loc1[0], _loc1[1], _loc1[2], _loc1[3], Boolean(_loc1[5]), _loc1[9]);
                        _loc2.name = _loc1[8];
                        incrementLineCounts(_loc1[9]);
                        undoList.push(_loc1[8]);
                        _loc2.prevLine = _loc1[6];
                        _loc2.nextLine = _loc1[7];
                        registerInGrid(_loc2);
                        lines[_loc2.name] = _loc2;
                        var _loc4 = tla.createEmptyMovieClip(_loc2.name, tla.getNextHighestDepth());
                        _loc2.parent = _loc4;
                        renderLine(_loc2);
                        if (segmentsRemainingToLoad == 0)
                        {
                            break;
                        } // end if
                    } // end of for
                    var _loc6 = int((getTimer() - loadStartTime) / 100) / 10;
                    statusText.text = Math.floor((buffer.length - segmentsRemainingToLoad) / buffer.length * 100) + "% (" + Lines + ") - " + _loc6 + "s [" + gameFPS + "fps]";
                    updateInfoText();
                    var _loc5 = 10;
                    if (gameFPS < _loc5 - 2)
                    {
                        linesPerChunk = Math.max(linesPerChunk - 1, 1);
                    }
                    else if (gameFPS > _loc5 + 2)
                    {
                        linesPerChunk = Math.min(linesPerChunk + 1, 500);
                    } // end else if
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
        var _loc1 = panel.fileDialog.savedTracks.selectedIndex;
        savedTracks.data.trackList.removeItemAt(_loc1);
        panel.fileDialog.savedTracks.selectedIndex = Math.min(_loc1, panel.fileDialog.savedTracks.length - 1);
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
        flagTime = 0;
    } // end else if
};
panel.eraserB.onPress = function ()
{
    cursorMode = "eraser";
    if (advancedMode && Key.isDown(16))
    {
        colorEraser = !colorEraser;
        panel.swatches._visible = colorEraser;
    } // end if
    if (!advancedMode || !Key.isDown(16) || colorEraser != true)
    {
        if (lastTool != "eraser")
        {
            colorEraser == false;
            panel.swatches._visible = false;
        } // end if
    } // end if
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
    if (lastTool != "eraser")
    {
        lastTool = "eraser";
    } // end if
};
var oldScale;
var oldy;
var bufScale = 100;
registerInGrid = function (line)
{
    var _loc1 = gridPos(line.x1, line.y1);
    var _loc10 = gridPos(line.x2, line.y2);
    var _loc13 = line.dx > 0 ? (_loc10.x) : (_loc1.x);
    var _loc11 = line.dx > 0 ? (_loc1.x) : (_loc10.x);
    var _loc7 = line.dy > 0 ? (_loc10.y) : (_loc1.y);
    var _loc12 = line.dy > 0 ? (_loc1.y) : (_loc10.y);
    if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc10.x && _loc1.y == _loc10.y)
    {
        register(line, _loc1.x, _loc1.y);
        return;
    }
    else
    {
        register(line, _loc1.x, _loc1.y);
    } // end else if
    var _loc4 = line.x1;
    var _loc3 = line.y1;
    var _loc8 = 1 / line.dx;
    var _loc9 = 1 / line.dy;
    while (true)
    {
        var _loc5;
        if (_loc1.x < 0)
        {
            difX = line.dx > 0 ? (GRIDSIZE + _loc1.gx) : (-GRIDSIZE - _loc1.gx);
        }
        else
        {
            difX = line.dx > 0 ? (GRIDSIZE - _loc1.gx) : (-(_loc1.gx + 1));
        } // end else if
        if (_loc1.y < 0)
        {
            _loc5 = line.dy > 0 ? (GRIDSIZE + _loc1.gy) : (-GRIDSIZE - _loc1.gy);
        }
        else
        {
            _loc5 = line.dy > 0 ? (GRIDSIZE - _loc1.gy) : (-(_loc1.gy + 1));
        } // end else if
        if (line.dx == 0)
        {
            _loc3 = _loc3 + _loc5;
        }
        else if (line.dy == 0)
        {
            _loc4 = _loc4 + difX;
        }
        else
        {
            var _loc6 = _loc3 + line.dy * difX * _loc8;
            if (Math.abs(_loc6 - _loc3) < Math.abs(_loc5))
            {
                _loc4 = _loc4 + difX;
                _loc3 = _loc6;
            }
            else if (Math.abs(_loc6 - _loc3) == Math.abs(_loc5))
            {
                _loc4 = _loc4 + difX;
                _loc3 = _loc3 + _loc5;
            }
            else
            {
                _loc4 = _loc4 + line.dx * _loc5 * _loc9;
                _loc3 = _loc3 + _loc5;
            } // end else if
        } // end else if
        _loc1 = gridPos(_loc4, _loc3);
        if (_loc1.x >= _loc11 && _loc1.x <= _loc13 && _loc1.y >= _loc12 && _loc1.y <= _loc7)
        {
            register(line, _loc1.x, _loc1.y);
            continue;
        } // end if
        return;
    } // end while
};
init();
reset();
drawPencil();
panel.pencilB.onPress();
cursorImage("pencil");
var linesRemaining = 0;
var trackLineCount = 0;
var loadStartTime = 0;
var trackChunk = "";
var frameTimes = [];
var tFrameCount = 0;
tla.onEnterFrame = function ()
{
    ++tFrameCount;
    if (frameTimes.length < 10)
    {
        frameTimes.push(getTimer());
    }
    else
    {
        frameTimes.shift();
        frameTimes.push(getTimer());
    } // end else if
    var _loc2 = frameTimes[frameTimes.length - 1] - frameTimes[0];
    var _loc1 = _loc2 / (frameTimes.length - 1);
    if (tFrameCount % 10 == 0)
    {
        gameFPS = int(1000 / _loc1);
        if (gameFPS > 40)
        {
            gameFPS = 40;
        } // end if
    } // end if
};
