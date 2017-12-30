function initEditorMode(titleMovieMode)
{
    Mouse.show();
    cursor._visible = false;
    VERSION = compatible = "7.0";
    SCALEDOWN = 0.500000;
    INVSCALE = 200;
    FloorBase.zone = 20 * SCALEDOWN;
    a = {x: 0, y: 0.350000 * SCALEDOWN};
    panel._visible = true;
    help._visible = true;
    Mouse.show();
    cursor._visible = false;
} // End of the function
function traceRider(nRiderIndex)
{
    rider = savedTracks.data.trackList[0].riderData[nRiderIndex];
    trace (rider.type);
} // End of the function
function updateCompasses(numRiders)
{
    ridersInfo[0].compas._x = Stage.width * (numRiders == 1 ? (0.500000) : (0.400000));
    pointACompasToAStartPoint(ridersInfo[0].startPoint, ridersInfo[0].compas);
} // End of the function
function getRiderIndexFromStartPoint(thisStartPoint)
{
    var _loc2;
    for (var _loc2 in ridersInfo)
    {
        if (thisStartPoint == ridersInfo[_loc2].startPoint)
        {
            return (_loc2);
        } // end if
    } // end of for...in
    return (0);
} // End of the function
function SwapStartPointDepths(_startPoint, bBringToFrontOnly)
{
    var _loc1;
    _loc1 = getRiderIndexFromStartPoint(_startPoint);
    ++_loc1;
    _loc1 = _loc1 % riders.length;
    if (bBringToFrontOnly && _startPoint.getDepth() > ridersInfo[_loc1].startPoint.getDepth())
    {
        return;
    } // end if
    _startPoint.swapDepths(ridersInfo[_loc1].startPoint);
} // End of the function
function showFlag(bVisible)
{
    tla.flag._visible = bVisible;
} // End of the function
function isFlagVisible()
{
    return (tla.flag._visible);
} // End of the function
function showStartPoints(bVisible)
{
    if (Lines == 0 && bVisible)
    {
        return;
    } // end if
    for (var _loc2 in ridersInfo)
    {
        if (!bVisible || ridersInfo[_loc2].type != 0)
        {
            ridersInfo[_loc2].showStartPoint(bVisible);
        } // end if
    } // end of for...in
} // End of the function
function showStartPointsHelp(bVisible)
{
    for (var _loc2 in ridersInfo)
    {
        if (!bVisible || ridersInfo[_loc2].type != 0)
        {
            ridersInfo[_loc2].showStartPointHelp(bVisible);
        } // end if
    } // end of for...in
} // End of the function
function showStartPointsArrows(bVisible)
{
    for (var _loc2 in ridersInfo)
    {
        if (!bVisible || ridersInfo[_loc2].type != 0)
        {
            ridersInfo[_loc2].showStartPointsArrow(bVisible);
        } // end if
    } // end of for...in
} // End of the function
function showDummies(bVisible)
{
    for (var _loc2 in ridersInfo)
    {
        if (!bVisible || ridersInfo[_loc2].type != 0)
        {
            ridersInfo[_loc2].showDummy(bVisible);
        } // end if
    } // end of for...in
} // End of the function
function showRiders(bVisible)
{
    for (var _loc1 in riders)
    {
        riders[_loc1].showRider(bVisible);
    } // end of for...in
} // End of the function
function showCompasses(bVisible)
{
    if (Lines == 0 && bVisible)
    {
        return;
    } // end if
    for (var _loc2 in ridersInfo)
    {
        if (!bVisible || ridersInfo[_loc2].type != 0)
        {
            ridersInfo[_loc2].showCompass(bVisible);
        } // end if
    } // end of for...in
} // End of the function
function showBureks()
{
    for (var _loc1 in riders)
    {
        riders[_loc1].showBurek();
    } // end of for...in
} // End of the function
function pointToStartPoints()
{
    for (var _loc1 in ridersInfo)
    {
        if (ridersInfo[_loc1].type != 0 || helpscreen._visible)
        {
            pointACompasToAStartPoint(ridersInfo[_loc1].startPoint, ridersInfo[_loc1].compas);
        } // end if
    } // end of for...in
} // End of the function
function pointACompasToAStartPoint(startpoint, compas)
{
    var _loc1 = new Object();
    _loc1.x = startpoint._x;
    _loc1.y = startpoint._y;
    tla.localToGlobal(_loc1);
    compas.distance.text = Math.floor(Math.sqrt(Math.pow(_loc1.x - compas._x, 2) + Math.pow(_loc1.y - compas._y, 2))) + " pixels";
    compas.dial._rotation = Math.atan2(_loc1.y - compas._y, _loc1.x - compas._x) * TO_DEG;
} // End of the function
function updateCamera()
{
    lasttlaX = tla._x;
    lasttlaY = tla._y;
    if (riderCameraIndex == 2)
    {
        point2.x = riderCameraPanStartPointX;
        point2.y = riderCameraPanStartPointY;
        tla.localToGlobal(point2);
    }
    else
    {
        point2.x = riders[0].dots[4].x;
        point2.y = riders[0].dots[4].y;
        riders[0].rworld.localToGlobal(point2);
    } // end else if
    if (point2.x > barrierR)
    {
        var _loc1 = barrierR - point2.x;
    }
    else if (point2.x < barrierL)
    {
        _loc1 = barrierL - point2.x;
    }
    else
    {
        _loc1 = 0;
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
    if (riderCameraIndex == 2)
    {
        nXs[0] = riderCameraPanStartPointX;
        nYs[0] = riderCameraPanStartPointY;
    }
    else
    {
        nXs[0] = riders[0].rworld._x + _loc1;
        nYs[0] = riders[0].rworld._y + offsety;
    } // end else if
    if (riderCameraIndex == 3 && riders[1] == undefined)
    {
        point2.x = riderCameraPanStartPointX;
        point2.y = riderCameraPanStartPointY;
        tla.localToGlobal(point2);
    }
    else
    {
        point2.x = riders[1].dots[4].x;
        point2.y = riders[1].dots[4].y;
        riders[1].rworld.localToGlobal(point2);
    } // end else if
    if (point2.x > barrierR)
    {
        _loc1 = barrierR - point2.x;
    }
    else if (point2.x < barrierL)
    {
        _loc1 = barrierL - point2.x;
    }
    else
    {
        _loc1 = 0;
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
    if (riderCameraIndex == 3)
    {
        nXs[1] = riderCameraPanStartPointX;
        nYs[1] = riderCameraPanStartPointY;
    }
    else if (riders[1] != undefined)
    {
        nXs[1] = riders[1].rworld._x + _loc1;
        nYs[1] = riders[1].rworld._y + offsety;
    } // end else if
    if (titleMovieMode)
    {
        riderCameraIndex = 5;
    } // end if
    switch (riderCameraIndex)
    {
        case 0:
        {
            riders[0].rworld._x = nXs[0];
            riders[0].rworld._y = nYs[0];
            if (riders[1] != undefined)
            {
                riders[1].rworld._x = nXs[0];
                riders[1].rworld._y = nYs[0];
            } // end if
            tla._x = riders[0].rworld._x;
            tla._y = riders[0].rworld._y;
            break;
        } 
        case 1:
        {
            if (riders[1] != undefined)
            {
                riders[0].rworld._x = nXs[1];
                riders[0].rworld._y = nYs[1];
                riders[1].rworld._x = nXs[1];
                riders[1].rworld._y = nYs[1];
                tla._x = riders[1].rworld._x;
                tla._y = riders[1].rworld._y;
            } // end if
            break;
        } 
        case 2:
        {
            if (riders[1] != undefined)
            {
                if (riderCameraPanPercent >= 1)
                {
                    riderCameraPanPercent = 1;
                }
                else
                {
                    riderCameraPanPercent = riderCameraPanPercent + 0.010000;
                } // end else if
                riders[0].rworld._x = nXs[0] * (1 - riderCameraPanPercent) + nXs[1] * riderCameraPanPercent;
                riders[0].rworld._y = nYs[0] * (1 - riderCameraPanPercent) + nYs[1] * riderCameraPanPercent;
                riders[1].rworld._x = nXs[0] * (1 - riderCameraPanPercent) + nXs[1] * riderCameraPanPercent;
                riders[1].rworld._y = nYs[0] * (1 - riderCameraPanPercent) + nYs[1] * riderCameraPanPercent;
                tla._x = riderCameraPanStartPointX * (1 - riderCameraPanPercent) + nXs[1] * riderCameraPanPercent;
                tla._y = riderCameraPanStartPointY * (1 - riderCameraPanPercent) + nYs[1] * riderCameraPanPercent;
            } // end if
            break;
        } 
        case 3:
        {
            if (riderCameraPanPercent <= 0)
            {
                riderCameraPanPercent = 0;
            }
            else
            {
                riderCameraPanPercent = riderCameraPanPercent - 0.010000;
            } // end else if
            riders[0].rworld._x = nXs[0] * (1 - riderCameraPanPercent) + nXs[1] * riderCameraPanPercent;
            riders[0].rworld._y = nYs[0] * (1 - riderCameraPanPercent) + nYs[1] * riderCameraPanPercent;
            if (riders[1] != undefined)
            {
                riders[1].rworld._x = nXs[0] * (1 - riderCameraPanPercent) + nXs[1] * riderCameraPanPercent;
                riders[1].rworld._y = nYs[0] * (1 - riderCameraPanPercent) + nYs[1] * riderCameraPanPercent;
            } // end if
            tla._x = nXs[0] * (1 - riderCameraPanPercent) + riderCameraPanStartPointX * riderCameraPanPercent;
            tla._y = nYs[0] * (1 - riderCameraPanPercent) + riderCameraPanStartPointY * riderCameraPanPercent;
            break;
        } 
        case 4:
        {
            if (riderCameraPanPercent < 0.500000)
            {
                riderCameraPanPercent = riderCameraPanPercent + 0.010000;
            } // end if
            riders[0].rworld._x = riderCameraPanStartPointX * (1 - 2 * riderCameraPanPercent) + 0.500000 * (nXs[0] + nXs[1]) * 2 * riderCameraPanPercent;
            riders[0].rworld._y = riderCameraPanStartPointY * (1 - 2 * riderCameraPanPercent) + 0.500000 * (nYs[0] + nYs[1]) * 2 * riderCameraPanPercent;
            if (riders[1] != undefined)
            {
                riders[1].rworld._x = riderCameraPanStartPointX * (1 - 2 * riderCameraPanPercent) + 0.500000 * (nXs[0] + nXs[1]) * 2 * riderCameraPanPercent;
                riders[1].rworld._y = riderCameraPanStartPointY * (1 - 2 * riderCameraPanPercent) + 0.500000 * (nYs[0] + nYs[1]) * 2 * riderCameraPanPercent;
            } // end if
            tla._x = riderCameraPanStartPointX * (1 - 2 * riderCameraPanPercent) + 0.500000 * (nXs[0] + nXs[1]) * 2 * riderCameraPanPercent;
            tla._y = riderCameraPanStartPointY * (1 - 2 * riderCameraPanPercent) + 0.500000 * (nYs[0] + nYs[1]) * 2 * riderCameraPanPercent;
            break;
        } 
        case 5:
        {
            break;
        } 
        case 6:
        {
            riders[0].rworld._x = riders[0].rworld._x - velocityX;
            riders[0].rworld._y = riders[0].rworld._y - velocityY;
            if (riders[1] != undefined)
            {
                riders[1].rworld._x = riders[1].rworld._x - velocityX;
                riders[1].rworld._y = riders[1].rworld._y - velocityY;
            } // end if
            tla._x = tla._x - velocityX;
            tla._y = tla._y - velocityY;
            break;
        } 
    } // End of switch
    riders[0].translateRider(riders[0].rworld._x, riders[0].rworld._y);
    if (riders[1] != undefined)
    {
        riders[1].translateRider(riders[1].rworld._x, riders[1].rworld._y);
    } // end if
} // End of the function
function renderRiders()
{
    for (var _loc1 in riders)
    {
        riders[_loc1].render();
    } // end of for...in
} // End of the function
function onKeyUp()
{
    if (Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "hand" || cursorMode == "camera") && helpscreen._visible == false)
    {
        cursorImage(lastTool);
    } // end if
    if (Key.getCode() == 72 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        helpscreen._visible = !helpscreen._visible;
        if (helpscreen._visible)
        {
            SetHelpEventFunctions();
            cursor._visible = false;
            Mouse.show();
            active2 = false;
            active = false;
            panel.playB.enabled = true;
            panel.playB._alpha = 100;
            HideToolSwatchesForHelp(true);
            panel.swatches._visible = true;
            panel.swatches._visible = true;
            panel.camera0.enabled = true;
            panel.camera0._alpha = 100;
            panel.camera0._visible = true;
            if (riders[1] == undefined)
            {
                if (ridersInfo[0].type == defaultRiderType1)
                {
                    ridersInfo[1].compas.gotoAndStop(2);
                }
                else
                {
                    ridersInfo[1].compas.gotoAndStop(defaultRiderType1);
                } // end if
            } // end else if
            updateCompasses(2);
            pointToStartPoints();
            ridersInfo[0].compas._visible = true;
            ridersInfo[1].compas._visible = true;
        }
        else
        {
            SetPanelEventFunctions();
            addCamera(true);
            cursor._visible = true;
            Mouse.hide();
            active2 = true;
            active = true;
            ridersInfo[1].compas.gotoAndStop(ridersInfo[1].type);
            if (Lines == 0)
            {
                panel.playB.enabled = false;
                panel.playB._alpha = 50;
                panel.camera0._visible = false;
                ridersInfo[0].compas._visible = false;
                ridersInfo[1].compas._visible = false;
            } // end if
            if (riders[1] == undefined)
            {
                ridersInfo[1].compas._visible = false;
                updateCompasses(1);
            }
            else
            {
                updateCompasses(2);
            } // end else if
            HideToolSwatchesForHelp(false);
            if (!(cursorMode == "pencil" || cursorMode == "line" || cursorMode == "eraser"))
            {
                panel.swatches._visible = false;
            } // end if
        } // end if
    } // end else if
    if (Key.getCode() == 81 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.pencilB.onPress();
        cursorImage("pencil");
    } // end if
    if (Key.getCode() == 87 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.lineB.onPress();
        cursorImage("line");
    } // end if
    if (Key.getCode() == 69 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.eraserB.onPress();
        cursorImage("eraser");
    } // end if
    if (Key.getCode() == 82 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.zoomB.onPress();
        cursorImage("zoom");
    } // end if
    if (Key.getCode() == 84 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.handB.onPress();
        cursorImage("hand");
    } // end if
    if (Key.getCode() == 89 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.playB.onPress();
    } // end if
    if (Key.getCode() == 85 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.stopB.onPress();
    } // end if
    if (Key.getCode() == 73 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.flagB.onPress();
    } // end if
    if (Key.getCode() == 79 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.saveB.onPress();
    } // end if
    if (Key.getCode() == 80 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
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
    if (Key.getCode() == 52 && panel.swatches._visible == true)
    {
        panel.swatches.brown.onPress();
    } // end if
    if (Key.getCode() == 53 && panel.swatches._visible == true)
    {
        if (trapdoorLinesEnabled)
        {
            panel.swatches.purple.onPress();
        } // end if
    } // end if
    if (Key.getCode() == 54 && panel.swatches._visible == true)
    {
        if (invisibleLinesEnabled)
        {
            panel.swatches.gray.onPress();
        } // end if
    } // end if
    if (Key.getCode() == 9 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
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
            var _loc4 = tla._xmouse;
            var _loc5 = tla._ymouse;
            var _loc6 = _xmouse;
            var _loc7 = _ymouse;
            canvasX = tla._x = -(_loc4 * tempZoom * 0.010000 - _loc6);
            canvasY = tla._y = -(_loc5 * tempZoom * 0.010000 - _loc7);
            bufScale = tla._xscale = tla._yscale = tempZoom;
            tempZoom = undefined;
        } // end if
    } // end else if
    if (Key.getCode() == 8 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        undo();
    } // end if
    if (Key.getCode() == 36 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        tmpPoint.x = tla.startPoint._x;
        tmpPoint.y = tla.startPoint._y;
        tla.localToGlobal(tmpPoint);
        canvasX = tla._x = Stage.width * 0.500000 - tmpPoint.x + tla._x;
        canvasY = tla._y = Stage.height * 0.500000 - tmpPoint.y + tla._y;
    } // end if
    if (Key.getCode() == 35 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
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
    if (Key.getCode() == 70 && isFlagVisible() && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
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
    if (Key.getCode() == 66)
    {
        for (var _loc3 in lines)
        {
            _loc1 = lines[_loc3];
            var _loc2 = new Array(_loc1.x1, _loc1.y1, _loc1.x2, _loc1.y2, _loc1.lim, Number(_loc1.inv), _loc1.prevLine, _loc1.nextLine, _loc1.name, _loc1.type);
            trace (_loc2);
        } // end of for...in
    } // end if
    if (Key.getCode() == 219 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.rider1B.onPress();
    } // end if
    if (Key.getCode() == 221 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.rider2B.onPress();
    } // end if
    if (Key.getCode() == 75 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
    {
        panel.cameraB.onPress();
        if (!simulation)
        {
            cursorImage("camera");
        } // end if
    } // end if
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
    if (Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "line" || cursorMode == "camera") && drawing == false && helpscreen._visible == false)
    {
        cursorImage("hand");
    } // end if
} // End of the function
function setToolSwatch()
{
    panel.toolSwatches.swatchPencil.gotoAndStop(pencilMode + 2);
    panel.toolSwatches.swatchLine.gotoAndStop(pencilMode + 2);
    panel.toolSwatches.swatchEraser.gotoAndStop(pencilMode + 2);
} // End of the function
function showToolSwatch(isVisible)
{
    panel.toolSwatches.swatchPencil._visible = isVisible;
    panel.toolSwatches.swatchLine._visible = isVisible;
    panel.toolSwatches.swatchEraser._visible = isVisible;
} // End of the function
function HideToolSwatchesForHelp(isHidden)
{
    panel.toolSwatches._visible = !isHidden;
} // End of the function
function setPaletteSwatch(swatch)
{
    panel.swatches.selected._visible = true;
    switch (swatch)
    {
        case 1:
        {
            panel.swatches.blue.onPress();
            break;
        } 
        case 2:
        {
            panel.swatches.red.onPress();
            break;
        } 
        case 3:
        {
            panel.swatches.green.onPress();
            break;
        } 
        case 4:
        {
            panel.swatches.purple.onPress();
            break;
        } 
        case 5:
        {
            panel.swatches.brown.onPress();
            break;
        } 
        case 6:
        {
            panel.swatches.gray.onPress();
            break;
        } 
    } // End of switch
} // End of the function
function SetPanelEventFunctions()
{
    EnableCompassToolTips();
    for (var _loc7 in riders)
    {
        riders[_loc7].setOnEvents(true);
    } // end of for...in
    SetCamerasOnEvents(true);
    panel.lineB.onRollOver = panel.zoomB.onRollOver = panel.eraserB.onRollOver = panel.flagB.onRollOver = panel.handB.onRollOver = panel.pencilB.onRollOver = panel.playB.onRollOver = panel.stopB.onRollOver = panel.saveB.onRollOver = panel.trashB.onRollOver = function ()
    {
        active2 = false;
        cursor._visible = false;
        Mouse.show();
        tipRollOver(this);
    };
    panel.swatches.green.onRollOver = panel.swatches.red.onRollOver = panel.swatches.blue.onRollOver = panel.swatches.purple.onRollOver = panel.swatches.brown.onRollOver = panel.swatches.gray.onRollOver = panel.rider1B.onRollOver = panel.rider2B.onRollOver = panel.cameraB.onRollOver = function ()
    {
        active2 = false;
        cursor._visible = false;
        Mouse.show();
        tipRollOver(this);
        this._alpha = 50;
    };
    panel.lineB.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.lineB.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel.playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.trashB.onReleaseOutside = function ()
    {
        active2 = true;
        cursorImage(cursorMode);
        tipRollOut();
    };
    panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.swatches.purple.onRollOut = panel.swatches.brown.onRollOut = panel.swatches.gray.onRollOut = panel.rider1B.onRollOut = panel.rider2B.onRollOut = panel.cameraB.onRollOut = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.swatches.purple.onReleaseOutside = panel.swatches.brown.onReleaseOutside = panel.swatches.gray.onReleaseOutside = panel.rider1B.onReleaseOutside = panel.rider2B.onReleaseOutside = panel.cameraB.onReleaseOutside = function ()
    {
        active2 = true;
        cursorImage(cursorMode);
        tipRollOut();
        this._alpha = 100;
    };
    panel.handB.onPress = function ()
    {
        cursorMode = "hand";
        drawPencil();
        tla._x = canvasX;
        tla._y = canvasY;
        panel.swatches._visible = false;
        showToolSwatch(false);
        lastTool = "hand";
    };
    panel.swatches.blue.onPress = function ()
    {
        pencilMode = 0;
        cursor.pencil.gotoAndStop(1);
        panel.swatches.selected._visible = true;
        panel.swatches.selected._x = 15;
        setToolSwatch();
    };
    panel.swatches.red.onPress = function ()
    {
        pencilMode = 1;
        cursor.pencil.gotoAndStop(2);
        panel.swatches.selected._visible = true;
        panel.swatches.selected._x = 45;
        setToolSwatch();
    };
    panel.swatches.green.onPress = function ()
    {
        pencilMode = 2;
        cursor.pencil.gotoAndStop(3);
        panel.swatches.selected._visible = true;
        panel.swatches.selected._x = 75;
        setToolSwatch();
    };
    panel.swatches.brown.onPress = function ()
    {
        pencilMode = 4;
        cursor.pencil.gotoAndStop(5);
        panel.swatches.selected._visible = true;
        panel.swatches.selected._x = 105;
        setToolSwatch();
    };
    panel.swatches.purple.onPress = function ()
    {
        pencilMode = 3;
        cursor.pencil.gotoAndStop(4);
        panel.swatches.selected._visible = true;
        setToolSwatch();
    };
    panel.swatches.gray.onPress = function ()
    {
        pencilMode = 5;
        cursor.pencil.gotoAndStop(6);
        panel.swatches.selected._visible = true;
        panel.swatches.selected._x = 165;
        setToolSwatch();
    };
    panel.pencilB.onPress = function ()
    {
        cursorMode = "pencil";
        drawPencil();
        tla._x = canvasX;
        tla._y = canvasY;
        setPaletteSwatch(panel.toolSwatches.swatchPencil._currentframe - 1);
        panel.swatches._visible = true;
        panel.swatches.selected._visible = true;
        panel.toolSwatches.swatchPencil._visible = true;
        panel.toolSwatches.swatchLine._visible = false;
        panel.toolSwatches.swatchEraser._visible = false;
        lastTool = "pencil";
    };
    panel.lineB.onPress = function ()
    {
        cursorMode = "line";
        drawLine();
        tla._x = canvasX;
        tla._y = canvasY;
        setPaletteSwatch(panel.toolSwatches.swatchLine._currentframe - 1);
        panel.swatches._visible = true;
        panel.swatches.selected._visible = true;
        panel.toolSwatches.swatchPencil._visible = false;
        panel.toolSwatches.swatchLine._visible = true;
        panel.toolSwatches.swatchEraser._visible = false;
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
            showDummies(false);
            tla.flag._visible = false;
            TransientObjSimService.ClearAllLists();
            steuc.text = "0 lines";
            reset();
            panel.confirmDialog._visible = false;
            cursorImage(lastTool);
            panelMode("draw");
            panel[lastTool + "B"].onPress();
            pointToStartPoints();
            undoList = [];
            panel.fileDialog.name.text = "Untitled";
        };
        panel.confirmDialog.No.onRelease = function ()
        {
            panel.confirmDialog._visible = false;
            cursorImage(lastTool);
            panelMode("draw");
            panel[lastTool + "B"].onPress();
            disableConfirmButtons();
            if (Lines != 0)
            {
                panel.playB.enabled = true;
                panel.playB._alpha = 100;
            } // end if
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
        showToolSwatch(false);
        zoom();
        lastTool = "zoom";
    };
    panel.playB.onPress = function ()
    {
        if (Lines > 0)
        {
            clearInterval(framerateInterval);
            framerateInterval = setInterval(framerate, 1000);
            var _loc2 = cursorMode;
            slowMotion = false;
            cursorImage("normal");
            for (var _loc1 in riders)
            {
                riders[_loc1].rworld.body.face.gotoAndStop(1);
            } // end of for...in
            if (saved && !Key.isDown(65))
            {
                restore();
                for (var _loc1 in riders)
                {
                    riders[_loc1].setCrash(riders[_loc1].riding, true);
                    riders[_loc1].rworld.worldsled.sled.gotoAndStop(riders[_loc1].sledState);
                    riders[_loc1].rworld.body.face.gotoAndStop(riders[_loc1].faceState);
                } // end of for...in
                riderCameraIndex = savedRiderCameraIndex;
                riderCameraPanPercent = savedRiderCameraPanPercent;
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
                } // end else if
                for (var _loc1 in riders)
                {
                    riders[_loc1].setCrash(false, simulation);
                    riders[_loc1].rworld.worldsled.sled.gotoAndStop(1);
                    riders[_loc1].moveToStartPos();
                } // end of for...in
            } // end else if
            tla.clear();
            simulation = true;
            panelMode("simulate");
            renderLineSimAll();
            if (!Key.isDown(16))
            {
                tla._xscale = tla._yscale = INVSCALE;
            } // end if
            for (var _loc1 in riders)
            {
                riders[_loc1].scaleRider(tla._xscale, riders[_loc1]._x, riders[_loc1]._y);
            } // end of for...in
            if (!(saved && !Key.isDown(65)))
            {
                for (var _loc1 in riders)
                {
                    riders[_loc1].activateDots();
                } // end of for...in
            } // end if
            showRiders(true);
            SetCameraVisibilities(bCamerasAreVisibleInSimulation, false);
            help._visible = false;
            if (Key.isDown(90))
            {
                scaleRiderWorld(Math.max(tla._xscale * 0.900000, 20));
            } // end if
            if (Key.isDown(88))
            {
                scaleRiderWorld(Math.min(tla._xscale * 1.100000, 400));
            } // end if
            updateCamera();
            setCameraMode(0);
            bOnce = true;
            render();
            simulate();
        } // end if
    };
    panel.stopB.onPress = function ()
    {
        simulationPaused = false;
        panel._visible = true;
        steuc._visible = true;
        onEnterFrame = function ()
        {
        };
        if (lastTool != "camera")
        {
            panel[lastTool + "B"].onPress();
        } // end if
        if (tla.flag._visible)
        {
            panel.flagB.flagUp.gotoAndStop(2);
        } // end if
        showRiders(false);
        SetCameraVisibilities(true, false);
        tla._x = canvasX;
        tla._y = canvasY;
        tla._xscale = tla._yscale = bufScale;
        simulation = false;
        if (Lines != 0)
        {
            panel.playB.enabled = true;
            panel.playB._alpha = 100;
            panel.camera0._visible = true;
        } // end if
        TransientObjSimService.ResetAllLists();
        for (var _loc2 in lines)
        {
            if (titleMovieMode && !titleMovieEditor)
            {
                lines[_loc2].parent._alpha = 100;
            }
            else
            {
                if (lines[_loc2].type == 3)
                {
                    lines[_loc2].simReset();
                }
                else if (lines[_loc2].type == 7)
                {
                    removeLine(lines[_loc2]);
                } // end else if
                lines[_loc2].parent._alpha = 100;
            } // end else if
            renderLine(lines[_loc2]);
        } // end of for...in
        clearInterval(framerateInterval);
        steuc.text = Lines + " lines";
        panelMode("draw");
        if (lastTool == "camera")
        {
            panel[lastTool + "B"].onPress();
        } // end if
        help._visible = true;
        for (var _loc1 in riders)
        {
            if (!riders[_loc1].riding)
            {
                riders[_loc1].rworld.worldsled.sled.gotoAndStop(riders[_loc1].sledState);
                riders[_loc1].rworld.body.face.gotoAndStop(riders[_loc1].faceState);
            } // end if
        } // end of for...in
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
        if (Lines > 0)
        {
            panel.fileDialog.saveButton.enabled = true;
        }
        else
        {
            panel.fileDialog.saveButton.enabled = false;
        } // end else if
        panel.fileDialog.saveButton.onRelease = function ()
        {
            if (Lines > 0)
            {
                active = true;
                var _loc5 = new Array(Lines);
                var _loc13 = 0;
                for (var _loc10 in lines)
                {
                    var _loc1 = lines[_loc10];
                    _loc5[_loc13] = [_loc1.x1, _loc1.y1, _loc1.x2, _loc1.y2, _loc1.lim, Number(_loc1.inv), _loc1.prevLine, _loc1.nextLine, _loc1.name, _loc1.type];
                    ++_loc13;
                } // end of for...in
                var _loc6 = new Array(cameras.length);
                for (var _loc11 in cameras)
                {
                    var _loc2 = cameras[_loc11];
                    _loc6[_loc11] = [_loc2._x, _loc2._y, _loc2.showRider1, _loc2.showRider2, _loc2.usePanning];
                } // end of for...in
                var _loc8 = new Array(riders.length);
                for (var _loc12 in ridersInfo)
                {
                    var _loc4 = ridersInfo[_loc12];
                    _loc8[_loc12] = _loc4.type;
                } // end of for...in
                var _loc7 = removeSpaces(panel.fileDialog.name.text);
                var _loc9;
                for (var _loc3 = 0; _loc3 < savedTracks.data.trackList.length; ++_loc3)
                {
                    if (savedTracks.data.trackList[_loc3].label == _loc7)
                    {
                        _loc9 = _loc3;
                    } // end if
                } // end of for
                if (_loc9 != undefined)
                {
                    var _loc14 = savedTracks.data.trackList.splice(_loc9, 1);
                } // end if
                savedTracks.data.trackList.addItemAt(0, {label: _loc7, data: _loc5, level: totLines, startLine: [tla.startPoint._x, tla.startPoint._y], startLine2: [tla.startPoint2._x, tla.startPoint2._y], cameraData: _loc6, riderData: _loc8, version: ver});
                savedTracks.flush(savedTracks.getSize());
                panel.fileDialog._visible = false;
                panelMode("draw");
                panel[lastTool + "B"].onPress();
                cursorImage(cursorMode);
                disableFileButtons();
                panel.playB.enabled = true;
                panel.playB._alpha = 100;
                if (titleMovieMode)
                {
                    for (var _loc13 in savedTracks.data.trackList[0])
                    {
                        if (_loc13 != "riderData")
                        {
                            trace (_loc13 + "=" + savedTracks.data.trackList[0][_loc13] + "&");
                            continue;
                        } // end if
                        trace (_loc13 + "=" + savedTracks.data.trackList[0][_loc13][0].type + "," + savedTracks.data.trackList[0][_loc13][1].type + "&");
                    } // end of for...in
                    trace ("done=done");
                } // end if
            } // end if
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
                showDummies(false);
                tla.flag._visible = false;
                buffer = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].data;
                var _loc5 = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].version;
                if (_loc5 == undefined)
                {
                    _loc5 = "6";
                } // end if
                switchToVersion(_loc5);
                panel.fileDialog._visible = false;
                panel.fileDialog.name.text = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].label;
                segmentsRemainingToLoad = buffer.length;
                loadPerFrame = Math.max(15, Math.round(segmentsRemainingToLoad * 0.002000));
                loadBounds(buffer);
                showAll();
                camBuffer = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].cameraData;
                camerasRemainingToLoad = camBuffer.length;
                camloadPerFrame = Math.max(1, Math.round(camerasRemainingToLoad * 0.002000));
                if (tla._xscale > 100)
                {
                    tla._xscale = tla._yscale = bufScale = 100;
                    tla._x = tla._y = canvasX = canvasY = 0;
                } // end if
                panel.onEnterFrame = function ()
                {
                    if (segmentsRemainingToLoad > 0)
                    {
                        for (var _loc3 = 0; _loc3 < loadPerFrame && segmentsRemainingToLoad > 0; ++_loc3)
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
                                case 3:
                                {
                                    _loc2 = new FloorTrapdoor(UNITS_STEP_SIZE, _loc1[0], _loc1[1], _loc1[2], _loc1[3], Boolean(_loc1[5]), _loc1[4]);
                                    break;
                                } 
                                case 4:
                                {
                                    _loc2 = new FloorSlow(_loc1[0], _loc1[1], _loc1[2], _loc1[3], Boolean(_loc1[5]), _loc1[4]);
                                    break;
                                } 
                                case 5:
                                {
                                    _loc2 = new FloorInvisible(_loc1[0], _loc1[1], _loc1[2], _loc1[3], Boolean(_loc1[5]), _loc1[4]);
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
                        } // end of for
                        steuc.text = Math.floor((buffer.length - segmentsRemainingToLoad) / buffer.length * 100) + "% loaded";
                    }
                    else if (camerasRemainingToLoad > 0)
                    {
                        for (var _loc3 = 0; _loc3 < camloadPerFrame && camerasRemainingToLoad > 0; ++_loc3)
                        {
                            _loc1 = camBuffer[camBuffer.length - camerasRemainingToLoad];
                            if (camBuffer.length != camerasRemainingToLoad)
                            {
                                addCamera(false, true);
                            } // end if
                            --camerasRemainingToLoad;
                            cameras[cameras.length - 1 + _loc3]._x = _loc1[0];
                            cameras[cameras.length - 1 + _loc3]._y = _loc1[1];
                            cameras[cameras.length - 1 + _loc3].showRider1 = _loc1[2];
                            cameras[cameras.length - 1 + _loc3].showRider2 = _loc1[3];
                            cameras[cameras.length - 1 + _loc3].usePanning = _loc1[4];
                        } // end of for
                        steuc.text = Math.floor((camBuffer.length - camerasRemainingToLoad) / camBuffer.length * 100) + "% loaded";
                    }
                    else
                    {
                        finishLoad(savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex]);
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
            if (Lines != 0)
            {
                panel.playB.enabled = true;
                panel.playB._alpha = 100;
            } // end if
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
            showDummies(false);
            tla.flag._visible = false;
            TransientObjSimService.ClearAllLists();
        } // end else if
    };
    panel.eraserB.onPress = function ()
    {
        cursorMode = "eraser";
        panel.toolSwatches.swatchEraser.gotoAndStop(1);
        pencilMode = -1;
        panel.swatches.selected._visible = false;
        panel.swatches._visible = true;
        panel.toolSwatches.swatchPencil._visible = false;
        panel.toolSwatches.swatchLine._visible = false;
        panel.toolSwatches.swatchEraser._visible = true;
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
            pointToStartPoints();
        };
        onEnterFrame = function ()
        {
        };
        lastTool = "eraser";
    };
    panel.cameraB.onPress = function ()
    {
        panel.cameraB._alpha = 30;
        if (simulation)
        {
            bCamerasAreVisibleInSimulation = !bCamerasAreVisibleInSimulation;
            SetCameraVisibilities(bCamerasAreVisibleInSimulation, false);
            return;
        } // end if
        cursorMode = "camera";
        tla._xscale = tla._yscale = bufScale;
        tla._x = canvasX;
        tla._y = canvasY;
        panel.swatches._visible = false;
        showToolSwatch(false);
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
                    addCamera();
                } // end if
            } // end else if
        };
        onMouseUp = function ()
        {
            canvasX = tla._x;
            canvasY = tla._y;
            stopDrag ();
        };
        onMouseMove = function ()
        {
        };
        onEnterFrame = function ()
        {
        };
        lastTool = "camera";
    };
} // End of the function
function updateCameraTeloBs()
{
    var _loc1 = ridersInfo[1].type;
    if (_loc1 == 0)
    {
        _loc1 = cameras[0].rider1._totalframes;
    } // end if
    for (var _loc2 in cameras)
    {
        cameras[_loc2].gotoAndStop(1 + cameras[_loc2].showRider1 + 2 * cameras[_loc2].showRider2 + 4 * cameras[_loc2].usePanning);
        if (cameras[_loc2].cameraIc._currentframe != 3)
        {
            cameras[_loc2].cameraIc.gotoAndStop(1 + cameras[_loc2].usePanning);
        } // end if
        if (cameras[_loc2].showRider1 == false && cameras[_loc2].showRider2 == false)
        {
            cameras[_loc2].rider1.gotoAndStop(cameras[_loc2].rider1._totalframes);
        }
        else
        {
            cameras[_loc2].rider1.gotoAndStop(ridersInfo[0].type);
        } // end else if
        if (cameras[_loc2].showRider2)
        {
            cameras[_loc2].rider2.gotoAndStop(_loc1);
        } // end if
        cameras[_loc2].rider1.riderName._visible = false;
        cameras[_loc2].rider2.riderName._visible = false;
    } // end of for...in
} // End of the function
function openCameraDialog(cameraRef)
{
    cameraRef.help._visible = false;
    cameraRef.arrows._visible = false;
    cursorImage("normal");
    panelMode("cameraEdit");
    panel.cameraDialog.cameraRef = cameraRef;
    panel.cameraDialog.cbRider1.selected = cameraRef.showRider1;
    panel.cameraDialog.cbRider2.selected = cameraRef.showRider2;
    panel.cameraDialog.cbPan.selected = cameraRef.usePanning;
    panel.cameraDialog._visible = true;
    cameraRef.cameraHighlight._visible = true;
    if (cameras[0] == cameraRef)
    {
        panel.cameraDialog.Delete.enabled = false;
        panel.cameraDialog.cbPan.enabled = false;
    }
    else
    {
        panel.cameraDialog.Delete.enabled = true;
        panel.cameraDialog.cbPan.enabled = true;
    } // end else if
    tipReleaseOutside();
    active = false;
    active2 = false;
} // End of the function
function SetCameraOnEvents(newCameraIndex)
{
    cameras[newCameraIndex].onPress = function ()
    {
        if (simulation)
        {
            return;
        } // end if
        if (active == true && active2 == false)
        {
            if (Key.isDown(68) && cameras[0] != this)
            {
                this.swapDepths(tla.getNextHighestDepth());
                startDrag (this, false);
                this.help._visible = false;
                this.arrows._visible = true;
            }
            else
            {
                openCameraDialog(this);
            } // end if
        } // end else if
    };
    cameras[newCameraIndex].onRelease = function ()
    {
        if (simulation)
        {
            return;
        } // end if
        if (active == true && active2 == false && cameras[0] != this)
        {
            stopDrag ();
            this.help._visible = true;
            this.arrows._visible = false;
        }
        else
        {
            cameras[cameras.length].onPress();
        } // end else if
    };
    cameras[newCameraIndex].onRollOver = function ()
    {
        if (simulation)
        {
            return;
        } // end if
        if (active == true && active2 == true)
        {
            _root.active2 = false;
            if (cameras[0] != this)
            {
                this.help._visible = true;
            } // end if
            _root.cursor._visible = false;
            Mouse.show();
        } // end if
    };
    cameras[newCameraIndex].onRollOut = function ()
    {
        if (simulation)
        {
            return;
        } // end if
        if (active == true && active2 == false)
        {
            _root.active2 = true;
            if (cameras[0] != this)
            {
                this.help._visible = false;
                this.arrows._visible = false;
            } // end if
            _root.cursorImage(_root.cursorMode);
        } // end if
    };
    cameras[newCameraIndex].onReleaseOutside = function ()
    {
        if (simulation)
        {
            return;
        } // end if
        if (active == true && active2 == false)
        {
            _root.active2 = true;
            if (!Key.isDown(68) && cameras[0] != this)
            {
                this.arrows._visible = false;
            } // end if
        } // end if
    };
} // End of the function
function addCamera(isCamera0, isLoad)
{
    var _loc1 = cameras.length;
    if (simulation)
    {
        return;
    } // end if
    if (isCamera0)
    {
        _loc1 = 0;
        cameras[_loc1] = panel.camera0;
        cameras[_loc1].help._visible = false;
        cameras[_loc1].arrows._visible = false;
    }
    else
    {
        cameras[_loc1] = tla.attachMovie("CameraBase", "camera" + _loc1, tla.getNextHighestDepth());
        cameras[_loc1]._x = (cursor._x - tla._x) * 100 / tla._xscale;
        cameras[_loc1]._y = (cursor._y - tla._y) * 100 / tla._yscale;
    } // end else if
    cameras[_loc1].cameraID = _loc1;
    cameras[_loc1].gotoAndStop(2);
    cameras[_loc1].showRider1 = true;
    cameras[_loc1].showRider2 = false;
    cameras[_loc1].usePanning = false;
    cameras[_loc1].help._visible = false;
    cameras[_loc1].arrows._visible = false;
    cameras[_loc1].cameraHighlight._visible = false;
    cameras[_loc1].rider1.gotoAndStop(ridersInfo[0].type);
    cameras[_loc1].rider2.gotoAndStop(cameras[_loc1].rider2._totalframes);
    if (_loc1 != 0)
    {
        cameras[_loc1].cameraIc.gotoAndStop(1);
    }
    else
    {
        cameras[_loc1].cameraIc.gotoAndStop(3);
        cameras[_loc1].cameraBackground._visible = false;
    } // end else if
    SetCameraOnEvents(_loc1);
    if (!isCamera0 && !isLoad)
    {
        openCameraDialog(cameras[_loc1]);
    } // end if
} // End of the function
function UpdateCameraTriggerIcon()
{
    if (!panel.cameraDialog.cameraRef.showRider1 && !panel.cameraDialog.cameraRef.showRider2)
    {
        panel.cameraDialog.cameraRef.rider1.gotoAndStop(panel.cameraDialog.cameraRef.rider1._totalframes);
    }
    else
    {
        panel.cameraDialog.cameraRef.rider1.gotoAndStop(ridersInfo[0].type);
    } // end else if
    if (ridersInfo[1].type == 0)
    {
        panel.cameraDialog.cameraRef.rider2.gotoAndStop(panel.cameraDialog.cameraRef.rider2._totalframes);
    }
    else
    {
        panel.cameraDialog.cameraRef.rider2.gotoAndStop(ridersInfo[1].type);
    } // end else if
} // End of the function
function fireCameraTriggers()
{
    for (var _loc1 = 1; _loc1 < cameras.length; ++_loc1)
    {
        bTriggeredByRider1 = false;
        bTriggeredByRider2 = false;
        if (Math.abs(cameras[_loc1]._x - ridersInfo[0].rworld.body._x) <= 12.500000 && Math.abs(cameras[_loc1]._y - ridersInfo[0].rworld.body._y) <= 12.500000)
        {
            bTriggeredByRider1 = true;
        } // end if
        if (Math.abs(cameras[_loc1]._x - ridersInfo[1].rworld.body._x) <= 12.500000 && Math.abs(cameras[_loc1]._y - ridersInfo[1].rworld.body._y) <= 12.500000)
        {
            bTriggeredByRider2 = true;
        } // end if
        if (bTriggeredByRider1 || bTriggeredByRider2)
        {
            setCameraMode(_loc1);
        } // end if
    } // end of for
} // End of the function
function setCameraMode(cameraIndex)
{
    riderCameraPanStartPointX = tla._x;
    riderCameraPanStartPointY = tla._y;
    switch (Number(cameras[cameraIndex].showRider1) + 2 * Number(cameras[cameraIndex].showRider2) + 4 * Number(cameras[cameraIndex].usePanning))
    {
        case 0:
        {
            riderCameraIndex = 5;
            break;
        } 
        case 1:
        {
            riderCameraPanPercent = 0;
            riderCameraIndex = 0;
            break;
        } 
        case 2:
        {
            riderCameraPanPercent = 1;
            riderCameraIndex = 1;
            break;
        } 
        case 3:
        {
            riderCameraPanPercent = 0.500000;
            riderCameraIndex = 4;
            break;
        } 
        case 4:
        {
            riderCameraIndex = 6;
            velocityX = lasttlaX - tla._x;
            velocityY = lasttlaY - tla._y;
            break;
        } 
        case 5:
        {
            riderCameraIndex = 3;
            riderCameraPanPercent = 1;
            break;
        } 
        case 6:
        {
            riderCameraIndex = 2;
            riderCameraPanPercent = 0;
            break;
        } 
        case 7:
        {
            riderCameraIndex = 4;
            riderCameraPanPercent = 0;
            break;
        } 
    } // End of switch
} // End of the function
function SetCameraVisibilities(bIsVisible, bSkip0)
{
    for (var _loc1 in cameras)
    {
        if (!((bSkip0 || Lines == 0) && _loc1 == 0))
        {
            cameras[_loc1]._visible = bIsVisible;
        } // end if
    } // end of for...in
} // End of the function
function setCameraAlphas(nNewAlpha, bSkip0)
{
    for (var _loc2 in cameras)
    {
        if (!(bSkip0 && _loc2 == 0))
        {
            cameras[_loc2]._alpha = nNewAlpha;
        } // end if
    } // end of for...in
} // End of the function
function setCameraEnableds(bNewEnabled, bSkip0)
{
    for (var _loc2 in cameras)
    {
        if (!(bSkip0 && _loc2 == 0))
        {
            cameras[_loc2].enabled = bNewEnabled;
        } // end if
    } // end of for...in
} // End of the function
function removeSpaces(str)
{
    while (str.charAt(str.length - 1) == " ")
    {
        str = str.substr(0, str.length - 1);
    } // end while
    return (str);
} // End of the function
function finishLoad(track)
{
    panel.onEnterFrame = function ()
    {
    };
    if (lines["line" + track.startLine] == undefined && typeof(track.startLine) == "number")
    {
        var _loc1 = [];
        _loc1[0] = 100;
        _loc1[1] = 100;
    }
    else if (typeof(track.startLine) == "number")
    {
        _loc1 = [];
        _loc1[0] = lines["line" + track.startLine].x1;
        _loc1[1] = lines["line" + track.startLine].y1 - 50 * SCALEDOWN;
    }
    else
    {
        _loc1 = track.startLine;
    } // end else if
    ridersInfo[0].startPoint._x = _loc1[0];
    ridersInfo[0].startPoint._y = _loc1[1];
    var _loc4 = track.version;
    if (_loc4 < "7.0")
    {
        ridersInfo[0].type = 1;
        ridersInfo[1].type = 0;
    }
    else
    {
        if (lines["line" + track.startLine2] == undefined && typeof(track.startLine2) == "number")
        {
            _loc1 = [];
            _loc1[0] = 100;
            _loc1[1] = 100;
        }
        else if (typeof(track.startLine2) == "number")
        {
            _loc1 = [];
            _loc1[0] = lines["line" + track.startLine2].x1;
            _loc1[1] = lines["line" + track.startLine2].y1 - 50 * SCALEDOWN;
        }
        else
        {
            _loc1 = track.startLine2;
        } // end else if
        ridersInfo[1].startPoint._x = _loc1[0];
        ridersInfo[1].startPoint._y = _loc1[1];
        ridersInfo[0].type = track.riderData[0];
        ridersInfo[1].type = track.riderData[1];
    } // end else if
    totLines = track.level;
    panel[lastTool + "B"].onPress();
    cursorImage(cursorMode);
    panelMode("draw");
    cleanup();
    init();
    for (var _loc3 in ridersInfo)
    {
        ridersInfo[_loc3].activateRider(ridersInfo[_loc3].type != 0);
    } // end of for...in
    pointToStartPoints();
    steuc.text = Lines + " lines";
    if (Lines != 0)
    {
        panel.playB.enabled = true;
        panel.playB._alpha = 100;
        panel.camera0._visible = true;
    } // end if
    updateCameraTeloBs();
} // End of the function
function disableFileButtons()
{
    fucusManager.enabled = false;
    panel.fileDilag.saveButton.enabled = panel.fileDilag.loadButton.enabled = panel.fileDilag.deleteButton.enabled = panel.fileDilag.close.enabled = false;
    panel.fileDialog.name.editable = false;
    panel.fileDialog.saveButton.onRelease = panel.fileDialog.loadButton.onRelease = panel.fileDialog.deleteButton.onRelease = panel.fileDialog.close.onPress = function ()
    {
    };
    active = true;
} // End of the function
function enableFileButtons()
{
    panel.fileDilag.saveButton.enabled = panel.fileDilag.loadButton.enabled = panel.fileDilag.deleteButton.enabled = panel.fileDilag.close.enabled = true;
    panel.fileDialog.name.editable = true;
    tipReleaseOutside();
    active = false;
} // End of the function
function disableConfirmButtons()
{
    panel.confirmDialog.Yes.enabled = panel.confirmDialog.No.enabled = false;
    panel.confirmDialog.Yes.onRelease = panel.confirmDialog.No.onRelease = function ()
    {
    };
    active = true;
} // End of the function
function enableConfirmButtons()
{
    panel.confirmDialog.Yes.enabled = panel.confirmDialog.No.enabled = true;
    tipReleaseOutside();
    active = false;
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
    riders[0] = new RiderBase(true, tla, world1, tla.dummy, compas, tla.startPoint, SCALEDOWN, 0, 0, 0, 0, 0, 0, ridersInfo[0].type, panel.rider1B);
    if (ridersInfo[1].type != 0)
    {
        riders[1] = new RiderBase(true, tla, world2, tla.dummy2, compas2, tla.startPoint2, SCALEDOWN, DOTS_PER_RIDER, DOTS2_PER_RIDER, DOTSBRAID_PER_RIDER, 24, 6, 10, ridersInfo[1].type, panel.rider2B);
    } // end if
    for (var _loc1 in lines)
    {
        lines[_loc1].simReset();
    } // end of for...in
    TransientObjSimService.ClearAllLists();
} // End of the function
function cleanup()
{
    if (riders[0] != undefined)
    {
        riders[0].cleanup();
        delete riders[0];
        riders[0] = undefined;
    } // end if
    if (riders[1] != undefined)
    {
        riders[1].cleanup();
        delete riders[1];
        riders[1] = undefined;
    } // end if
} // End of the function
function reset()
{
    initEditorMode(titleMovieMode);
    saved = saveNow = false;
    simulation = false;
    showStartPoints(false);
    showStartPointsHelp(false);
    showStartPointsArrows(false);
    showCompasses(false);
    DisableCompassToolTips();
    clearFloor();
    lines = new Object();
    Lines = 0;
    panel.playB.enabled = false;
    panel.playB._alpha = 30;
    panel.camera0._visible = false;
    totLines = 0;
    grid = [];
    maxX = 0;
    maxY = 0;
    minX = Stage.width;
    minY = Stage.height;
    canvasX = canvasY = tla._x = tla._y = 0;
    tla._xscale = tla._yscale = bufScale = 100;
    for (var _loc1 in cameras)
    {
        if (_loc1 != 0)
        {
            cameras[_loc1].removeMovieClip();
            delete cameras[_loc1];
        } // end if
    } // end of for...in
    cameras = [];
    if (cameras.length == 0)
    {
        addCamera(true);
        if (Lines == 0)
        {
            cameras[0]._visible = false;
        } // end if
    } // end if
    clearInterval(freezeTitleInterval);
} // End of the function
function snap(x, y, vert, invert)
{
    var _loc2 = Math.pow(SNAP_DISTANCE / (tla._xscale * 0.010000), 2);
    var _loc10 = x;
    var _loc11 = y;
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
                        _loc10 = _loc1.x1;
                        _loc11 = _loc1.y1;
                        _loc8 = 1;
                        _loc9 = _loc1;
                    } // end if
                    if (_loc6 < _loc2 && _loc1.nextLine == undefined)
                    {
                        _loc2 = _loc6;
                        _loc10 = _loc1.x2;
                        _loc11 = _loc1.y2;
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
            _loc10 = x;
            _loc11 = y;
        } // end if
    } // end if
    return ([_loc10, _loc11, _loc8, _loc9]);
} // End of the function
function resetPosition()
{
    for (var _loc2 in riders)
    {
        riders[_loc2].reset();
    } // end of for...in
    for (var _loc1 in lines)
    {
        lines[_loc1].simReset();
    } // end of for...in
    TransientObjSimService.ResetAllLists();
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
            var _loc5 = "y" + (_loc15.y + _loc7);
            if (grid[_loc6][_loc5] == undefined)
            {
                continue;
            } // end if
            for (var _loc16 in grid[_loc6][_loc5].storage2)
            {
                var _loc1 = grid[_loc6][_loc5].storage2[_loc16];
                var _loc2 = x - _loc1.x1;
                var _loc3 = y - _loc1.y1;
                var _loc10 = Math.sqrt(Math.pow(_loc2, 2) + Math.pow(_loc3, 2));
                var _loc11 = Math.sqrt(Math.pow(x - _loc1.x2, 2) + Math.pow(y - _loc1.y2, 2));
                var _loc9 = Math.abs(_loc1.nx * _loc2 + _loc1.ny * _loc3);
                var _loc4 = (_loc2 * _loc1.dx + _loc3 * _loc1.dy) * _loc1.invSqrDis;
                if (_loc10 < ERASER_SIZE * _loc8 || _loc11 < ERASER_SIZE * _loc8 || _loc9 < ERASER_SIZE * _loc8 && _loc4 >= 0 && _loc4 <= 1)
                {
                    switch (pencilMode)
                    {
                        case 0:
                        {
                            if (_loc1 != Floor(_loc1) || _loc1 == FloorInvisible(_loc1))
                            {
                                continue;
                            } // end if
                            break;
                        } 
                        case 1:
                        {
                            if (_loc1 != FloorAcc(_loc1) || _loc1 == FloorSlow(_loc1))
                            {
                                continue;
                            } // end if
                            break;
                        } 
                        case 2:
                        {
                            if (_loc1 != FloorScenery(_loc1))
                            {
                                continue;
                            } // end if
                            break;
                        } 
                        case 3:
                        {
                            if (_loc1 != FloorTrapdoor(_loc1))
                            {
                                continue;
                            } // end if
                            break;
                        } 
                        case 4:
                        {
                            if (_loc1 != FloorSlow(_loc1))
                            {
                                continue;
                            } // end if
                            break;
                        } 
                        case 5:
                        {
                            if (_loc1 != FloorInvisible(_loc1))
                            {
                                continue;
                            } // end if
                            break;
                        } 
                    } // End of switch
                    removeLine(_loc1);
                } // end if
            } // end of for...in
        } // end of for
    } // end of for
} // End of the function
function save()
{
    for (var _loc1 in riders)
    {
        riders[_loc1].save();
    } // end of for...in
    for (var _loc2 in lines)
    {
        lines[_loc2].simSave();
    } // end of for...in
    TransientObjSimService.SaveAllLists();
} // End of the function
function restore()
{
    for (var _loc2 in lines)
    {
        lines[_loc2].simRestore();
    } // end of for...in
    TransientObjSimService.RestoreAllLists();
    for (var _loc1 in riders)
    {
        riders[_loc1].restore();
    } // end of for...in
} // End of the function
function pan()
{
    var _loc1 = tla._xscale * 0.010000;
    tla.startDrag(false);
    pointToStartPoints();
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
                    var _loc1 = Math.min(Math.max(oldScale + (oldy - _ymouse) * 0.500000, 5), 600);
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
        pointToStartPoints();
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
    ridersInfo[0].startPoint._x = ridersInfo[1].startPoint._x = line.x1;
    ridersInfo[0].startPoint._y = ridersInfo[1].startPoint._y = line.y1 - 50 * SCALEDOWN;
    ridersInfo[1].startPoint._y = ridersInfo[1].startPoint._y - 60 * SCALEDOWN;
    pointToStartPoints();
} // End of the function
function getLastLine()
{
    var _loc1 = undoList.length - 1;
    var _loc2;
    while (_loc2 == undefined && Lines > 0)
    {
        _loc2 = lines["line" + undoList[_loc1]];
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
        _loc2 = lines["line" + undoList[_loc1]];
        ++_loc1;
    } // end while
    return (_loc2);
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
    ++Lines;
    if (Lines == 1)
    {
        showStartPoints(true);
        showCompasses(true);
        makeStartPoint(line);
        EnableCompassToolTips();
        panel.playB.enabled = true;
        panel.playB._alpha = 100;
        panel.camera0._visible = true;
    } // end if
    if (!simulation)
    {
        steuc.text = Lines + " lines";
    } // end if
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
    if (!simulation)
    {
        steuc.text = Lines + " lines";
    } // end if
    tla[line.name].removeMovieClip();
    removeFromGrid(line);
    if (Lines == 0)
    {
        startLine = undefined;
        panel.playB.enabled = false;
        panel.playB._alpha = 30;
        panel.camera0._visible = false;
        showCompasses(false);
        showStartPoints(false);
        DisableCompassToolTips();
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
        switchToVersion(VERSION);
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
                                case 3:
                                {
                                    _loc1 = new FloorTrapdoor(UNITS_STEP_SIZE, tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                                    break;
                                } 
                                case 4:
                                {
                                    _loc1 = new FloorSlow(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                                    break;
                                } 
                                case 5:
                                {
                                    _loc1 = new FloorInvisible(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
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
        pointToStartPoints();
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
                case 3:
                {
                    _loc1 = new FloorTrapdoor(UNITS_STEP_SIZE, tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                    break;
                } 
                case 4:
                {
                    _loc1 = new FloorSlow(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                    break;
                } 
                case 5:
                {
                    _loc1 = new FloorInvisible(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
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
                    var _loc2 = _loc1[2] == 2 ? (-1) : (1);
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
        pointToStartPoints();
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
                case 3:
                {
                    _loc1 = new FloorTrapdoor(UNITS_STEP_SIZE, tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                    break;
                } 
                case 4:
                {
                    _loc1 = new FloorSlow(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                    break;
                } 
                case 5:
                {
                    _loc1 = new FloorInvisible(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
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
        if (titleMovieMode && simulationPaused)
        {
            return;
        } // end if
        bur = getTimer();
        if (!slowMotion || bur - pre > 200)
        {
            pre = bur;
            for (var _loc1 in riders)
            {
                riders[_loc1].physics();
            } // end of for...in
            TransientObjSimService.UpdateAllLists();
            render();
            if (saveNow)
            {
                save();
                if (Key.isDown(67))
                {
                    tla.flag._visible = false;
                    showBureks();
                }
                else
                {
                    showDummies(false);
                    tla.flag._visible = true;
                    if (riders[0].crash)
                    {
                        tla.flag._x = riders[0].dots[4].x;
                        tla.flag._y = riders[0].dots[4].y;
                    }
                    else
                    {
                        tla.flag._x = riders[0].dots[1].x;
                        tla.flag._y = riders[0].dots[1].y;
                    } // end else if
                } // end else if
                saveNow = false;
                for (var _loc1 in riders)
                {
                    riders[_loc1].riding = riders[_loc1].crash;
                    riders[_loc1].sledState = riders[_loc1].rworld.worldsled.sled._currentframe;
                    riders[_loc1].faceState = riders[_loc1].rworld.body.face._currentframe;
                } // end of for...in
                savedRiderCameraIndex = riderCameraIndex;
                savedRiderCameraPanPercent = riderCameraPanPercent;
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
        case 3:
        {
            _loc2.lineStyle(4 * SCALEDOWN, 13369548, 100, true, "normal", "round");
            _loc2.moveTo(line.x1 + _loc3 + FloorTrapdoor(line).currentdx, line.y1 + _loc4 + FloorTrapdoor(line).currentdy);
            _loc2.lineTo(line.x2 + _loc3 - line.dx * line.invDst * 5, line.y2 + _loc4 - line.dy * line.invDst * 5);
            _loc2.lineStyle(4 * SCALEDOWN, 0, 100, true, "normal", "round");
            _loc2.moveTo(line.x1 + FloorTrapdoor(line).currentdx, line.y1 + FloorTrapdoor(line).currentdy);
            _loc2.lineTo(line.x2, line.y2);
            break;
        } 
        case 4:
        {
            _loc2.lineStyle(5 * SCALEDOWN, 6697728, 100, true, "normal", "none", "miter");
            _loc2.moveTo(line.x1 + _loc3, line.y1 + _loc4);
            _loc2.lineTo(line.x2 + _loc3, line.y2 + _loc4);
            _loc2.moveTo(line.x2, line.y2);
            _loc2.curveTo(line.x2 + line.nx * 8 - line.dx * line.invDst * 2.500000, line.y2 + line.ny * 8 - line.dy * line.invDst * 2.500000, line.x2 - line.dx * line.invDst * 5, line.y2 - line.dy * line.invDst * 5);
            _loc2.lineStyle(4 * SCALEDOWN, 0, 100, true, "normal", "round");
            _loc2.moveTo(line.x1, line.y1);
            _loc2.lineTo(line.x2, line.y2);
            break;
        } 
        case 5:
        {
            _loc2.lineStyle(4 * SCALEDOWN, 13421772, 100, true, "normal", "round");
            _loc2.moveTo(line.x1 + _loc3, line.y1 + _loc4);
            _loc2.lineTo(line.x2 + _loc3, line.y2 + _loc4);
            _loc2.lineStyle(4 * SCALEDOWN, 10066329, 100, true, "normal", "round");
            _loc2.moveTo(line.x1, line.y1);
            _loc2.lineTo(line.x2, line.y2);
            break;
        } 
    } // End of switch
    _loc2.cacheAsBitmap = true;
} // End of the function
function scaleRiderWorld(newScale)
{
    var _loc3 = tla._xscale;
    tla._xscale = tla._yscale = newScale;
    tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (newScale / _loc3);
    tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (newScale / _loc3);
    for (var _loc2 in riders)
    {
        riders[_loc2].scaleRider(newScale, tla._x, tla._y);
    } // end of for...in
} // End of the function
function render()
{
    if (Key.isDown(88))
    {
        scaleRiderWorld(Math.max(tla._xscale * 0.900000, 20));
    } // end if
    if (Key.isDown(90))
    {
        scaleRiderWorld(Math.min(tla._xscale * 1.100000, 300));
    } // end if
    updateCamera();
    renderRiders();
    fireCameraTriggers();
} // End of the function
function satisfyBoundaries(dots)
{
    for (var _loc7 = 0; _loc7 < dots.length; ++_loc7)
    {
        var _loc5 = dots[_loc7];
        if (!_loc5.active)
        {
            continue;
        } // end if
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
                for (var _loc8 in grid[_loc1][_loc2].storage)
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
function framerate()
{
    steuc.text = frameCounter + " fps";
    frameCounter = 0;
} // End of the function
function SetHelpEventFunctions()
{
    DisableCompassToolTips();
    compas.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(22);
        mouse.show();
    };
    compas2.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(23);
        mouse.show();
    };
    tipReleaseOutside();
    panel.lineB.onRollOver = panel.swatches.blue.onRollOver = panel.swatches.red.onRollOver = panel.swatches.green.onRollOver = panel.swatches.purple.onRollOver = panel.swatches.brown.onRollOver = panel.swatches.gray.onRollOver = panel.zoomB.onRollOver = panel.eraserB.onRollOver = panel.flagB.onRollOver = panel.handB.onRollOver = panel.pencilB.onRollOver = panel.playB.onRollOver = panel.stopB.onRollOver = panel.saveB.onRollOver = panel.trashB.onRollOver = panel.rider1B.onRollOver = panel.rider2B.onRollOver = panel.cameraB.onRollOver = panel.camera0.onRollOver = panel.lineB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.swatches.purple.onRollOut = panel.swatches.brown.onRollOut = panel.swatches.gray.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.rider1B.onRollOut = panel.rider2B.onRollOut = panel.cameraB.onRollOut = panel.camera0.onRollOut = panel.lineB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.swatches.purple.onReleaseOutside = panel.swatches.brown.onReleaseOutside = panel.swatches.gray.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel.playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.trashB.onReleaseOutside = panel.rider1B.onReleaseOutside = panel.rider2B.onReleaseOutside = panel.cameraB.onReleaseOutside = panel.camera0.onReleaseOutside = panel.lineB.onPress = panel.swatches.blue.onPress = panel.swatches.red.onPress = panel.swatches.green.onPress = panel.swatches.purple.onPress = panel.swatches.brown.onPress = panel.swatches.gray.onPress = panel.zoomB.onPress = panel.eraserB.onPress = panel.flagB.onPress = panel.handB.onPress = panel.pencilB.onPress = panel.playB.onPress = panel.stopB.onPress = panel.saveB.onPress = panel.trashB.onPress = panel.rider1B.onPress = panel.rider2B.onPress = panel.cameraB.onPress = panel.camera0.onPress = panel.lineB.onRelease = panel.swatches.blue.onRelease = panel.swatches.red.onRelease = panel.swatches.green.onRelease = panel.swatches.purple.onRelease = panel.swatches.brown.onRelease = panel.swatches.gray.onRelease = panel.zoomB.onRelease = panel.eraserB.onRelease = panel.flagB.onRelease = panel.handB.onRelease = panel.pencilB.onRelease = panel.playB.onRelease = panel.stopB.onRelease = panel.saveB.onRelease = panel.trashB.onRelease = panel.rider1B.onRelease = panel.rider2B.onRelease = panel.cameraB.onRelease = panel.camera0.onRelease = startpoint.onRollOver = startpoint.onRollOut = startpoint.onReleaseOutside = startpoint.onPress = startpoint.onRelease = startpoint2.onRollOver = startpoint2.onRollOut = startpoint2.onReleaseOutside = startpoint2.onPress = startpoint2.onRelease = function ()
    {
    };
    for (var _loc2 in riders)
    {
        riders[_loc2].setOnEvents(false);
    } // end of for...in
    SetCamerasOnEvents(false);
    panel.cameraB.onPress = function ()
    {
        this._alpha = 30;
    };
    panel.cameraB.onRelease = function ()
    {
        this._alpha = 50;
    };
    panel.cameraB.onRollOut = function ()
    {
        this._alpha = 100;
    };
    panel.pencilB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(2);
        mouse.show();
    };
    panel.lineB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(3);
        mouse.show();
    };
    panel.eraserB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(4);
        mouse.show();
    };
    panel.zoomB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(6);
        mouse.show();
    };
    panel.handB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(7);
        mouse.show();
    };
    panel.playB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(8);
        mouse.show();
    };
    panel.stopB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(9);
        mouse.show();
    };
    panel.flagB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(10);
        mouse.show();
    };
    panel.saveB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(11);
        mouse.show();
    };
    panel.trashB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(12);
        mouse.show();
    };
    helpscreen.icons.editor.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(13);
        mouse.show();
        this._alpha = 50;
    };
    helpscreen.icons.simulator.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(14);
        mouse.show();
        this._alpha = 50;
    };
    panel.swatches.red.onRollOver = panel.swatches.green.onRollOver = panel.swatches.blue.onRollOver = function ()
    {
        if (invisibleLinesEnabled && trapdoorLinesEnabled)
        {
            helpscreen.texts.gotoAndStop(5);
        }
        else
        {
            helpscreen.texts.gotoAndStop(25);
        } // end else if
        mouse.show();
        this._alpha = 50;
    };
    panel.swatches.purple.onRollOver = panel.swatches.brown.onRollOver = panel.swatches.gray.onRollOver = function ()
    {
        if (invisibleLinesEnabled)
        {
            helpscreen.texts.gotoAndStop(19);
        }
        else if (trapdoorLinesEnabled)
        {
            helpscreen.texts.gotoAndStop(24);
        }
        else
        {
            helpscreen.texts.gotoAndStop(25);
        } // end else if
        mouse.show();
        this._alpha = 50;
    };
    helpscreen.icons.startPoint.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(15);
        mouse.show();
        this._alpha = 50;
    };
    helpscreen.icons.helpCameraB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(20);
        mouse.show();
        this._alpha = 50;
    };
    panel.rider1B.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(16);
        mouse.show();
        this._alpha = 50;
    };
    panel.rider2B.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(17);
        mouse.show();
        this._alpha = 50;
    };
    panel.cameraB.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(18);
        mouse.show();
        this._alpha = 50;
    };
    panel.camera0.onRollOver = function ()
    {
        helpscreen.texts.gotoAndStop(21);
        mouse.show();
        this._alpha = 50;
    };
    helpscreen.icons.startPoint.onRollOut = helpscreen.icons.editor.onRollOut = helpscreen.icons.simulator.onRollOut = helpscreen.icons.helpCameraB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.swatches.purple.onRollOut = panel.swatches.brown.onRollOut = panel.swatches.gray.onRollOut = panel.rider1B.onRollOut = panel.rider2B.onRollOut = panel.cameraB.onRollOut = panel.camera0.onRollOut = helpscreen.icons.startPoint.onReleaseOutside = helpscreen.icons.editor.onReleaseOutside = helpscreen.icons.simulator.onReleaseOutside = helpscreen.icons.helpCameraB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.swatches.purple.onReleaseOutside = panel.swatches.brown.onReleaseOutside = panel.swatches.gray.onReleaseOutside = panel.rider1B.onReleaseOutside = panel.rider2B.onReleaseOutside = panel.cameraB.onReleaseOutside = panel.camera0.onReleaseOutside = function ()
    {
        this._alpha = 100;
    };
} // End of the function
function switchToVersion(ver)
{
    switch (ver)
    {
        case "6":
        {
            compatible = "6";
            trace ("version 6 mode");
            switchToVersion60Compatible();
            break;
        } 
        case "6.1":
        {
            compatible = "6.1";
            trace ("version 6.1 mode");
            switchToVersion61Compatible();
            break;
        } 
        case "6.2":
        {
            compatible = "6.2";
            trace ("version 6.2 mode");
            switchToVersion62Compatible();
            break;
        } 
        case "7.0":
        {
            compatible = "7.0";
            trace ("version 7.0 mode");
            switchToVersion62Compatible();
            break;
        } 
        case "7.0T":
        {
            compatible = "7.0T";
            trace ("version 7.0T mode");
            switchToVersion62Compatible();
            break;
        } 
    } // End of switch
} // End of the function
function switchToVersion60Compatible()
{
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
} // End of the function
function switchToVersion61Compatible()
{
    MAX_LENGTH = 2000;
    trace ("version 6.1 mode");
    registerInGrid = function (line)
    {
        var _loc1 = gridPos(line.x1, line.y1);
        var _loc14 = gridPos(line.x2, line.y2);
        var _loc12 = line.dx > 0 ? (_loc14.x) : (_loc1.x);
        var _loc15 = line.dx > 0 ? (_loc1.x) : (_loc14.x);
        var _loc13 = line.dy > 0 ? (_loc14.y) : (_loc1.y);
        var _loc10 = line.dy > 0 ? (_loc1.y) : (_loc14.y);
        if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc14.x && _loc1.y == _loc14.y)
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
            var _loc11 = 1 / _loc9;
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
                    _loc3 = Math.round((_loc2 + _loc5 - _loc8) * _loc11);
                    _loc2 = _loc2 + _loc5;
                } // end else if
            } // end else if
            _loc1 = gridPos(_loc3, _loc2);
            if (_loc1.x >= _loc15 && _loc1.x <= _loc12 && _loc1.y >= _loc10 && _loc1.y <= _loc13)
            {
                register(line, _loc1.x, _loc1.y);
                continue;
            } // end if
            return;
        } // end while
    };
} // End of the function
function switchToVersion62Compatible()
{
    MAX_LENGTH = 2000;
    registerInGrid = function (line)
    {
        var _loc1 = gridPos(line.x1, line.y1);
        var _loc13 = gridPos(line.x2, line.y2);
        var _loc9 = line.dx > 0 ? (_loc13.x) : (_loc1.x);
        var _loc7 = line.dx > 0 ? (_loc1.x) : (_loc13.x);
        var _loc10 = line.dy > 0 ? (_loc13.y) : (_loc1.y);
        var _loc8 = line.dy > 0 ? (_loc1.y) : (_loc13.y);
        if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc13.x && _loc1.y == _loc13.y)
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
        var _loc11 = 1 / line.dx;
        var _loc12 = 1 / line.dy;
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
                var _loc6 = _loc3 + line.dy * difX * _loc11;
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
                    _loc4 = _loc4 + line.dx * _loc5 * _loc12;
                    _loc3 = _loc3 + _loc5;
                } // end else if
            } // end else if
            _loc1 = gridPos(_loc4, _loc3);
            if (_loc1.x >= _loc7 && _loc1.x <= _loc9 && _loc1.y >= _loc8 && _loc1.y <= _loc10)
            {
                register(line, _loc1.x, _loc1.y);
                continue;
            } // end if
            return;
        } // end while
    };
} // End of the function
function showToolTip()
{
    clearInterval(tooltipInterval);
    tooltip_mc.onEnterFrame = null;
    tooltip_mc._x = _xmouse;
    tooltip_mc._y = _ymouse > Stage.height * 0.500000 ? (_ymouse - tooltip_mc.tip.height - 2) : (_ymouse + 22);
    if (tooltip_mc.xtip != undefined)
    {
        tooltip_mc._x = tooltip_mc.xtip;
    } // end if
    if (tooltip_mc.ytip != undefined)
    {
        tooltip_mc._y = tooltip_mc.ytip;
    } // end if
    var _loc1 = 10;
    var _loc2 = 1;
    if (tooltip_mc._x + tooltip_mc.tip.width + _loc1 > Stage.width)
    {
        tooltip_mc._x = Stage.width - tooltip_mc.tip.width - _loc1;
    } // end if
    if (tooltip_mc._x < _loc1)
    {
        tooltip_mc.x = _loc1;
    } // end if
    if (tooltip_mc._y < _loc2)
    {
        tooltip_mc._y = _loc2;
    } // end if
    if (tooltip_mc._y + tooltip_mc.tip.height + _loc2 > Stage.height)
    {
        tooltip_mc._y = Stage.height - tooltip_mc.tip.height - _loc2;
    } // end if
    tooltip_mc._visible = true;
} // End of the function
function EnableCompassToolTips()
{
    compas.onRollOver = compas2.onRollOver = myRollOver;
    compas.onRollOut = compas2.onRollOut = myRollOut;
    compas.onReleaseOutside = compas2.onReleaseOutside = myReleaseOutside;
} // End of the function
function DisableCompassToolTips()
{
    compas.onRollOver = compas2.onRollOver = undefined;
    compas.onRollOut = compas2.onRollOut = undefined;
    compas.onReleaseOutside = compas2.onReleaseOutside = undefined;
} // End of the function
function openTrackDialog()
{
    nothing();
    cursorImage("normal");
    panelMode("trackOptions");
    tipReleaseOutside();
    for (var _loc1 in ridersInfo)
    {
        ridersInfo[_loc1].typeOld = ridersInfo[_loc1].type;
    } // end of for...in
    panel.trackDialog.cbRider1.selected = panel.camera0.showRider1;
    panel.trackDialog.cbRider2.selected = panel.camera0.showRider2;
    panel.trackDialog.rider1.gotoAndStop(ridersInfo[0].type);
    if (ridersInfo[1].type == 0)
    {
        panel.trackDialog.rider2.gotoAndStop(panel.trackDialog.rider2._totalframes);
    }
    else
    {
        panel.trackDialog.rider2.gotoAndStop(ridersInfo[1].type);
    } // end else if
    panel.trackDialog.rider1.riderName._visible = false;
    panel.trackDialog.rider2.riderName._visible = false;
    panel.trackDialog._visible = true;
    active = false;
    active2 = false;
} // End of the function
function renderLineSimAll()
{
    for (var _loc2 in lines)
    {
        var _loc1 = lines[_loc2];
        if (_loc1.type == 7)
        {
            removeLine(_loc1);
            continue;
        } // end if
        _loc1.parent.clear();
        if (_loc1.type == 3)
        {
            if (!_loc1.hidden)
            {
                _loc1.parent.lineStyle(4 * SCALEDOWN, 0, 100, false, "normal", "round");
                _loc1.parent.moveTo(_loc1.x1 + _loc1.currentdx, _loc1.y1 + _loc1.currentdy);
                _loc1.parent.lineTo(_loc1.x2, _loc1.y2);
            } // end if
            continue;
        } // end if
        _loc1.parent.lineStyle(4 * SCALEDOWN, 0, 100, false, "normal", "round");
        _loc1.parent.moveTo(_loc1.x1, _loc1.y1);
        _loc1.parent.lineTo(_loc1.x2, _loc1.y2);
    } // end of for...in
} // End of the function
function getSSTrackCount()
{
    sstTarget.unloadMovie();
    sstTarget.removeMovieClip();
    this.createEmptyMovieClip("sstTarget", this.getNextHighestDepth());
    sstTarget.loadVariables("LR3B.sst");
    param_interval = setInterval(checkParamsLoaded, 100, startSSTrackMode);
} // End of the function
function startSSTrackMode()
{
    nTrackCount = sstTarget.numTracks;
    startSSTrack();
} // End of the function
function checkParamsLoaded(callbackFunction)
{
    if (sstTarget.done == undefined)
    {
    }
    else
    {
        clearInterval(param_interval);
        tla.titleBackground.ChangeList.text = getChangeListNumber();
        callbackFunction();
    } // end else if
} // End of the function
function startSSTrack()
{
    init();
    getSSTrack(nTrackNumber);
} // End of the function
function getSSTrack(nTrackNumber)
{
    this.createEmptyMovieClip("sstTarget", this.getNextHighestDepth());
    sstTarget.loadVariables("LR3B." + nTrackNumber + ".sst");
    param_interval = setInterval(checkParamsLoaded, 100, parseSSTrack);
} // End of the function
function parseSSTrack()
{
    var _loc4 = sstTarget.startLine.split(",");
    tla.startPoint._x = Number(_loc4[0]);
    tla.startPoint._y = Number(_loc4[1]);
    var _loc2 = sstTarget.startLine2.split(",");
    tla.startPoint2._x = Number(_loc2[0]);
    tla.startPoint2._y = Number(_loc2[1]);
    var _loc3 = sstTarget.riderData.split(",");
    var _loc1 = [];
    _loc1[0] = Number(_loc3[0]);
    _loc1[1] = Number(_loc3[1]);
    ssTracks.data.trackList.addItemAt(0, {label: sstTarget.label, data: sstTarget.data, level: Number(sstTarget.level), startLine: [tla.startPoint._x, tla.startPoint._y], startLine2: [tla.startPoint2._x, tla.startPoint2._y], cameraData: sstTarget.cameraData, riderData: _loc1, version: sstTarget.version});
    loadRemoteTrack();
    playSSTrack();
} // End of the function
function playSSTrack()
{
    panel.playB.onPress();
    clearInterval(pickTrackInterval);
    pickTrackInterval = setInterval(pickSSTrack, 30000);
} // End of the function
function pickSSTrack()
{
    clearInterval(pickTrackInterval);
    ++nTrackNumber;
    nTrackNumber = nTrackNumber % nTrackCount;
    startSSTrack();
} // End of the function
function loadRemoteTrack()
{
    reset();
    var _loc6 = sstTarget.data;
    var _loc3 = _loc6.split(",");
    for (i in _loc3)
    {
        if (_loc3[i] != "undefined")
        {
            _loc3[i] = Number(_loc3[i]);
        } // end if
    } // end of for...in
    var _loc5 = sstTarget.version;
    if (_loc5 == undefined)
    {
        _loc5 = "6";
    } // end if
    switchToVersion(_loc5);
    segmentsRemainingToLoad = _loc3.length / 10;
    loadBounds(_loc3);
    showAll();
    if (tla._xscale > 100)
    {
        tla._xscale = tla._yscale = bufScale = 100;
        tla._x = tla._y = canvasX = canvasY = 0;
    } // end if
    while (segmentsRemainingToLoad > 0)
    {
        bufIndex = (segmentsRemainingToLoad - 1) * 10;
        var _loc1 = _loc3;
        --segmentsRemainingToLoad;
        _loc1[bufIndex + 9] = Number(_loc1[bufIndex + 9]);
        if (_loc1[bufIndex + 9] == undefined)
        {
            _loc1[bufIndex + 9] = 0;
        } // end if
        switch (_loc1[bufIndex + 9])
        {
            case 0:
            {
                var _loc2 = new Floor(_loc1[bufIndex + 0], _loc1[bufIndex + 1], _loc1[bufIndex + 2], _loc1[bufIndex + 3], Boolean(_loc1[bufIndex + 5]), _loc1[bufIndex + 4]);
                break;
            } 
            case 1:
            {
                _loc2 = new FloorAcc(_loc1[bufIndex + 0], _loc1[bufIndex + 1], _loc1[bufIndex + 2], _loc1[bufIndex + 3], Boolean(_loc1[bufIndex + 5]), _loc1[bufIndex + 4]);
                break;
            } 
            case 2:
            {
                _loc2 = new FloorScenery(_loc1[bufIndex + 0], _loc1[bufIndex + 1], _loc1[bufIndex + 2], _loc1[bufIndex + 3]);
                break;
            } 
            case 3:
            {
                _loc2 = new FloorTrapdoor(_loc1[bufIndex + 0], _loc1[bufIndex + 1], _loc1[bufIndex + 2], _loc1[bufIndex + 3], Boolean(_loc1[bufIndex + 5]), _loc1[bufIndex + 4]);
                break;
            } 
            case 4:
            {
                _loc2 = new FloorSlow(_loc1[bufIndex + 0], _loc1[bufIndex + 1], _loc1[bufIndex + 2], _loc1[bufIndex + 3], Boolean(_loc1[bufIndex + 5]), _loc1[bufIndex + 4]);
                break;
            } 
            case 5:
            {
                _loc2 = new FloorInvisible(_loc1[bufIndex + 0], _loc1[bufIndex + 1], _loc1[bufIndex + 2], _loc1[bufIndex + 3], Boolean(_loc1[bufIndex + 5]), _loc1[bufIndex + 4]);
                break;
            } 
        } // End of switch
        ++Lines;
        _loc2.name = _loc1[bufIndex + 8];
        undoList.push(_loc1[bufIndex + 8]);
        _loc2.prevLine = _loc1[bufIndex + 6];
        _loc2.nextLine = _loc1[bufIndex + 7];
        registerInGrid(_loc2);
        lines["line" + _loc2.name] = _loc2;
        var _loc4 = tla.createEmptyMovieClip(_loc2.name, tla.getNextHighestDepth());
        _loc2.parent = _loc4;
        _loc2._alpha = 0;
    } // end while
    finishLoad(sstTarget);
    riders[1].setRiderType(5);
} // End of the function
tla.titleBackground.play.onPress = function ()
{
    _root.enablePlayButton = false;
    panel.stopB.onPress();
    gotoAndStop(7);
    clearInterval(pickTrackInterval);
};
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
compas2.distance.autoSize = "left";
resize.onResize = function ()
{
    helpscreen.icons._x = helpscreen.texts._x = panel._x = Stage.width * 0.500000;
    steuc._width = Stage.width - (panel._x + panel._width * 0.500000) - 25;
    steuc._x = Math.max(Stage.width - steuc._width - 15, panel._x + panel._width * 0.500000);
    barrierR = Stage.width * 0.618030;
    barrierL = Stage.width * 0.381970;
    barrierT = Stage.height * 0.381970;
    barrierB = Stage.height * 0.618030;
    navodila._x = vStage.width * 0.500000;
    navodila._y = Stage.height * 0.500000;
    navodila.cover._width = Stage.width;
    navodila.cover._height = Stage.height;
    navodila.cover._x = -Stage.width * 0.500000;
    navodila.cover._y = -Stage.height * 0.500000;
    helpscreen.back._y = help._y = Stage.height - 24;
    compas._y = Stage.height - 14;
    compas._x = Stage.width * 0.400000;
    compas2._y = Stage.height - 14;
    compas2._x = Stage.width * 0.600000;
    helpscreen.icons._x = Stage.width * 0.500000;
    helpscreen.icons._x = 7;
};
resize.onResize();
Stage.addListener(resize);
var DOTS_PER_RIDER = 15;
var DOTS2_PER_RIDER = 6;
var DOTSBRAID_PER_RIDER = 10;
var ITERATE = 6;
var SCALEDOWN = 0.500000;
var INVSCALE = 200;
var ENDURANCE = 0.057000;
var AIR_FRICTION = 0.900000;
var SNAP_DISTANCE = 14;
var ERASER_SIZE = 5;
var MAX_LENGTH = 10000;
var MIN_LENGTH = 10;
var MIN_ANGLE = 0.030000;
var GRIDSIZE = 14;
var TO_DEG = 57.295780;
var UNITS_STEP_SIZE = GRIDSIZE / 4;
var simulation = false;
var frameCounter = 0;
var canvasX = 0;
var canvasY = 0;
var bufScale = 100;
var a = {x: 0, y: 0.350000 * SCALEDOWN};
var aGravity = {x: 0, y: 0.350000 * SCALEDOWN};
var colided;
var active = true;
var active2 = true;
var point1 = new Object();
var point2 = new Object();
var point3 = new Object();
var tmpPoint = new Object();
var dataStorage = new Object();
var startLine;
var startLine2;
var saved = false;
var saveNow = false;
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
var segmentsRemainingToLoad;
var camerasRemainingToLoad;
var tempLine = new Object();
var checks = [];
var prevLine;
var snaped;
var tempLines;
var loadPerFrame = 15;
var VERSION = "7.0";
var compatible = VERSION;
var riderCameraIndex = 0;
var riderCameraPanPercent = 0;
var riderCameraPanStartPointX = tla._x;
var riderCameraPanStartPointY = tla._y;
var savedRiderCameraIndex = 0;
var savedRiderCameraPanPercent = 0;
var bTriggeredByRider1 = false;
var bTriggeredByRider2 = false;
var velocityX = 0;
var velocityY = 0;
var lasttlaX;
var lasttlaY;
lasttlaX = tla._x;
lasttlaY = tla._y;
Key.addListener(this);
FloorBase.zone = 20 * SCALEDOWN;
var TitleRider2 = 4;
var riders = [];
var ridersInfo = [];
var defaultRiderType1 = 3;
var defaultRiderType2 = 0;
ridersInfo[0] = new RiderInfo(true, world1, tla.dummy, compas, tla.startPoint, SCALEDOWN, defaultRiderType1);
ridersInfo[1] = new RiderInfo(false, world2, tla.dummy2, compas2, tla.startPoint2, SCALEDOWN, defaultRiderType2);
var enabledRiderTypes = [];
enabledRiderTypes[0] = true;
enabledRiderTypes[1] = true;
enabledRiderTypes[2] = true;
enabledRiderTypes[3] = true;
enabledRiderTypes[4] = TitleRider2 == 5 || TitleRider2 == 7;
enabledRiderTypes[5] = TitleRider2 == 6;
enabledRiderTypes[6] = true;
enabledRiderTypes[7] = true;
world1.worldhead = worldhead1;
world1.worldsled = worldsled1;
world1.worldarmL = worldarmL1;
world1.worldarmR = worldarmR1;
world1.worldlegL = worldlegL1;
world1.worldlegR = worldlegR1;
world2.worldhead = worldhead2;
world2.worldsled = worldsled2;
world2.worldarmL = worldarmL2;
world2.worldarmR = worldarmR2;
world2.worldlegL = worldlegL2;
world2.worldlegR = worldlegR2;
tla.titleBackground._visible = false;
var titleMovieMode = bIsInTitleMovieMode();
var titleMovieEditor = false;
initEditorMode(titleMovieMode);
var freezeTitleInterval;
var simulationPaused = false;
invisibleLinesEnabled = false;
trapdoorLinesEnabled = true;
updateCompasses(1);
var cameras = [];
var bCamerasAreVisibleInSimulation = false;
panel.toolSwatches.swatchPencil.gotoAndStop(pencilMode + 2);
panel.toolSwatches.swatchLine.gotoAndStop(pencilMode + 2);
panel.toolSwatches.swatchEraser.gotoAndStop(pencilMode + 2);
showFlag(false);
kakica.focusEnabled = true;
var SpineX = 10;
var ShoulderX = SpineX;
var ShoulderY = -11;
var PelvisX = SpineX;
var PelvisY = 0;
var BraidX = ShoulderX - 5;
var BraidY = ShoulderY - 7;
var BraidDX = 2.500000;
var HeadTopX = ShoulderX;
var HeadTopY = ShoulderY - 13;
var degreesLimitBraid = 0.698132;
var PumpkinX = ShoulderX;
var PumpkinY = ShoulderY - 7;
var PUMPKIN_RADIUS = 6;
var PUMPKIN_CIRCUMF = 6.283180 * PUMPKIN_RADIUS;
var SCALED_DOWN_PUMPKIN_CIRCUMF = PUMPKIN_CIRCUMF * SCALEDOWN;
var degreesLimitHeadPumpkin = 0.261799;
tooltip_mc._visible = false;
tooltip_mc.tip.autoSize = true;
tooltip_mc.tip.borderColor = 0;
tooltip_mc.tip.backgroundColor = 16777164;
bOnce = true;
var nXs = new Array[2]();
var nYs = new Array[2]();
nXs = [];
nYs = [];
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
        case "7.0":
        {
            return ("rev7.0");
            break;
        } 
        case "7.0T":
        {
            return ("rev7.0T");
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
panel.cameraDialog._visible = false;
panel.trackDialog._visible = false;
helpscreen._visible = false;
SetPanelEventFunctions();
helpscreen.Continue.onPress = function ()
{
    helpscreen._visible = false;
    cursorImage(lastTool);
};
var mouseListener = new Object();
mouseListener.onMouseWheel = function (delta)
{
    if (simulation == false)
    {
        var _loc1 = tla._xscale;
        var _loc2 = Math.min(Math.max(_loc1 + _loc1 * 0.040000 * delta, 5), 300);
        tla._x = Stage.width * 0.500000 + (canvasX - Stage.width * 0.500000) * (_loc2 / _loc1);
        tla._y = Stage.height * 0.500000 + (canvasY - Stage.height * 0.500000) * (_loc2 / _loc1);
        tla._xscale = tla._yscale = _loc2;
        bufScale = tla._xscale;
        canvasX = tla._x;
        canvasY = tla._y;
        pointToStartPoints();
    } // end if
};
Mouse.addListener(mouseListener);
cursor.onMouseMove = function ()
{
    cursor._x = _xmouse;
    cursor._y = _ymouse;
    pointToStartPoints();
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
        case "camera":
        {
            Mouse.hide();
            cursor._visible = true;
            cursor.gotoAndStop(6);
            cursorMode = Mode;
            break;
        } 
    } // End of switch
};
panelMode = function (Mode)
{
    if (Mode == "draw")
    {
        panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.stopB.enabled = panel.flagB.enabled = panel.rider1B.enabled = panel.rider2B.enabled = panel.cameraB.enabled = true;
        panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.stopB._alpha = panel.flagB._alpha = panel.rider1B._alpha = panel.rider2B._alpha = panel.cameraB._alpha = 100;
        panel.flagB.gotoAndStop(2);
        active2 = true;
        showCompasses(true);
        showStartPoints(true);
        EnableCompassToolTips();
    }
    else if (Mode == "simulate")
    {
        panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.rider1B.enabled = panel.rider2B.enabled = false;
        panel.saveB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = true;
        panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.rider1B._alpha = panel.rider2B._alpha = 30;
        panel.saveB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = panel.cameraB._alpha = 100;
        panel.cameraB.enabled = true;
        panel.flagB.gotoAndStop(1);
        panel.swatches._visible = false;
        showToolSwatch(false);
        showCompasses(false);
        showStartPoints(false);
        DisableCompassToolTips();
    }
    else if (Mode == "save" || Mode == "cameraEdit" || Mode == "trackOptions")
    {
        panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = panel.rider1B.enabled = panel.rider2B.enabled = panel.cameraB.enabled = false;
        panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = panel.rider1B._alpha = panel.rider2B._alpha = panel.cameraB._alpha = 30;
        panel.flagB.gotoAndStop(1);
        panel.swatches._visible = false;
        showToolSwatch(false);
        tipReleaseOutside();
    } // end else if
};
SetCamerasOnEvents(bFlag);
if (bFlag)
{
    var nIndex = 0;
    while (nIndex < cameras.length)
    {
        SetCameraOnEvents(nIndex);
        ++nIndex;
    } // end while
}
else
{
    var nIndex = 0;
    while (nIndex < cameras.length)
    {
        cameras[nIndex].onPress = cameras[nIndex].onRelease = cameras[nIndex].onRollOver = cameras[nIndex].onRollOut = cameras[nIndex].onReleaseOutside = function ()
        {
        };
        ++nIndex;
    } // end while
} // end else if
panel.cameraDialog.Delete.onRelease = function ()
{
    for (var _loc1 = 0; _loc1 < cameras.length; ++_loc1)
    {
        if (panel.cameraDialog.cameraRef == cameras[_loc1])
        {
            cameras[_loc1].removeMovieClip();
            delete cameras[_loc1];
            cameras.splice(_loc1, 1);
        } // end if
    } // end of for
    panel.cameraDialog._visible = false;
    panel.cameraDialog.Delete.enabled = false;
    panel.cameraDialog.cbPan.enabled = false;
    cursorImage(lastTool);
    panelMode("draw");
    panel[lastTool + "B"].onPress();
    active = true;
    if (Lines != 0)
    {
        panel.playB.enabled = true;
        panel.playB._alpha = 100;
    } // end if
};
panel.cameraDialog.Ok.onRelease = panel.cameraDialog.close.onRelease = function ()
{
    panel.cameraDialog.cameraRef.showRider1 = panel.cameraDialog.cbRider1.selected;
    panel.cameraDialog.cameraRef.showRider2 = panel.cameraDialog.cbRider2.selected;
    panel.cameraDialog.cameraRef.usePanning = panel.cameraDialog.cbPan.selected;
    panel.cameraDialog._visible = false;
    panel.cameraDialog.Delete.enabled = false;
    panel.cameraDialog.cbPan.enabled = false;
    panel.cameraDialog.cameraRef.cameraHighlight._visible = false;
    active = true;
    panel[lastTool + "B"].onPress();
    cursorImage(lastTool);
    panelMode("draw");
    panel.cameraDialog.cameraRef.gotoAndStop(1 + panel.cameraDialog.cbRider1.selected + 2 * panel.cameraDialog.cbRider2.selected + 4 * panel.cameraDialog.cbPan.selected);
    if (panel.cameraDialog.cameraRef.cameraIc._currentframe != 3)
    {
        panel.cameraDialog.cameraRef.cameraIc.gotoAndStop(1 + panel.cameraDialog.cbPan.selected);
    } // end if
    if (Lines != 0)
    {
        panel.playB.enabled = true;
        panel.playB._alpha = 100;
    } // end if
    UpdateCameraTriggerIcon();
};
var oldScale;
var oldy;
var bufScale = 100;
registerInGrid = function (line)
{
    var _loc1 = gridPos(line.x1, line.y1);
    var _loc13 = gridPos(line.x2, line.y2);
    var _loc9 = line.dx > 0 ? (_loc13.x) : (_loc1.x);
    var _loc7 = line.dx > 0 ? (_loc1.x) : (_loc13.x);
    var _loc10 = line.dy > 0 ? (_loc13.y) : (_loc1.y);
    var _loc8 = line.dy > 0 ? (_loc1.y) : (_loc13.y);
    if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc13.x && _loc1.y == _loc13.y)
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
    var _loc11 = 1 / line.dx;
    var _loc12 = 1 / line.dy;
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
            var _loc6 = _loc3 + line.dy * difX * _loc11;
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
                _loc4 = _loc4 + line.dx * _loc5 * _loc12;
                _loc3 = _loc3 + _loc5;
            } // end else if
        } // end else if
        _loc1 = gridPos(_loc4, _loc3);
        if (_loc1.x >= _loc7 && _loc1.x <= _loc9 && _loc1.y >= _loc8 && _loc1.y <= _loc10)
        {
            register(line, _loc1.x, _loc1.y);
            continue;
        } // end if
        return;
    } // end while
};
panel.pencilB.tiptext = "(Q) The pencil tool is for free-hand drawing.";
panel.lineB.tiptext = "(W) The line tool draws straight lines.";
panel.eraserB.tiptext = "(E) The eraser tool erases line segments.";
panel.zoomB.tiptext = "(R) The zoom tool zooms in/out when you drag the mouse up/down.";
panel.handB.tiptext = "(T) The hand tool moves the canvas when you drag the mouse.";
panel.playB.tiptext = "(Y) The play button starts the rider(s) riding.";
panel.stopB.tiptext = "(U) The stop button stops the ride so you can draw again.";
panel.flagB.tiptext = "(I) The flag button drops/clears the flag during riding/editing.";
panel.saveB.tiptext = "(O) The save button lets you save your current track or load and delete other saved tracks.";
panel.trashB.tiptext = "(P) The trash button deletes you current track.";
panel.cameraB.tiptext = "(K) The camera tool places camera triggers.";
panel.swatches.blue.tiptext = "(1) Normal ink is for riding on.";
panel.swatches.red.tiptext = "(2) Acceleration ink makes a rider go faster.";
panel.swatches.green.tiptext = "(3) Decorative ink does not collide with the riders.";
panel.swatches.brown.tiptext = "(4) Deceleration ink makes a rider go slower.";
panel.swatches.purple.tiptext = "(5) Trapdoor ink will disappear soon after a rider touches it.";
panel.swatches.gray.tiptext = "(6) Invisible ink collides with the riders but cannot be seen during the ride.";
help.helpB.tiptext = "The help button takes you to the help screen.";
tla.startPoint.tiptext = "Here is where rider 1 starts his ride.";
tla.startPoint2.tiptext = "Here is where rider 2 starts his ride.";
compas.tiptext = "Direction and distance to rider 1 start point.";
compas2.tiptext = "Direction and distance to rider 2 start point.";
tooltipInterval = undefined;
tipRollOver = function (tipobj)
{
    if (tipobj.tiptext != undefined)
    {
        tooltip_mc.tip.text = tipobj.tiptext;
        tooltip_mc.wait = tipobj.tipwait;
        if (tooltip_mc.wait == undefined)
        {
            tooltip_mc.wait = 0;
            tipobj.tipwait = 1000;
        } // end if
        tooltip_mc.xtip = tipobj.xtip;
        tooltip_mc.ytip = tipobj.ytip;
        tooltip_mc._visible = false;
        clearInterval(tooltipInterval);
        tooltipInterval = setInterval(showToolTip, tooltip_mc.wait);
    } // end if
};
tipRollOut = function ()
{
    clearInterval(tooltipInterval);
    tooltip_mc._visible = false;
    tooltip_mc.onEnterFrame = null;
};
tipReleaseOutside = tipRollOut;
myRollOver = function ()
{
    active2 = false;
    cursor._visible = false;
    Mouse.show();
    tipRollOver(this);
};
myRollOut = function ()
{
    active2 = true;
    cursorImage(cursorMode);
    tipRollOut();
};
myReleaseOutside = myRollOut;
panel.trackDialog.Cancel.onRelease = function ()
{
    panel.trackDialog._visible = false;
    active2 = true;
    active = true;
    panel[lastTool + "B"].onPress();
    cursorImage(lastTool);
    panelMode("draw");
    if (Lines != 0)
    {
        panel.playB.enabled = true;
        panel.playB._alpha = 100;
    } // end if
};
panel.trackDialog.Ok.onRelease = panel.trackDialog.close.onRelease = function ()
{
    panel.trackDialog._visible = false;
    panel.camera0.showRider1 = panel.trackDialog.cbRider1.selected;
    panel.camera0.showRider2 = panel.trackDialog.cbRider2.selected;
    ridersInfo[0].type = panel.trackDialog.rider1._currentframe;
    riders2type = panel.trackDialog.rider2._currentframe % panel.trackDialog.rider2._totalframes;
    ridersInfo[1].type = riders2type;
    if (ridersInfo[1].type != ridersInfo[0].typeOld || ridersInfo[1].type != ridersInfo[1].typeOld)
    {
        cleanup();
        init();
        panel.flagB.onPress();
        for (var _loc1 in ridersInfo)
        {
            ridersInfo[_loc1].activateRider(ridersInfo[_loc1].type != 0);
        } // end of for...in
    } // end if
    updateCameraTeloBs();
    active2 = true;
    active = true;
    panel[lastTool + "B"].onPress();
    cursorImage(lastTool);
    panelMode("draw");
    if (Lines != 0)
    {
        panel.playB.enabled = true;
        panel.playB._alpha = 100;
    } // end if
};
panel.trackDialog.rider1.onRelease = panel.trackDialog.rider2.onRelease = function ()
{
    var _loc2 = this._currentframe - 1;
    var _loc3 = this._name == "rider1" ? (panel.trackDialog.rider2._currentframe - 1) : (panel.trackDialog.rider1._currentframe - 1);
    enabledRiderTypes[this._totalframes - 1] = this._name == "rider2";
    do
    {
        _loc2 = (_loc2 + 1) % this._totalframes;
    } while (_loc3 == _loc2 || !enabledRiderTypes[_loc2])
    this.gotoAndStop(1 + _loc2);
    this.riderName._visible = false;
};
reset();
setInterval(blink, 1000);
var nTrackCount = 0;
var nTrackNumber = 0;
if (!titleMovieMode)
{
    init();
    reset();
    drawPencil();
    panel.pencilB.onPress();
    cursorImage("pencil");
}
else
{
    var ssTracks;
    ssTracks.data.trackList = [];
    var param_interval;
    getSSTrackCount();
} // end else if
var pickTrackInterval;
