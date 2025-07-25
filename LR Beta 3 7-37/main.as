function initEditorMode(titleMovieMode)
{
   Mouse.show();
   cursor._visible = false;
   VERSION = compatible = "7.0";
   SCALEDOWN = 0.5;
   INVSCALE = 200;
   FloorBase.zone = 20 * SCALEDOWN;
   a = {x:0,y:0.35 * SCALEDOWN};
   panel._visible = true;
   help._visible = true;
   Mouse.show();
   cursor._visible = false;
}
function traceRider(nRiderIndex)
{
   rider = savedTracks.data.trackList[0].riderData[nRiderIndex];
   trace(rider.type);
}
function updateCompasses(numRiders)
{
   ridersInfo[0].compas._x = Stage.width * (numRiders != 1 ? 0.4 : 0.5);
   pointACompasToAStartPoint(ridersInfo[0].startPoint,ridersInfo[0].compas);
}
function getRiderIndexFromStartPoint(thisStartPoint)
{
   var _loc2_;
   for(_loc2_ in ridersInfo)
   {
      if(thisStartPoint == ridersInfo[_loc2_].startPoint)
      {
         return _loc2_;
      }
   }
   return 0;
}
function SwapStartPointDepths(_startPoint, bBringToFrontOnly)
{
   var _loc1_;
   _loc1_ = getRiderIndexFromStartPoint(_startPoint);
   _loc1_ = _loc1_ + 1;
   _loc1_ %= riders.length;
   if(bBringToFrontOnly && _startPoint.getDepth() > ridersInfo[_loc1_].startPoint.getDepth())
   {
      return undefined;
   }
   _startPoint.swapDepths(ridersInfo[_loc1_].startPoint);
}
function showFlag(bVisible)
{
   tla.flag._visible = bVisible;
}
function isFlagVisible()
{
   return tla.flag._visible;
}
function showStartPoints(bVisible)
{
   if(Lines == 0 && bVisible)
   {
      return undefined;
   }
   for(var _loc2_ in ridersInfo)
   {
      if(!bVisible || ridersInfo[_loc2_].type != 0)
      {
         ridersInfo[_loc2_].showStartPoint(bVisible);
      }
   }
}
function showStartPointsHelp(bVisible)
{
   for(var _loc2_ in ridersInfo)
   {
      if(!bVisible || ridersInfo[_loc2_].type != 0)
      {
         ridersInfo[_loc2_].showStartPointHelp(bVisible);
      }
   }
}
function showStartPointsArrows(bVisible)
{
   for(var _loc2_ in ridersInfo)
   {
      if(!bVisible || ridersInfo[_loc2_].type != 0)
      {
         ridersInfo[_loc2_].showStartPointsArrow(bVisible);
      }
   }
}
function showDummies(bVisible)
{
   for(var _loc2_ in ridersInfo)
   {
      if(!bVisible || ridersInfo[_loc2_].type != 0)
      {
         ridersInfo[_loc2_].showDummy(bVisible);
      }
   }
}
function showRiders(bVisible)
{
   for(var _loc1_ in riders)
   {
      riders[_loc1_].showRider(bVisible);
   }
}
function showCompasses(bVisible)
{
   if(Lines == 0 && bVisible)
   {
      return undefined;
   }
   for(var _loc2_ in ridersInfo)
   {
      if(!bVisible || ridersInfo[_loc2_].type != 0)
      {
         ridersInfo[_loc2_].showCompass(bVisible);
      }
   }
}
function showBureks()
{
   for(var _loc1_ in riders)
   {
      riders[_loc1_].showBurek();
   }
}
function pointToStartPoints()
{
   for(var _loc1_ in ridersInfo)
   {
      if(ridersInfo[_loc1_].type != 0 || helpscreen._visible)
      {
         pointACompasToAStartPoint(ridersInfo[_loc1_].startPoint,ridersInfo[_loc1_].compas);
      }
   }
}
function pointACompasToAStartPoint(startpoint, compas)
{
   var _loc1_ = new Object();
   _loc1_.x = startpoint._x;
   _loc1_.y = startpoint._y;
   tla.localToGlobal(_loc1_);
   compas.distance.text = Math.floor(Math.sqrt(Math.pow(_loc1_.x - compas._x,2) + Math.pow(_loc1_.y - compas._y,2))) + " pixels";
   compas.dial._rotation = Math.atan2(_loc1_.y - compas._y,_loc1_.x - compas._x) * TO_DEG;
}
function updateCamera()
{
   lasttlaX = tla._x;
   lasttlaY = tla._y;
   if(riderCameraIndex == 2)
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
   }
   var _loc1_;
   if(point2.x > barrierR)
   {
      _loc1_ = barrierR - point2.x;
   }
   else if(point2.x < barrierL)
   {
      _loc1_ = barrierL - point2.x;
   }
   else
   {
      _loc1_ = 0;
   }
   if(point2.y > barrierB)
   {
      offsety = barrierB - point2.y;
   }
   else if(point2.y < barrierT)
   {
      offsety = barrierT - point2.y;
   }
   else
   {
      var offsety = 0;
   }
   if(riderCameraIndex == 2)
   {
      nXs[0] = riderCameraPanStartPointX;
      nYs[0] = riderCameraPanStartPointY;
   }
   else
   {
      nXs[0] = riders[0].rworld._x + _loc1_;
      nYs[0] = riders[0].rworld._y + offsety;
   }
   if(riderCameraIndex == 3 && riders[1] == undefined)
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
   }
   if(point2.x > barrierR)
   {
      _loc1_ = barrierR - point2.x;
   }
   else if(point2.x < barrierL)
   {
      _loc1_ = barrierL - point2.x;
   }
   else
   {
      _loc1_ = 0;
   }
   if(point2.y > barrierB)
   {
      offsety = barrierB - point2.y;
   }
   else if(point2.y < barrierT)
   {
      offsety = barrierT - point2.y;
   }
   else
   {
      var offsety = 0;
   }
   if(riderCameraIndex == 3)
   {
      nXs[1] = riderCameraPanStartPointX;
      nYs[1] = riderCameraPanStartPointY;
   }
   else if(riders[1] != undefined)
   {
      nXs[1] = riders[1].rworld._x + _loc1_;
      nYs[1] = riders[1].rworld._y + offsety;
   }
   if(titleMovieMode)
   {
      riderCameraIndex = 5;
   }
   switch(riderCameraIndex)
   {
      case 0:
         riders[0].rworld._x = nXs[0];
         riders[0].rworld._y = nYs[0];
         if(riders[1] != undefined)
         {
            riders[1].rworld._x = nXs[0];
            riders[1].rworld._y = nYs[0];
         }
         tla._x = riders[0].rworld._x;
         tla._y = riders[0].rworld._y;
         break;
      case 1:
         if(riders[1] != undefined)
         {
            riders[0].rworld._x = nXs[1];
            riders[0].rworld._y = nYs[1];
            riders[1].rworld._x = nXs[1];
            riders[1].rworld._y = nYs[1];
            tla._x = riders[1].rworld._x;
            tla._y = riders[1].rworld._y;
         }
         break;
      case 2:
         if(riders[1] != undefined)
         {
            if(riderCameraPanPercent >= 1)
            {
               riderCameraPanPercent = 1;
            }
            else
            {
               riderCameraPanPercent += 0.01;
            }
            riders[0].rworld._x = nXs[0] * (1 - riderCameraPanPercent) + nXs[1] * riderCameraPanPercent;
            riders[0].rworld._y = nYs[0] * (1 - riderCameraPanPercent) + nYs[1] * riderCameraPanPercent;
            riders[1].rworld._x = nXs[0] * (1 - riderCameraPanPercent) + nXs[1] * riderCameraPanPercent;
            riders[1].rworld._y = nYs[0] * (1 - riderCameraPanPercent) + nYs[1] * riderCameraPanPercent;
            tla._x = riderCameraPanStartPointX * (1 - riderCameraPanPercent) + nXs[1] * riderCameraPanPercent;
            tla._y = riderCameraPanStartPointY * (1 - riderCameraPanPercent) + nYs[1] * riderCameraPanPercent;
         }
         break;
      case 3:
         if(riderCameraPanPercent <= 0)
         {
            riderCameraPanPercent = 0;
         }
         else
         {
            riderCameraPanPercent -= 0.01;
         }
         riders[0].rworld._x = nXs[0] * (1 - riderCameraPanPercent) + nXs[1] * riderCameraPanPercent;
         riders[0].rworld._y = nYs[0] * (1 - riderCameraPanPercent) + nYs[1] * riderCameraPanPercent;
         if(riders[1] != undefined)
         {
            riders[1].rworld._x = nXs[0] * (1 - riderCameraPanPercent) + nXs[1] * riderCameraPanPercent;
            riders[1].rworld._y = nYs[0] * (1 - riderCameraPanPercent) + nYs[1] * riderCameraPanPercent;
         }
         tla._x = nXs[0] * (1 - riderCameraPanPercent) + riderCameraPanStartPointX * riderCameraPanPercent;
         tla._y = nYs[0] * (1 - riderCameraPanPercent) + riderCameraPanStartPointY * riderCameraPanPercent;
         break;
      case 4:
         if(riderCameraPanPercent < 0.5)
         {
            riderCameraPanPercent += 0.01;
         }
         riders[0].rworld._x = riderCameraPanStartPointX * (1 - 2 * riderCameraPanPercent) + 0.5 * (nXs[0] + nXs[1]) * 2 * riderCameraPanPercent;
         riders[0].rworld._y = riderCameraPanStartPointY * (1 - 2 * riderCameraPanPercent) + 0.5 * (nYs[0] + nYs[1]) * 2 * riderCameraPanPercent;
         if(riders[1] != undefined)
         {
            riders[1].rworld._x = riderCameraPanStartPointX * (1 - 2 * riderCameraPanPercent) + 0.5 * (nXs[0] + nXs[1]) * 2 * riderCameraPanPercent;
            riders[1].rworld._y = riderCameraPanStartPointY * (1 - 2 * riderCameraPanPercent) + 0.5 * (nYs[0] + nYs[1]) * 2 * riderCameraPanPercent;
         }
         tla._x = riderCameraPanStartPointX * (1 - 2 * riderCameraPanPercent) + 0.5 * (nXs[0] + nXs[1]) * 2 * riderCameraPanPercent;
         tla._y = riderCameraPanStartPointY * (1 - 2 * riderCameraPanPercent) + 0.5 * (nYs[0] + nYs[1]) * 2 * riderCameraPanPercent;
         break;
      case 5:
         break;
      case 6:
         riders[0].rworld._x -= velocityX;
         riders[0].rworld._y -= velocityY;
         if(riders[1] != undefined)
         {
            riders[1].rworld._x -= velocityX;
            riders[1].rworld._y -= velocityY;
         }
         tla._x -= velocityX;
         tla._y -= velocityY;
   }
   riders[0].translateRider(riders[0].rworld._x,riders[0].rworld._y);
   if(riders[1] != undefined)
   {
      riders[1].translateRider(riders[1].rworld._x,riders[1].rworld._y);
   }
}
function renderRiders()
{
   for(var _loc1_ in riders)
   {
      riders[_loc1_].render();
   }
}
function onKeyUp()
{
   if(Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "hand" || cursorMode == "camera") && helpscreen._visible == false)
   {
      cursorImage(lastTool);
   }
   if(Key.getCode() == 72 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      helpscreen._visible = !helpscreen._visible;
      if(helpscreen._visible)
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
         if(riders[1] == undefined)
         {
            if(ridersInfo[0].type == defaultRiderType1)
            {
               ridersInfo[1].compas.gotoAndStop(2);
            }
            else
            {
               ridersInfo[1].compas.gotoAndStop(defaultRiderType1);
            }
         }
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
         if(Lines == 0)
         {
            panel.playB.enabled = false;
            panel.playB._alpha = 50;
            panel.camera0._visible = false;
            ridersInfo[0].compas._visible = false;
            ridersInfo[1].compas._visible = false;
         }
         if(riders[1] == undefined)
         {
            ridersInfo[1].compas._visible = false;
            updateCompasses(1);
         }
         else
         {
            updateCompasses(2);
         }
         HideToolSwatchesForHelp(false);
         if(!(cursorMode == "pencil" || cursorMode == "line" || cursorMode == "eraser"))
         {
            panel.swatches._visible = false;
         }
      }
   }
   if(Key.getCode() == 81 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.pencilB.onPress();
      cursorImage("pencil");
   }
   if(Key.getCode() == 87 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.lineB.onPress();
      cursorImage("line");
   }
   if(Key.getCode() == 69 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.eraserB.onPress();
      cursorImage("eraser");
   }
   if(Key.getCode() == 82 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.zoomB.onPress();
      cursorImage("zoom");
   }
   if(Key.getCode() == 84 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.handB.onPress();
      cursorImage("hand");
   }
   if(Key.getCode() == 89 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.playB.onPress();
   }
   if(Key.getCode() == 85 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.stopB.onPress();
   }
   if(Key.getCode() == 73 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.flagB.onPress();
   }
   if(Key.getCode() == 79 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.saveB.onPress();
   }
   if(Key.getCode() == 80 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.trashB.onPress();
   }
   if(Key.getCode() == 49 && panel.swatches._visible == true)
   {
      panel.swatches.blue.onPress();
   }
   if(Key.getCode() == 50 && panel.swatches._visible == true)
   {
      panel.swatches.red.onPress();
   }
   if(Key.getCode() == 51 && panel.swatches._visible == true)
   {
      panel.swatches.green.onPress();
   }
   if(Key.getCode() == 52 && panel.swatches._visible == true)
   {
      panel.swatches.brown.onPress();
   }
   if(Key.getCode() == 53 && panel.swatches._visible == true)
   {
      if(trapdoorLinesEnabled)
      {
         panel.swatches.purple.onPress();
      }
   }
   if(Key.getCode() == 54 && panel.swatches._visible == true)
   {
      if(invisibleLinesEnabled)
      {
         panel.swatches.gray.onPress();
      }
   }
   var _loc4_;
   var _loc5_;
   var _loc6_;
   var _loc7_;
   if(Key.getCode() == 9 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      if(tempZoom == undefined || tla._xscale != ttZoom)
      {
         trace(tempLines);
         if(Lines != tempLines)
         {
            tempLines = Lines;
            trace("gotBounds");
            getBounds();
         }
         tempZoom = tla._xscale;
         showAll();
         ttZoom = tla._xscale;
      }
      else
      {
         _loc4_ = tla._xmouse;
         _loc5_ = tla._ymouse;
         _loc6_ = _xmouse;
         _loc7_ = _ymouse;
         canvasX = tla._x = - (_loc4_ * tempZoom * 0.01 - _loc6_);
         canvasY = tla._y = - (_loc5_ * tempZoom * 0.01 - _loc7_);
         bufScale = tla._xscale = tla._yscale = tempZoom;
         tempZoom = undefined;
      }
   }
   if(Key.getCode() == 8 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      undo();
   }
   if(Key.getCode() == 36 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      tmpPoint.x = tla.startPoint._x;
      tmpPoint.y = tla.startPoint._y;
      tla.localToGlobal(tmpPoint);
      canvasX = tla._x = Stage.width * 0.5 - tmpPoint.x + tla._x;
      canvasY = tla._y = Stage.height * 0.5 - tmpPoint.y + tla._y;
   }
   var _loc1_;
   if(Key.getCode() == 35 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      _loc1_ = getLastLine();
      if(_loc1_ != undefined)
      {
         tmpPoint.x = _loc1_.x2;
         tmpPoint.y = _loc1_.y2;
         tla.localToGlobal(tmpPoint);
         canvasX = tla._x = Stage.width * 0.5 - tmpPoint.x + tla._x;
         canvasY = tla._y = Stage.height * 0.5 - tmpPoint.y + tla._y;
      }
   }
   if(Key.getCode() == 70 && isFlagVisible() && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      tmpPoint.x = tla.flag._x;
      tmpPoint.y = tla.flag._y;
      tla.localToGlobal(tmpPoint);
      canvasX = tla._x = Stage.width * 0.5 - tmpPoint.x + tla._x;
      canvasY = tla._y = Stage.height * 0.5 - tmpPoint.y + tla._y;
   }
   if(Key.getCode() == 77 && simulation == true)
   {
      slowMotion = !slowMotion;
   }
   var _loc2_;
   if(Key.getCode() == 66)
   {
      for(var _loc3_ in lines)
      {
         _loc1_ = lines[_loc3_];
         _loc2_ = new Array(_loc1_.x1,_loc1_.y1,_loc1_.x2,_loc1_.y2,_loc1_.lim,Number(_loc1_.inv),_loc1_.prevLine,_loc1_.nextLine,_loc1_.name,_loc1_.type);
         trace(_loc2_);
      }
   }
   if(Key.getCode() == 219 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.rider1B.onPress();
   }
   if(Key.getCode() == 221 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.rider2B.onPress();
   }
   if(Key.getCode() == 75 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.cameraDialog._visible == false && panel.trackDialog._visible == false)
   {
      panel.cameraB.onPress();
      if(!simulation)
      {
         cursorImage("camera");
      }
   }
}
function showAll()
{
   var _loc3_ = maxX - minX;
   var _loc4_ = maxY - minY;
   var _loc5_ = Stage.width / _loc3_;
   var _loc6_ = Stage.height / _loc4_;
   var _loc1_ = Math.min(_loc5_,3);
   var _loc2_ = Math.min(_loc6_,3);
   if(_loc5_ > _loc6_)
   {
      bufScale = tla._xscale = tla._yscale = _loc2_ * 100;
      canvasX = tla._x = (- minX) * _loc2_ + (Stage.width - _loc3_ * _loc2_) * 0.5;
      canvasY = tla._y = (- minY) * _loc2_;
   }
   else
   {
      bufScale = tla._xscale = tla._yscale = _loc1_ * 100;
      canvasX = tla._x = (- minX) * _loc1_;
      canvasY = tla._y = (- minY) * _loc1_ + (Stage.height - _loc4_ * _loc1_) * 0.5;
   }
}
function onKeyDown()
{
   if(Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "line" || cursorMode == "camera") && drawing == false && helpscreen._visible == false)
   {
      cursorImage("hand");
   }
}
function setToolSwatch()
{
   panel.toolSwatches.swatchPencil.gotoAndStop(pencilMode + 2);
   panel.toolSwatches.swatchLine.gotoAndStop(pencilMode + 2);
   panel.toolSwatches.swatchEraser.gotoAndStop(pencilMode + 2);
}
function showToolSwatch(isVisible)
{
   panel.toolSwatches.swatchPencil._visible = isVisible;
   panel.toolSwatches.swatchLine._visible = isVisible;
   panel.toolSwatches.swatchEraser._visible = isVisible;
}
function HideToolSwatchesForHelp(isHidden)
{
   panel.toolSwatches._visible = !isHidden;
}
function setPaletteSwatch(swatch)
{
   panel.swatches.selected._visible = true;
   switch(swatch)
   {
      case 1:
         panel.swatches.blue.onPress();
         break;
      case 2:
         panel.swatches.red.onPress();
         break;
      case 3:
         panel.swatches.green.onPress();
         break;
      case 4:
         panel.swatches.purple.onPress();
         break;
      case 5:
         panel.swatches.brown.onPress();
         break;
      case 6:
         panel.swatches.gray.onPress();
   }
}
function SetPanelEventFunctions()
{
   EnableCompassToolTips();
   for(var _loc7_ in riders)
   {
      riders[_loc7_].setOnEvents(true);
   }
   SetCamerasOnEvents(true);
   panel.lineB.onRollOver = panel.zoomB.onRollOver = panel.eraserB.onRollOver = panel.flagB.onRollOver = panel.handB.onRollOver = panel.pencilB.onRollOver = panel.playB.onRollOver = panel.stopB.onRollOver = panel.saveB.onRollOver = panel.trashB.onRollOver = function()
   {
      active2 = false;
      cursor._visible = false;
      Mouse.show();
      tipRollOver(this);
   };
   panel.swatches.green.onRollOver = panel.swatches.red.onRollOver = panel.swatches.blue.onRollOver = panel.swatches.purple.onRollOver = panel.swatches.brown.onRollOver = panel.swatches.gray.onRollOver = panel.rider1B.onRollOver = panel.rider2B.onRollOver = panel.cameraB.onRollOver = function()
   {
      active2 = false;
      cursor._visible = false;
      Mouse.show();
      tipRollOver(this);
      this._alpha = 50;
   };
   panel.lineB.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.lineB.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel.playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel
   .saveB.onReleaseOutside = panel.trashB.onReleaseOutside = function()
   {
      active2 = true;
      cursorImage(cursorMode);
      tipRollOut();
   };
   panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.swatches.purple.onRollOut = panel.swatches.brown.onRollOut = panel.swatches.gray.onRollOut = panel.rider1B.onRollOut = panel.rider2B.onRollOut = panel.cameraB.onRollOut = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.swatches.purple.onReleaseOutside = panel.swatches.brown.onReleaseOutside = panel.swatches.gray.onReleaseOutside = panel
   .rider1B.onReleaseOutside = panel.rider2B.onReleaseOutside = panel.cameraB.onReleaseOutside = function()
   {
      active2 = true;
      cursorImage(cursorMode);
      tipRollOut();
      this._alpha = 100;
   };
   panel.handB.onPress = function()
   {
      cursorMode = "hand";
      drawPencil();
      tla._x = canvasX;
      tla._y = canvasY;
      panel.swatches._visible = false;
      showToolSwatch(false);
      lastTool = "hand";
   };
   panel.swatches.blue.onPress = function()
   {
      pencilMode = 0;
      cursor.pencil.gotoAndStop(1);
      panel.swatches.selected._visible = true;
      panel.swatches.selected._x = 15;
      setToolSwatch();
   };
   panel.swatches.red.onPress = function()
   {
      pencilMode = 1;
      cursor.pencil.gotoAndStop(2);
      panel.swatches.selected._visible = true;
      panel.swatches.selected._x = 45;
      setToolSwatch();
   };
   panel.swatches.green.onPress = function()
   {
      pencilMode = 2;
      cursor.pencil.gotoAndStop(3);
      panel.swatches.selected._visible = true;
      panel.swatches.selected._x = 75;
      setToolSwatch();
   };
   panel.swatches.brown.onPress = function()
   {
      pencilMode = 4;
      cursor.pencil.gotoAndStop(5);
      panel.swatches.selected._visible = true;
      panel.swatches.selected._x = 105;
      setToolSwatch();
   };
   panel.swatches.purple.onPress = function()
   {
      pencilMode = 3;
      cursor.pencil.gotoAndStop(4);
      panel.swatches.selected._visible = true;
      panel.swatches.selected._x = 135;
      setToolSwatch();
   };
   panel.swatches.gray.onPress = function()
   {
      pencilMode = 5;
      cursor.pencil.gotoAndStop(6);
      panel.swatches.selected._visible = true;
      panel.swatches.selected._x = 165;
      setToolSwatch();
   };
   panel.pencilB.onPress = function()
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
   panel.lineB.onPress = function()
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
   panel.trashB.onPress = function()
   {
      cursorImage("normal");
      switchToVersion(VERSION);
      panelMode("save");
      panel.confirmDialog._visible = true;
      panel.confirmDialog.text.text = "Are you sure you want to delete the track?";
      enableConfirmButtons();
      panel.confirmDialog.Yes.onRelease = function()
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
      panel.confirmDialog.No.onRelease = function()
      {
         panel.confirmDialog._visible = false;
         cursorImage(lastTool);
         panelMode("draw");
         panel[lastTool + "B"].onPress();
         disableConfirmButtons();
         if(Lines != 0)
         {
            panel.playB.enabled = true;
            panel.playB._alpha = 100;
         }
      };
   };
   panel.zoomB.onPress = function()
   {
      var _loc2_;
      var _loc1_;
      if(Key.isDown(16))
      {
         _loc2_ = tla._xscale;
         _loc1_ = 100;
         tla._xscale = tla._yscale = _loc1_;
         tla._x = Stage.width * 0.5 + (canvasX - Stage.width * 0.5) * (_loc1_ / _loc2_);
         tla._y = Stage.height * 0.5 + (canvasY - Stage.height * 0.5) * (_loc1_ / _loc2_);
      }
      cursorMode = "zoom";
      panel.swatches._visible = false;
      showToolSwatch(false);
      zoom();
      lastTool = "zoom";
   };
   panel.playB.onPress = function()
   {
      var _loc2_;
      if(Lines > 0)
      {
         clearInterval(framerateInterval);
         framerateInterval = setInterval(framerate,1000);
         _loc2_ = cursorMode;
         slowMotion = false;
         cursorImage("normal");
         for(var _loc1_ in riders)
         {
            riders[_loc1_].rworld.body.face.gotoAndStop(1);
         }
         if(saved && !Key.isDown(65))
         {
            restore();
            for(_loc1_ in riders)
            {
               riders[_loc1_].setCrash(riders[_loc1_].riding,true);
               riders[_loc1_].rworld.worldsled.sled.gotoAndStop(riders[_loc1_].sledState);
               riders[_loc1_].rworld.body.face.gotoAndStop(riders[_loc1_].faceState);
            }
            riderCameraIndex = savedRiderCameraIndex;
            riderCameraPanPercent = savedRiderCameraPanPercent;
         }
         else
         {
            if(!saved)
            {
               cleanUp();
               init();
            }
            else
            {
               resetPosition();
            }
            for(_loc1_ in riders)
            {
               riders[_loc1_].setCrash(false,simulation);
               riders[_loc1_].rworld.worldsled.sled.gotoAndStop(1);
               riders[_loc1_].moveToStartPos();
            }
         }
         tla.clear();
         simulation = true;
         panelMode("simulate");
         renderLineSimAll();
         if(!Key.isDown(16))
         {
            tla._xscale = tla._yscale = INVSCALE;
         }
         for(_loc1_ in riders)
         {
            riders[_loc1_].scaleRider(tla._xscale,riders[_loc1_]._x,riders[_loc1_]._y);
         }
         if(!(saved && !Key.isDown(65)))
         {
            for(_loc1_ in riders)
            {
               riders[_loc1_].activateDots();
            }
         }
         showRiders(true);
         SetCameraVisibilities(bCamerasAreVisibleInSimulation,false);
         help._visible = false;
         if(Key.isDown(90))
         {
            scaleRiderWorld(Math.max(tla._xscale * 0.9,20));
         }
         if(Key.isDown(88))
         {
            scaleRiderWorld(Math.min(tla._xscale * 1.1,400));
         }
         updateCamera();
         setCameraMode(0);
         bOnce = true;
         render();
         simulate();
      }
   };
   panel.stopB.onPress = function()
   {
      simulationPaused = false;
      panel._visible = true;
      steuc._visible = true;
      onEnterFrame = function()
      {
      };
      if(lastTool != "camera")
      {
         panel[lastTool + "B"].onPress();
      }
      if(tla.flag._visible)
      {
         panel.flagB.flagUp.gotoAndStop(2);
      }
      showRiders(false);
      SetCameraVisibilities(true,false);
      tla._x = canvasX;
      tla._y = canvasY;
      tla._xscale = tla._yscale = bufScale;
      simulation = false;
      if(Lines != 0)
      {
         panel.playB.enabled = true;
         panel.playB._alpha = 100;
         panel.camera0._visible = true;
      }
      TransientObjSimService.ResetAllLists();
      for(var _loc2_ in lines)
      {
         if(titleMovieMode && !titleMovieEditor)
         {
            lines[_loc2_].parent._alpha = 100;
         }
         else
         {
            if(lines[_loc2_].type == 3)
            {
               lines[_loc2_].simReset();
            }
            else if(lines[_loc2_].type == 7)
            {
               removeLine(lines[_loc2_]);
            }
            lines[_loc2_].parent._alpha = 100;
         }
         renderLine(lines[_loc2_]);
      }
      clearInterval(framerateInterval);
      steuc.text = Lines + " lines";
      panelMode("draw");
      if(lastTool == "camera")
      {
         panel[lastTool + "B"].onPress();
      }
      help._visible = true;
      for(var _loc1_ in riders)
      {
         if(!riders[_loc1_].riding)
         {
            riders[_loc1_].rworld.worldsled.sled.gotoAndStop(riders[_loc1_].sledState);
            riders[_loc1_].rworld.body.face.gotoAndStop(riders[_loc1_].faceState);
         }
      }
   };
   panel.saveB.onPress = function()
   {
      panel.stopB.onPress();
      cursorImage("normal");
      active = false;
      active2 = false;
      panel.fileDialog._visible = true;
      enableFileButtons();
      panelMode("save");
      var ver = compatible;
      trace("save mode " + ver);
      if(Lines > 0)
      {
         panel.fileDialog.saveButton.enabled = true;
      }
      else
      {
         panel.fileDialog.saveButton.enabled = false;
      }
      panel.fileDialog.saveButton.onRelease = function()
      {
         var _loc5_;
         var _loc13_;
         var _loc1_;
         var _loc6_;
         var _loc2_;
         var _loc8_;
         var _loc4_;
         var _loc7_;
         var _loc9_;
         var _loc3_;
         var _loc14_;
         if(Lines > 0)
         {
            active = true;
            _loc5_ = new Array(Lines);
            _loc13_ = 0;
            for(var _loc10_ in lines)
            {
               _loc1_ = lines[_loc10_];
               _loc5_[_loc13_] = [_loc1_.x1,_loc1_.y1,_loc1_.x2,_loc1_.y2,_loc1_.lim,Number(_loc1_.inv),_loc1_.prevLine,_loc1_.nextLine,_loc1_.name,_loc1_.type];
               _loc13_ = _loc13_ + 1;
            }
            _loc6_ = new Array(cameras.length);
            for(var _loc11_ in cameras)
            {
               _loc2_ = cameras[_loc11_];
               _loc6_[_loc11_] = [_loc2_._x,_loc2_._y,_loc2_.showRider1,_loc2_.showRider2,_loc2_.usePanning];
            }
            _loc8_ = new Array(riders.length);
            for(var _loc12_ in ridersInfo)
            {
               _loc4_ = ridersInfo[_loc12_];
               _loc8_[_loc12_] = _loc4_.type;
            }
            _loc7_ = removeSpaces(panel.fileDialog.name.text);
            _loc3_ = 0;
            while(_loc3_ < savedTracks.data.trackList.length)
            {
               if(savedTracks.data.trackList[_loc3_].label == _loc7_)
               {
                  _loc9_ = _loc3_;
               }
               _loc3_ = _loc3_ + 1;
            }
            if(_loc9_ != undefined)
            {
               _loc14_ = savedTracks.data.trackList.splice(_loc9_,1);
            }
            savedTracks.data.trackList.addItemAt(0,{label:_loc7_,data:_loc5_,level:totLines,startLine:[tla.startPoint._x,tla.startPoint._y],startLine2:[tla.startPoint2._x,tla.startPoint2._y],cameraData:_loc6_,riderData:_loc8_,version:ver});
            savedTracks.flush(savedTracks.getSize());
            panel.fileDialog._visible = false;
            panelMode("draw");
            panel[lastTool + "B"].onPress();
            cursorImage(cursorMode);
            disableFileButtons();
            panel.playB.enabled = true;
            panel.playB._alpha = 100;
            if(titleMovieMode)
            {
               for(_loc13_ in savedTracks.data.trackList[0])
               {
                  if(_loc13_ != "riderData")
                  {
                     trace(_loc13_ + "=" + savedTracks.data.trackList[0][_loc13_] + "&");
                  }
                  else
                  {
                     trace(_loc13_ + "=" + savedTracks.data.trackList[0][_loc13_][0].type + "," + savedTracks.data.trackList[0][_loc13_][1].type + "&");
                  }
               }
               trace("done=done");
            }
         }
      };
      panel.fileDialog.loadButton.onRelease = function()
      {
         var _loc5_;
         if(panel.fileDialog.savedTracks.selectedIndex != undefined)
         {
            disableFileButtons();
            undoList = [];
            reset();
            active = true;
            saved = false;
            showDummies(false);
            tla.flag._visible = false;
            buffer = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].data;
            _loc5_ = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].version;
            if(_loc5_ == undefined)
            {
               _loc5_ = "6";
            }
            switchToVersion(_loc5_);
            panel.fileDialog._visible = false;
            panel.fileDialog.name.text = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].label;
            segmentsRemainingToLoad = buffer.length;
            loadPerFrame = Math.max(15,Math.round(segmentsRemainingToLoad * 0.002));
            loadBounds(buffer);
            showAll();
            camBuffer = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].cameraData;
            camerasRemainingToLoad = camBuffer.length;
            camloadPerFrame = Math.max(1,Math.round(camerasRemainingToLoad * 0.002));
            if(tla._xscale > 100)
            {
               tla._xscale = tla._yscale = bufScale = 100;
               tla._x = tla._y = canvasX = canvasY = 0;
            }
            panel.onEnterFrame = function()
            {
               var _loc3_;
               var _loc1_;
               var _loc2_;
               var _loc4_;
               if(segmentsRemainingToLoad > 0)
               {
                  _loc3_ = 0;
                  while(_loc3_ < loadPerFrame && segmentsRemainingToLoad > 0)
                  {
                     _loc1_ = buffer[segmentsRemainingToLoad - 1];
                     segmentsRemainingToLoad--;
                     if(_loc1_[9] == undefined)
                     {
                        _loc1_[9] = 0;
                     }
                     switch(_loc1_[9])
                     {
                        case 0:
                           _loc2_ = new Floor(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],Boolean(_loc1_[5]),_loc1_[4]);
                           break;
                        case 1:
                           _loc2_ = new FloorAcc(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],Boolean(_loc1_[5]),_loc1_[4]);
                           break;
                        case 2:
                           _loc2_ = new FloorScenery(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3]);
                           break;
                        case 3:
                           _loc2_ = new FloorTrapdoor(UNITS_STEP_SIZE,_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],Boolean(_loc1_[5]),_loc1_[4]);
                           break;
                        case 4:
                           _loc2_ = new FloorSlow(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],Boolean(_loc1_[5]),_loc1_[4]);
                           break;
                        case 5:
                           _loc2_ = new FloorInvisible(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],Boolean(_loc1_[5]),_loc1_[4]);
                     }
                     Lines++;
                     _loc2_.name = _loc1_[8];
                     undoList.push(_loc1_[8]);
                     _loc2_.prevLine = _loc1_[6];
                     _loc2_.nextLine = _loc1_[7];
                     registerInGrid(_loc2_);
                     lines["line" + _loc2_.name] = _loc2_;
                     _loc4_ = tla.createEmptyMovieClip(_loc2_.name,tla.getNextHighestDepth());
                     _loc2_.parent = _loc4_;
                     renderLine(_loc2_);
                     _loc3_ = _loc3_ + 1;
                  }
                  steuc.text = Math.floor((buffer.length - segmentsRemainingToLoad) / buffer.length * 100) + "% loaded";
               }
               else if(camerasRemainingToLoad > 0)
               {
                  _loc3_ = 0;
                  while(_loc3_ < camloadPerFrame && camerasRemainingToLoad > 0)
                  {
                     _loc1_ = camBuffer[camBuffer.length - camerasRemainingToLoad];
                     if(camBuffer.length != camerasRemainingToLoad)
                     {
                        addCamera(false,true);
                     }
                     camerasRemainingToLoad--;
                     cameras[cameras.length - 1 + _loc3_]._x = _loc1_[0];
                     cameras[cameras.length - 1 + _loc3_]._y = _loc1_[1];
                     cameras[cameras.length - 1 + _loc3_].showRider1 = _loc1_[2];
                     cameras[cameras.length - 1 + _loc3_].showRider2 = _loc1_[3];
                     cameras[cameras.length - 1 + _loc3_].usePanning = _loc1_[4];
                     _loc3_ = _loc3_ + 1;
                  }
                  steuc.text = Math.floor((camBuffer.length - camerasRemainingToLoad) / camBuffer.length * 100) + "% loaded";
               }
               else
               {
                  finishLoad(savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex]);
               }
            };
         }
      };
      panel.fileDialog.deleteButton.onRelease = function()
      {
         enableConfirmButtons();
         panel.confirmDialog._visible = true;
         panel.confirmDialog.text.text = "Are you sure you want to delete the track?";
         panel.confirmDialog.Yes.onRelease = function()
         {
            disableConfirmButtons();
            panel.confirmDialog._visible = false;
            var _loc1_ = panel.fileDialog.savedTracks.selectedIndex;
            savedTracks.data.trackList.removeItemAt(_loc1_);
            panel.fileDialog.savedTracks.selectedIndex = Math.min(_loc1_,panel.fileDialog.savedTracks.length - 1);
         };
         panel.confirmDialog.No.onRelease = function()
         {
            disableConfirmButtons();
            panel.confirmDialog._visible = false;
         };
      };
      panel.fileDialog.close.onPress = function()
      {
         active = true;
         panel[lastTool + "B"].onPress();
         cursorImage(cursorMode);
         panel.fileDialog._visible = false;
         panelMode("draw");
         disableFileButtons();
         if(Lines != 0)
         {
            panel.playB.enabled = true;
            panel.playB._alpha = 100;
         }
      };
   };
   panel.flagB.onPress = function()
   {
      if(simulation)
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
      }
   };
   panel.eraserB.onPress = function()
   {
      cursorMode = "eraser";
      panel.toolSwatches.swatchEraser.gotoAndStop(1);
      pencilMode = -1;
      panel.swatches.selected._visible = false;
      panel.swatches._visible = true;
      panel.toolSwatches.swatchPencil._visible = false;
      panel.toolSwatches.swatchLine._visible = false;
      panel.toolSwatches.swatchEraser._visible = true;
      onMouseDown = function()
      {
         if(active2)
         {
            if(cursor._currentframe == 2)
            {
               pan();
            }
            else
            {
               erase(tla._xmouse,tla._ymouse);
               onMouseMove = function()
               {
                  erase(tla._xmouse,tla._ymouse);
               };
            }
         }
      };
      onMouseUp = function()
      {
         canvasX = tla._x;
         canvasY = tla._y;
         onMouseMove = function()
         {
         };
         stopDrag();
         pointToStartPoints();
      };
      onEnterFrame = function()
      {
      };
      lastTool = "eraser";
   };
   panel.cameraB.onPress = function()
   {
      panel.cameraB._alpha = 30;
      if(simulation)
      {
         bCamerasAreVisibleInSimulation = !bCamerasAreVisibleInSimulation;
         SetCameraVisibilities(bCamerasAreVisibleInSimulation,false);
         return undefined;
      }
      cursorMode = "camera";
      tla._xscale = tla._yscale = bufScale;
      tla._x = canvasX;
      tla._y = canvasY;
      panel.swatches._visible = false;
      showToolSwatch(false);
      onMouseDown = function()
      {
         if(active2)
         {
            if(cursor._currentframe == 2)
            {
               pan();
            }
            else
            {
               addCamera();
            }
         }
      };
      onMouseUp = function()
      {
         canvasX = tla._x;
         canvasY = tla._y;
         stopDrag();
      };
      onMouseMove = function()
      {
      };
      onEnterFrame = function()
      {
      };
      lastTool = "camera";
   };
}
function updateCameraTeloBs()
{
   var _loc1_ = ridersInfo[1].type;
   if(_loc1_ == 0)
   {
      _loc1_ = cameras[0].rider1._totalframes;
   }
   for(var _loc2_ in cameras)
   {
      cameras[_loc2_].gotoAndStop(1 + cameras[_loc2_].showRider1 + 2 * cameras[_loc2_].showRider2 + 4 * cameras[_loc2_].usePanning);
      if(cameras[_loc2_].cameraIc._currentframe != 3)
      {
         cameras[_loc2_].cameraIc.gotoAndStop(1 + cameras[_loc2_].usePanning);
      }
      if(cameras[_loc2_].showRider1 == false && cameras[_loc2_].showRider2 == false)
      {
         cameras[_loc2_].rider1.gotoAndStop(cameras[_loc2_].rider1._totalframes);
      }
      else
      {
         cameras[_loc2_].rider1.gotoAndStop(ridersInfo[0].type);
      }
      if(cameras[_loc2_].showRider2)
      {
         cameras[_loc2_].rider2.gotoAndStop(_loc1_);
      }
      cameras[_loc2_].rider1.riderName._visible = false;
      cameras[_loc2_].rider2.riderName._visible = false;
   }
}
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
   if(cameras[0] == cameraRef)
   {
      panel.cameraDialog.Delete.enabled = false;
      panel.cameraDialog.cbPan.enabled = false;
   }
   else
   {
      panel.cameraDialog.Delete.enabled = true;
      panel.cameraDialog.cbPan.enabled = true;
   }
   tipReleaseOutside();
   active = false;
   active2 = false;
}
function SetCameraOnEvents(newCameraIndex)
{
   cameras[newCameraIndex].onPress = function()
   {
      if(simulation)
      {
         return undefined;
      }
      if(active == true && active2 == false)
      {
         if(Key.isDown(68) && cameras[0] != this)
         {
            this.swapDepths(tla.getNextHighestDepth());
            startDrag(this,0);
            this.help._visible = false;
            this.arrows._visible = true;
         }
         else
         {
            openCameraDialog(this);
         }
      }
   };
   cameras[newCameraIndex].onRelease = function()
   {
      if(simulation)
      {
         return undefined;
      }
      if(active == true && active2 == false && cameras[0] != this)
      {
         stopDrag();
         this.help._visible = true;
         this.arrows._visible = false;
      }
      else
      {
         cameras[cameras.length].onPress();
      }
   };
   cameras[newCameraIndex].onRollOver = function()
   {
      if(simulation)
      {
         return undefined;
      }
      if(active == true && active2 == true)
      {
         _root.active2 = false;
         if(cameras[0] != this)
         {
            this.help._visible = true;
         }
         _root.cursor._visible = false;
         Mouse.show();
      }
   };
   cameras[newCameraIndex].onRollOut = function()
   {
      if(simulation)
      {
         return undefined;
      }
      if(active == true && active2 == false)
      {
         _root.active2 = true;
         if(cameras[0] != this)
         {
            this.help._visible = false;
            this.arrows._visible = false;
         }
         _root.cursorImage(_root.cursorMode);
      }
   };
   cameras[newCameraIndex].onReleaseOutside = function()
   {
      if(simulation)
      {
         return undefined;
      }
      if(active == true && active2 == false)
      {
         _root.active2 = true;
         if(!Key.isDown(68) && cameras[0] != this)
         {
            this.arrows._visible = false;
         }
      }
   };
}
function addCamera(isCamera0, isLoad)
{
   var _loc1_ = cameras.length;
   if(simulation)
   {
      return undefined;
   }
   if(isCamera0)
   {
      _loc1_ = 0;
      cameras[_loc1_] = panel.camera0;
      cameras[_loc1_].help._visible = false;
      cameras[_loc1_].arrows._visible = false;
   }
   else
   {
      cameras[_loc1_] = tla.attachMovie("CameraBase","camera" + _loc1_,tla.getNextHighestDepth());
      cameras[_loc1_]._x = (cursor._x - tla._x) * 100 / tla._xscale;
      cameras[_loc1_]._y = (cursor._y - tla._y) * 100 / tla._yscale;
   }
   cameras[_loc1_].cameraID = _loc1_;
   cameras[_loc1_].gotoAndStop(2);
   cameras[_loc1_].showRider1 = true;
   cameras[_loc1_].showRider2 = false;
   cameras[_loc1_].usePanning = false;
   cameras[_loc1_].help._visible = false;
   cameras[_loc1_].arrows._visible = false;
   cameras[_loc1_].cameraHighlight._visible = false;
   cameras[_loc1_].rider1.gotoAndStop(ridersInfo[0].type);
   cameras[_loc1_].rider2.gotoAndStop(cameras[_loc1_].rider2._totalframes);
   if(_loc1_ != 0)
   {
      cameras[_loc1_].cameraIc.gotoAndStop(1);
   }
   else
   {
      cameras[_loc1_].cameraIc.gotoAndStop(3);
      cameras[_loc1_].cameraBackground._visible = false;
   }
   SetCameraOnEvents(_loc1_);
   if(!isCamera0 && !isLoad)
   {
      openCameraDialog(cameras[_loc1_]);
   }
}
function UpdateCameraTriggerIcon()
{
   if(!panel.cameraDialog.cameraRef.showRider1 && !panel.cameraDialog.cameraRef.showRider2)
   {
      panel.cameraDialog.cameraRef.rider1.gotoAndStop(panel.cameraDialog.cameraRef.rider1._totalframes);
   }
   else
   {
      panel.cameraDialog.cameraRef.rider1.gotoAndStop(ridersInfo[0].type);
   }
   if(ridersInfo[1].type == 0)
   {
      panel.cameraDialog.cameraRef.rider2.gotoAndStop(panel.cameraDialog.cameraRef.rider2._totalframes);
   }
   else
   {
      panel.cameraDialog.cameraRef.rider2.gotoAndStop(ridersInfo[1].type);
   }
}
function fireCameraTriggers()
{
   var _loc1_ = 1;
   while(_loc1_ < cameras.length)
   {
      bTriggeredByRider1 = false;
      bTriggeredByRider2 = false;
      if(Math.abs(cameras[_loc1_]._x - ridersInfo[0].rworld.body._x) <= 12.5 && Math.abs(cameras[_loc1_]._y - ridersInfo[0].rworld.body._y) <= 12.5)
      {
         bTriggeredByRider1 = true;
      }
      if(Math.abs(cameras[_loc1_]._x - ridersInfo[1].rworld.body._x) <= 12.5 && Math.abs(cameras[_loc1_]._y - ridersInfo[1].rworld.body._y) <= 12.5)
      {
         bTriggeredByRider2 = true;
      }
      if(bTriggeredByRider1 || bTriggeredByRider2)
      {
         setCameraMode(_loc1_);
      }
      _loc1_ = _loc1_ + 1;
   }
}
function setCameraMode(cameraIndex)
{
   riderCameraPanStartPointX = tla._x;
   riderCameraPanStartPointY = tla._y;
   switch(Number(cameras[cameraIndex].showRider1) + 2 * Number(cameras[cameraIndex].showRider2) + 4 * Number(cameras[cameraIndex].usePanning))
   {
      case 0:
         riderCameraIndex = 5;
         break;
      case 1:
         riderCameraPanPercent = 0;
         riderCameraIndex = 0;
         break;
      case 2:
         riderCameraPanPercent = 1;
         riderCameraIndex = 1;
         break;
      case 3:
         riderCameraPanPercent = 0.5;
         riderCameraIndex = 4;
         break;
      case 4:
         riderCameraIndex = 6;
         velocityX = lasttlaX - tla._x;
         velocityY = lasttlaY - tla._y;
         break;
      case 5:
         riderCameraIndex = 3;
         riderCameraPanPercent = 1;
         break;
      case 6:
         riderCameraIndex = 2;
         riderCameraPanPercent = 0;
         break;
      case 7:
         riderCameraIndex = 4;
         riderCameraPanPercent = 0;
   }
}
function SetCameraVisibilities(bIsVisible, bSkip0)
{
   for(var _loc1_ in cameras)
   {
      if(!((bSkip0 || Lines == 0) && _loc1_ == 0))
      {
         cameras[_loc1_]._visible = bIsVisible;
      }
   }
}
function setCameraAlphas(nNewAlpha, bSkip0)
{
   for(var _loc2_ in cameras)
   {
      if(!(bSkip0 && _loc2_ == 0))
      {
         cameras[_loc2_]._alpha = nNewAlpha;
      }
   }
}
function setCameraEnableds(bNewEnabled, bSkip0)
{
   for(var _loc2_ in cameras)
   {
      if(!(bSkip0 && _loc2_ == 0))
      {
         cameras[_loc2_].enabled = bNewEnabled;
      }
   }
}
function removeSpaces(str)
{
   while(str.charAt(str.length - 1) == " ")
   {
      str = str.substr(0,str.length - 1);
   }
   return str;
}
function finishLoad(track)
{
   panel.onEnterFrame = function()
   {
   };
   var _loc1_;
   if(lines["line" + track.startLine] == undefined && typeof track.startLine == "number")
   {
      _loc1_ = [];
      _loc1_[0] = 100;
      _loc1_[1] = 100;
   }
   else if(typeof track.startLine == "number")
   {
      _loc1_ = [];
      _loc1_[0] = lines["line" + track.startLine].x1;
      _loc1_[1] = lines["line" + track.startLine].y1 - 50 * SCALEDOWN;
   }
   else
   {
      _loc1_ = track.startLine;
   }
   ridersInfo[0].startPoint._x = _loc1_[0];
   ridersInfo[0].startPoint._y = _loc1_[1];
   var _loc4_ = track.version;
   if(_loc4_ < "7.0")
   {
      ridersInfo[0].type = 1;
      ridersInfo[1].type = 0;
   }
   else
   {
      if(lines["line" + track.startLine2] == undefined && typeof track.startLine2 == "number")
      {
         _loc1_ = [];
         _loc1_[0] = 100;
         _loc1_[1] = 100;
      }
      else if(typeof track.startLine2 == "number")
      {
         _loc1_ = [];
         _loc1_[0] = lines["line" + track.startLine2].x1;
         _loc1_[1] = lines["line" + track.startLine2].y1 - 50 * SCALEDOWN;
      }
      else
      {
         _loc1_ = track.startLine2;
      }
      ridersInfo[1].startPoint._x = _loc1_[0];
      ridersInfo[1].startPoint._y = _loc1_[1];
      ridersInfo[0].type = track.riderData[0];
      ridersInfo[1].type = track.riderData[1];
   }
   totLines = track.level;
   panel[lastTool + "B"].onPress();
   cursorImage(cursorMode);
   panelMode("draw");
   cleanup();
   init();
   for(var _loc3_ in ridersInfo)
   {
      ridersInfo[_loc3_].activateRider(ridersInfo[_loc3_].type != 0);
   }
   pointToStartPoints();
   steuc.text = Lines + " lines";
   if(Lines != 0)
   {
      panel.playB.enabled = true;
      panel.playB._alpha = 100;
      panel.camera0._visible = true;
   }
   updateCameraTeloBs();
}
function disableFileButtons()
{
   fucusManager.enabled = false;
   panel.fileDilag.saveButton.enabled = panel.fileDilag.loadButton.enabled = panel.fileDilag.deleteButton.enabled = panel.fileDilag.close.enabled = false;
   panel.fileDialog.name.editable = false;
   panel.fileDialog.saveButton.onRelease = panel.fileDialog.loadButton.onRelease = panel.fileDialog.deleteButton.onRelease = panel.fileDialog.close.onPress = function()
   {
   };
   active = true;
}
function enableFileButtons()
{
   panel.fileDilag.saveButton.enabled = panel.fileDilag.loadButton.enabled = panel.fileDilag.deleteButton.enabled = panel.fileDilag.close.enabled = true;
   panel.fileDialog.name.editable = true;
   tipReleaseOutside();
   active = false;
}
function disableConfirmButtons()
{
   panel.confirmDialog.Yes.enabled = panel.confirmDialog.No.enabled = false;
   panel.confirmDialog.Yes.onRelease = panel.confirmDialog.No.onRelease = function()
   {
   };
   active = true;
}
function enableConfirmButtons()
{
   panel.confirmDialog.Yes.enabled = panel.confirmDialog.No.enabled = true;
   tipReleaseOutside();
   active = false;
}
function getBounds()
{
   maxX = 0;
   maxY = 0;
   minX = Stage.width;
   minY = Stage.height;
   var _loc1_;
   for(var _loc2_ in lines)
   {
      _loc1_ = lines[_loc2_];
      maxX = Math.max(maxX,Math.max(_loc1_.x1,_loc1_.x2));
      maxY = Math.max(maxY,Math.max(_loc1_.y1,_loc1_.y2));
      minX = Math.min(minX,Math.min(_loc1_.x1,_loc1_.x2));
      minY = Math.min(minY,Math.min(_loc1_.y1,_loc1_.y2));
   }
}
function loadBounds(linez)
{
   maxX = 0;
   maxY = 0;
   minX = Stage.width;
   minY = Stage.height;
   var _loc1_;
   for(var _loc3_ in linez)
   {
      _loc1_ = linez[_loc3_];
      maxX = Math.max(maxX,Math.max(_loc1_[0],_loc1_[2]));
      maxY = Math.max(maxY,Math.max(_loc1_[1],_loc1_[3]));
      minX = Math.min(minX,Math.min(_loc1_[0],_loc1_[2]));
      minY = Math.min(minY,Math.min(_loc1_[1],_loc1_[3]));
   }
}
function init()
{
   riders[0] = new RiderBase(true,tla,world1,tla.dummy,compas,tla.startPoint,SCALEDOWN,0,0,0,0,0,0,ridersInfo[0].type,panel.rider1B);
   if(ridersInfo[1].type != 0)
   {
      riders[1] = new RiderBase(true,tla,world2,tla.dummy2,compas2,tla.startPoint2,SCALEDOWN,DOTS_PER_RIDER,DOTS2_PER_RIDER,DOTSBRAID_PER_RIDER,24,6,10,ridersInfo[1].type,panel.rider2B);
   }
   for(var _loc1_ in lines)
   {
      lines[_loc1_].simReset();
   }
   TransientObjSimService.ClearAllLists();
}
function cleanup()
{
   if(riders[0] != undefined)
   {
      riders[0].cleanup();
      delete riders[0];
      riders[0] = undefined;
   }
   if(riders[1] != undefined)
   {
      riders[1].cleanup();
      delete riders[1];
      riders[1] = undefined;
   }
}
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
   for(var _loc1_ in cameras)
   {
      if(_loc1_ != 0)
      {
         cameras[_loc1_].removeMovieClip();
         delete cameras[_loc1_];
      }
   }
   cameras = [];
   if(cameras.length == 0)
   {
      addCamera(true);
      if(Lines == 0)
      {
         cameras[0]._visible = false;
      }
   }
   clearInterval(freezeTitleInterval);
}
function snap(x, y, vert, invert)
{
   var _loc2_ = Math.pow(SNAP_DISTANCE / (tla._xscale * 0.01),2);
   var _loc10_ = x;
   var _loc11_ = y;
   var _loc18_;
   var _loc17_;
   var _loc7_;
   var _loc6_;
   var _loc8_ = false;
   var _loc15_ = gridPos(x,y);
   var _loc9_;
   var _loc14_;
   var _loc4_;
   var _loc5_;
   var _loc3_;
   var _loc1_;
   if(!Key.isDown(83))
   {
      _loc14_ = -1;
      while(_loc14_ < 2)
      {
         _loc4_ = "x" + (_loc15_.x + _loc14_);
         if(grid[_loc4_] != undefined)
         {
            _loc5_ = -1;
            while(_loc5_ < 2)
            {
               _loc3_ = "y" + (_loc15_.y + _loc5_);
               if(grid[_loc4_][_loc3_] != undefined)
               {
                  for(var _loc16_ in grid[_loc4_][_loc3_].storage2)
                  {
                     _loc1_ = grid[_loc4_][_loc3_].storage2[_loc16_];
                     _loc7_ = Math.pow(x - _loc1_.x1,2) + Math.pow(y - _loc1_.y1,2);
                     _loc6_ = Math.pow(x - _loc1_.x2,2) + Math.pow(y - _loc1_.y2,2);
                     if(_loc7_ < _loc2_ && _loc1_.prevLine == undefined)
                     {
                        _loc2_ = _loc7_;
                        _loc10_ = _loc1_.x1;
                        _loc11_ = _loc1_.y1;
                        _loc8_ = 1;
                        _loc9_ = _loc1_;
                     }
                     if(_loc6_ < _loc2_ && _loc1_.nextLine == undefined)
                     {
                        _loc2_ = _loc6_;
                        _loc10_ = _loc1_.x2;
                        _loc11_ = _loc1_.y2;
                        _loc8_ = 2;
                        _loc9_ = _loc1_;
                     }
                  }
               }
               _loc5_ = _loc5_ + 1;
            }
         }
         _loc14_ = _loc14_ + 1;
      }
      _loc18_ = vert == _loc8_;
      _loc17_ = invert == _loc9_.inv;
      if(!(_loc18_ && !_loc17_ || !_loc18_ && _loc17_) || _loc9_.type == 2)
      {
         _loc8_ = false;
         _loc9_;
         _loc10_ = x;
         _loc11_ = y;
      }
   }
   return [_loc10_,_loc11_,_loc8_,_loc9_];
}
function resetPosition()
{
   for(var _loc2_ in riders)
   {
      riders[_loc2_].reset();
   }
   for(var _loc1_ in lines)
   {
      lines[_loc1_].simReset();
   }
   TransientObjSimService.ResetAllLists();
}
function erase(x, y)
{
   var _loc15_ = gridPos(x,y);
   var _loc8_ = 1 / (tla._xscale * 0.01);
   var _loc14_ = -1;
   var _loc6_;
   var _loc7_;
   var _loc5_;
   var _loc1_;
   var _loc2_;
   var _loc3_;
   var _loc10_;
   var _loc11_;
   var _loc9_;
   var _loc4_;
   while(_loc14_ < 2)
   {
      _loc6_ = "x" + (_loc15_.x + _loc14_);
      if(grid[_loc6_] != undefined)
      {
         _loc7_ = -1;
         while(_loc7_ < 2)
         {
            _loc5_ = "y" + (_loc15_.y + _loc7_);
            if(grid[_loc6_][_loc5_] != undefined)
            {
               for(var _loc16_ in grid[_loc6_][_loc5_].storage2)
               {
                  _loc1_ = grid[_loc6_][_loc5_].storage2[_loc16_];
                  _loc2_ = x - _loc1_.x1;
                  _loc3_ = y - _loc1_.y1;
                  _loc10_ = Math.sqrt(Math.pow(_loc2_,2) + Math.pow(_loc3_,2));
                  _loc11_ = Math.sqrt(Math.pow(x - _loc1_.x2,2) + Math.pow(y - _loc1_.y2,2));
                  _loc9_ = Math.abs(_loc1_.nx * _loc2_ + _loc1_.ny * _loc3_);
                  _loc4_ = (_loc2_ * _loc1_.dx + _loc3_ * _loc1_.dy) * _loc1_.invSqrDis;
                  if(_loc10_ < ERASER_SIZE * _loc8_ || _loc11_ < ERASER_SIZE * _loc8_ || _loc9_ < ERASER_SIZE * _loc8_ && _loc4_ >= 0 && _loc4_ <= 1)
                  {
                     switch(pencilMode)
                     {
                        case 0:
                           if(!(_loc1_ != Floor(_loc1_) || _loc1_ == FloorInvisible(_loc1_)))
                           {
                              break;
                           }
                           continue;
                        case 1:
                           if(!(_loc1_ != FloorAcc(_loc1_) || _loc1_ == FloorSlow(_loc1_)))
                           {
                              break;
                           }
                           continue;
                        case 2:
                           if(_loc1_ == FloorScenery(_loc1_))
                           {
                              break;
                           }
                           continue;
                        case 3:
                           if(_loc1_ == FloorTrapdoor(_loc1_))
                           {
                              break;
                           }
                           continue;
                        case 4:
                           if(_loc1_ == FloorSlow(_loc1_))
                           {
                              break;
                           }
                           continue;
                        case 5:
                           if(_loc1_ == FloorInvisible(_loc1_))
                           {
                              break;
                           }
                           continue;
                     }
                     removeLine(_loc1_);
                  }
               }
            }
            _loc7_ = _loc7_ + 1;
         }
      }
      _loc14_ = _loc14_ + 1;
   }
}
function save()
{
   for(var _loc1_ in riders)
   {
      riders[_loc1_].save();
   }
   for(var _loc2_ in lines)
   {
      lines[_loc2_].simSave();
   }
   TransientObjSimService.SaveAllLists();
}
function restore()
{
   for(var _loc2_ in lines)
   {
      lines[_loc2_].simRestore();
   }
   TransientObjSimService.RestoreAllLists();
   for(var _loc1_ in riders)
   {
      riders[_loc1_].restore();
   }
}
function pan()
{
   var _loc1_ = tla._xscale * 0.01;
   tla.startDrag(false);
   pointToStartPoints();
}
function zoom()
{
   onMouseDown = function()
   {
      if(active2)
      {
         oldScale = tla._xscale;
         oldy = _ymouse;
         if(cursor._currentframe == 2)
         {
            pan();
         }
         else
         {
            onMouseMove = function()
            {
               var _loc1_ = Math.min(Math.max(oldScale + (oldy - _ymouse) * 0.5,5),600);
               tla._xscale = tla._yscale = _loc1_;
               tla._x = Stage.width * 0.5 + (canvasX - Stage.width * 0.5) * (_loc1_ / oldScale);
               tla._y = Stage.height * 0.5 + (canvasY - Stage.height * 0.5) * (_loc1_ / oldScale);
            };
         }
      }
   };
   onMouseMove = function()
   {
   };
   onMouseUp = function()
   {
      stopDrag();
      pointToStartPoints();
      bufScale = tla._xscale;
      canvasX = tla._x;
      canvasY = tla._y;
      onMouseMove = function()
      {
      };
   };
   onEnterFrame = function()
   {
   };
}
function makeStartPoint(line)
{
   ridersInfo[0].startPoint._x = ridersInfo[1].startPoint._x = line.x1;
   ridersInfo[0].startPoint._y = ridersInfo[1].startPoint._y = line.y1 - 50 * SCALEDOWN;
   ridersInfo[1].startPoint._y -= 60 * SCALEDOWN;
   pointToStartPoints();
}
function getLastLine()
{
   var _loc1_ = undoList.length - 1;
   var _loc2_;
   while(_loc2_ == undefined && Lines > 0)
   {
      _loc2_ = lines["line" + undoList[_loc1_]];
      _loc1_ = _loc1_ - 1;
   }
   return _loc2_;
}
function getFirstLine()
{
   var _loc1_ = 0;
   var _loc2_;
   while(_loc2_ == undefined && Lines > 0)
   {
      _loc2_ = lines["line" + undoList[_loc1_]];
      _loc1_ = _loc1_ + 1;
   }
   return _loc2_;
}
function undo()
{
   var _loc1_;
   while(_loc1_ == undefined && Lines > 0)
   {
      _loc1_ = lines["line" + undoList.pop()];
   }
   if(Lines > 0)
   {
      removeLine(_loc1_);
   }
}
function addLine(line)
{
   line.name = totLines;
   undoList.push(totLines);
   Lines++;
   if(Lines == 1)
   {
      showStartPoints(true);
      showCompasses(true);
      makeStartPoint(line);
      EnableCompassToolTips();
      panel.playB.enabled = true;
      panel.playB._alpha = 100;
      panel.camera0._visible = true;
   }
   if(!simulation)
   {
      steuc.text = Lines + " lines";
   }
   totLines++;
   registerInGrid(line);
   lines["line" + line.name] = line;
   var _loc2_ = tla.createEmptyMovieClip(line.name,tla.getNextHighestDepth());
   line.parent = _loc2_;
   renderLine(line);
}
function removeLine(line)
{
   Lines--;
   if(!simulation)
   {
      steuc.text = Lines + " lines";
   }
   tla[line.name].removeMovieClip();
   removeFromGrid(line);
   if(Lines == 0)
   {
      startLine = undefined;
      panel.playB.enabled = false;
      panel.playB._alpha = 30;
      panel.camera0._visible = false;
      showCompasses(false);
      showStartPoints(false);
      DisableCompassToolTips();
   }
   if(lines["line" + line.nextLine].prevLine == line.name)
   {
      lines["line" + line.nextLine].prevLine = undefined;
      switch(lines["line" + line.nextLine].lim)
      {
         case 1:
            lines["line" + line.nextLine].lim = 0;
            break;
         case 3:
            lines["line" + line.nextLine].lim = 2;
      }
   }
   if(lines["line" + line.nextLine].nextLine == line.name)
   {
      lines["line" + line.nextLine].nextLine = undefined;
      switch(lines["line" + line.nextLine].lim)
      {
         case 2:
            lines["line" + line.nextLine].lim = 0;
            break;
         case 3:
            lines["line" + line.nextLine].lim = 1;
      }
   }
   if(lines["line" + line.prevLine].prevLine == line.name)
   {
      lines["line" + line.prevLine].prevLine = undefined;
      switch(lines["line" + line.prevLine].lim)
      {
         case 1:
            lines["line" + line.prevLine].lim = 0;
            break;
         case 3:
            lines["line" + line.prevLine].lim = 2;
      }
   }
   if(lines["line" + line.prevLine].nextLine == line.name)
   {
      lines["line" + line.prevLine].nextLine = undefined;
      switch(lines["line" + line.prevLine].lim)
      {
         case 2:
            lines["line" + line.prevLine].lim = 0;
            break;
         case 3:
            lines["line" + line.prevLine].lim = 1;
      }
   }
   delete lines["line" + line.name];
   false;
   if(Lines == 0)
   {
      undoList = [];
      switchToVersion(VERSION);
   }
}
function clearFloor()
{
   startLine = undefined;
   for(var _loc1_ in lines)
   {
      removeLine(lines[_loc1_]);
   }
}
function checkAngles(line1, line2)
{
   var _loc4_ = Math.acos((line1.dx * line2.dx + line1.dy * line2.dy) / (line1.dst * line2.dst));
   var _loc1_ = line1.dx * line2.dy - line2.dx * line1.dy > 0;
   var _loc5_;
   var _loc6_;
   if(line1.inv)
   {
      if(line1.inv == line2.inv)
      {
         _loc5_ = !_loc1_ ? true : _loc4_ < 1.570796;
         _loc6_ = !_loc1_;
      }
      else
      {
         _loc5_ = !_loc1_ ? _loc4_ > 1.570796 : true;
         _loc6_ = _loc1_;
      }
   }
   else if(line1.inv == line2.inv)
   {
      _loc5_ = !_loc1_ ? _loc4_ < 1.570796 : true;
      _loc6_ = _loc1_;
   }
   else
   {
      _loc5_ = !_loc1_ ? true : _loc4_ > 1.570796;
      _loc6_ = !_loc1_;
   }
   return [_loc5_,_loc6_,_loc4_];
}
function drawPencil()
{
   tla._xscale = tla._yscale = bufScale;
   onMouseDown = function()
   {
      tempLine.valid = false;
      var _loc1_;
      var _loc3_;
      if(active2)
      {
         if(cursor._currentframe == 2)
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
            _loc1_ = snap(tempLine.x1,tempLine.y1,1,tempLine.inv);
            if(_loc1_[2] != false)
            {
               _loc3_ = _loc1_[2] != 2 ? 1 : -1;
               tempLine.x1 = _loc1_[0];
               tempLine.y1 = _loc1_[1];
               prevLine = _loc1_[3];
               snaped = _loc1_[2];
            }
            onMouseMove = function()
            {
               var _loc2_;
               var _loc1_;
               if(active && active2 && cursor._currentframe != 2)
               {
                  tempLine.x2 = tla._xmouse;
                  tempLine.y2 = tla._ymouse;
                  tempLine.dx = tempLine.x2 - tempLine.x1;
                  tempLine.dy = tempLine.y2 - tempLine.y1;
                  tempLine.dst = Math.sqrt(Math.pow(tempLine.dx,2) + Math.pow(tempLine.dy,2));
                  _loc2_ = 1 / (tla._xscale * 0.01);
                  if(prevLine != undefined && pencilMode != 2)
                  {
                     checks = checkAngles(tempLine,prevLine);
                     tempLine.valid = tempLine.dst > MIN_LENGTH * _loc2_ && checks[0] && checks[2] > MIN_ANGLE && tempLine.dst < MAX_LENGTH;
                  }
                  else
                  {
                     tempLine.valid = tempLine.dst > MIN_LENGTH * _loc2_ && tempLine.dst < MAX_LENGTH;
                  }
                  if(tempLine.valid && _xmouse < Stage.width && _xmouse > 0 && _ymouse < Stage.height && _ymouse > 0)
                  {
                     tempLine.valid = false;
                     switch(pencilMode)
                     {
                        case 0:
                           _loc1_ = new Floor(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
                           break;
                        case 1:
                           _loc1_ = new FloorAcc(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
                           break;
                        case 2:
                           _loc1_ = new FloorScenery(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2);
                           break;
                        case 3:
                           _loc1_ = new FloorTrapdoor(UNITS_STEP_SIZE,tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
                           break;
                        case 4:
                           _loc1_ = new FloorSlow(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
                           break;
                        case 5:
                           _loc1_ = new FloorInvisible(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
                     }
                     addLine(_loc1_);
                     if(pencilMode != 2)
                     {
                        if(prevLine != undefined)
                        {
                           if(snaped == 1)
                           {
                              prevLine.addPrevLine(_loc1_,checks[1]);
                           }
                           else
                           {
                              prevLine.addNextLine(_loc1_,checks[1]);
                           }
                           _loc1_.addPrevLine(prevLine,checks[1]);
                        }
                        prevLine = _loc1_;
                     }
                     tempLine.x1 = tla._xmouse;
                     tempLine.y1 = tla._ymouse;
                     tla.clear();
                  }
                  else
                  {
                     tla.clear();
                     tla.lineStyle(1,16711680,100);
                     tla.moveTo(tempLine.x1,tempLine.y1);
                     tla.lineTo(tempLine.x2,tempLine.y2);
                  }
               }
            };
         }
      }
   };
   onMouseUp = function()
   {
      stopDrag();
      canvasX = tla._x;
      canvasY = tla._y;
      tla.clear();
      drawing = false;
      onMouseMove = function()
      {
      };
      pointToStartPoints();
      var _loc2_;
      var _loc1_;
      if(active2 && tempLine.valid && cursor._currentframe != 2)
      {
         nextLine = undefined;
         _loc2_ = snap(tempLine.x2,tempLine.y2,2,tempLine.inv);
         if(_loc2_[2])
         {
            checks2 = checkAngles(_loc2_[3],tempLine);
            if(checks2[0])
            {
               tempLine.x2 = _loc2_[0];
               tempLine.y2 = _loc2_[1];
               nextLine = _loc2_[3];
            }
         }
         switch(pencilMode)
         {
            case 0:
               _loc1_ = new Floor(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 1:
               _loc1_ = new FloorAcc(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 2:
               _loc1_ = new FloorScenery(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2);
               break;
            case 3:
               _loc1_ = new FloorTrapdoor(UNITS_STEP_SIZE,tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 4:
               _loc1_ = new FloorSlow(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 5:
               _loc1_ = new FloorInvisible(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
         }
         addLine(_loc1_);
         if(pencilMode != 2)
         {
            if(prevLine != undefined)
            {
               if(snaped == 1)
               {
                  prevLine.addPrevLine(_loc1_,checks[1]);
               }
               else
               {
                  prevLine.addNextLine(_loc1_,checks[1]);
               }
               _loc1_.addPrevLine(prevLine,checks[1]);
            }
            if(nextLine != undefined)
            {
               if(_loc2_[2] == 1)
               {
                  nextLine.addPrevLine(_loc1_,checks2[1]);
               }
               else
               {
                  nextLine.addNextLine(_loc1_,checks2[1]);
               }
               _loc1_.addNextLine(nextLine,checks2[1]);
            }
         }
      }
   };
   onEnterFrame = function()
   {
   };
}
function drawLine()
{
   tla._xscale = tla._yscale = bufScale;
   onMouseDown = function()
   {
      tempLine.valid = false;
      var _loc1_;
      var _loc2_;
      if(active2)
      {
         if(cursor._currentframe == 2)
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
            _loc1_ = snap(tempLine.x1,tempLine.y1,1,tempLine.inv);
            if(_loc1_[2] != false)
            {
               _loc2_ = _loc1_[2] != 2 ? 1 : -1;
               tempLine.x1 = _loc1_[0];
               tempLine.y1 = _loc1_[1];
               prevLine = _loc1_[3];
               snaped = _loc1_[2];
            }
            onMouseMove = function()
            {
               tempLine.x2 = tla._xmouse;
               tempLine.y2 = tla._ymouse;
               tempLine.dx = tempLine.x2 - tempLine.x1;
               tempLine.dy = tempLine.y2 - tempLine.y1;
               tempLine.dst = Math.sqrt(Math.pow(tempLine.dx,2) + Math.pow(tempLine.dy,2));
               var _loc1_ = 1 / (tla._xscale * 0.01);
               if(prevLine != undefined && pencilMode != 2)
               {
                  checks = checkAngles(tempLine,prevLine);
                  tempLine.valid = tempLine.dst > MIN_LENGTH * _loc1_ && checks[0] && tempLine.dst < MAX_LENGTH;
               }
               else
               {
                  tempLine.valid = tempLine.dst > MIN_LENGTH * _loc1_ && tempLine.dst < MAX_LENGTH;
               }
               if(tempLine.valid && _xmouse < Stage.width && _xmouse > 0 && _ymouse < Stage.height && _ymouse > 0 && cursor._currentframe != 2)
               {
                  tla.clear();
                  tla.lineStyle(1,7829367,100);
                  tla.moveTo(tempLine.x1,tempLine.y1);
                  tla.lineTo(tempLine.x2,tempLine.y2);
               }
               else
               {
                  tla.clear();
                  tla.lineStyle(1,16711680,100);
                  tla.moveTo(tempLine.x1,tempLine.y1);
                  tla.lineTo(tempLine.x2,tempLine.y2);
               }
            };
         }
      }
   };
   onMouseUp = function()
   {
      stopDrag();
      canvasX = tla._x;
      canvasY = tla._y;
      tla.clear();
      onMouseMove = function()
      {
      };
      drawing = false;
      pointToStartPoints();
      var _loc2_;
      var _loc1_;
      if(active2 && tempLine.valid && cursor._currentframe != 2)
      {
         nextLine = undefined;
         _loc2_ = snap(tempLine.x2,tempLine.y2,2,tempLine.inv);
         if(_loc2_[2])
         {
            checks2 = checkAngles(_loc2_[3],tempLine);
            if(checks2[0])
            {
               tempLine.x2 = _loc2_[0];
               tempLine.y2 = _loc2_[1];
               nextLine = _loc2_[3];
            }
         }
         switch(pencilMode)
         {
            case 0:
               _loc1_ = new Floor(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 1:
               _loc1_ = new FloorAcc(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 2:
               _loc1_ = new FloorScenery(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2);
               break;
            case 3:
               _loc1_ = new FloorTrapdoor(UNITS_STEP_SIZE,tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 4:
               _loc1_ = new FloorSlow(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 5:
               _loc1_ = new FloorInvisible(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
         }
         addLine(_loc1_);
         if(pencilMode != 2)
         {
            if(prevLine != undefined)
            {
               if(snaped == 1)
               {
                  prevLine.addPrevLine(_loc1_,checks[1]);
               }
               else
               {
                  prevLine.addNextLine(_loc1_,checks[1]);
               }
               _loc1_.addPrevLine(prevLine,checks[1]);
            }
            if(nextLine != undefined)
            {
               if(_loc2_[2] == 1)
               {
                  nextLine.addPrevLine(_loc1_,checks2[1]);
               }
               else
               {
                  nextLine.addNextLine(_loc1_,checks2[1]);
               }
               _loc1_.addNextLine(nextLine,checks2[1]);
            }
         }
      }
   };
   onEnterFrame = function()
   {
   };
   onMouseMove = function()
   {
   };
}
function simulate()
{
   if(!Key.isDown(17))
   {
      onMouseDown = function()
      {
      };
      onMouseUp = function()
      {
      };
   }
   bur = getTimer();
   onEnterFrame = function()
   {
      if(titleMovieMode && simulationPaused)
      {
         return undefined;
      }
      bur = getTimer();
      if(!slowMotion || bur - pre > 200)
      {
         pre = bur;
         for(var _loc1_ in riders)
         {
            riders[_loc1_].physics();
         }
         TransientObjSimService.UpdateAllLists();
         render();
         if(saveNow)
         {
            save();
            if(Key.isDown(67))
            {
               tla.flag._visible = false;
               showBureks();
            }
            else
            {
               showDummies(false);
               tla.flag._visible = true;
               if(riders[0].crash)
               {
                  tla.flag._x = riders[0].dots[4].x;
                  tla.flag._y = riders[0].dots[4].y;
               }
               else
               {
                  tla.flag._x = riders[0].dots[1].x;
                  tla.flag._y = riders[0].dots[1].y;
               }
            }
            saveNow = false;
            for(_loc1_ in riders)
            {
               riders[_loc1_].riding = riders[_loc1_].crash;
               riders[_loc1_].sledState = riders[_loc1_].rworld.worldsled.sled._currentframe;
               riders[_loc1_].faceState = riders[_loc1_].rworld.body.face._currentframe;
            }
            savedRiderCameraIndex = riderCameraIndex;
            savedRiderCameraPanPercent = riderCameraPanPercent;
         }
      }
      frameCounter++;
   };
   onMouseMove = function()
   {
   };
}
function nothing()
{
   onMouseDown = function()
   {
   };
   onMouseMove = function()
   {
   };
   onMouseUp = function()
   {
   };
   onEnterFrame = function()
   {
   };
}
function gridPos(x, y)
{
   ggridPos = new Object();
   ggridPos.x = Math.floor(x / GRIDSIZE);
   ggridPos.y = Math.floor(y / GRIDSIZE);
   ggridPos.gx = x - GRIDSIZE * ggridPos.x;
   ggridPos.gy = y - GRIDSIZE * ggridPos.y;
   return ggridPos;
}
function register(line, x, y)
{
   var _loc1_ = "x" + x;
   var _loc3_ = "y" + y;
   var _loc4_ = new Object();
   _loc4_.storage = [];
   _loc4_.storage2 = [];
   if(grid[_loc1_] == undefined)
   {
      grid[_loc1_] = [];
   }
   if(grid[_loc1_][_loc3_] == undefined)
   {
      grid[_loc1_][_loc3_] = _loc4_;
   }
   line.grids.push([x,y]);
   if(line.type != 2)
   {
      grid[_loc1_][_loc3_].storage[line.name] = line;
   }
   grid[_loc1_][_loc3_].storage2[line.name] = line;
}
function removeFromGrid(line)
{
   var _loc1_ = 0;
   while(_loc1_ < line.grids.length)
   {
      delete grid["x" + line.grids[_loc1_][0]]["y" + line.grids[_loc1_][1]].storage[line.name];
      delete grid["x" + line.grids[_loc1_][0]]["y" + line.grids[_loc1_][1]].storage2[line.name];
      _loc1_ = _loc1_ + 1;
   }
}
function lineBoxCheck(line, box)
{
   var _loc5_ = line.x - box.x;
   var _loc6_ = line.y - box.y;
   var _loc3_ = Math.abs(line.nx);
   var _loc4_ = Math.abs(line.ny);
   var _loc8_ = (_loc3_ * box.hx + box.hy * _loc4_) * _loc3_ + (_loc3_ * box.hx + _loc4_ * box.hy) * _loc4_;
   var _loc7_ = line.nx * _loc5_ + line.ny * _loc6_;
   var _loc9_ = Math.abs(_loc7_ * line.nx) + Math.abs(_loc7_ * line.ny);
   if(line.hx + box.hx < Math.abs(_loc5_))
   {
      return false;
   }
   if(line.hy + box.hy < Math.abs(_loc6_))
   {
      return false;
   }
   if(_loc8_ < _loc9_)
   {
      return false;
   }
   return true;
}
function renderLine(line)
{
   var _loc2_ = line.parent;
   _loc2_.clear();
   var _loc3_ = line.nx <= 0 ? Math.floor(line.nx) : Math.ceil(line.nx);
   var _loc4_ = line.ny <= 0 ? Math.floor(line.ny) : Math.ceil(line.ny);
   switch(line.type)
   {
      case 0:
         _loc2_.lineStyle(4 * SCALEDOWN,26367,100,true,"normal","round");
         _loc2_.moveTo(line.x1 + _loc3_,line.y1 + _loc4_);
         _loc2_.lineTo(line.x2 + _loc3_,line.y2 + _loc4_);
         _loc2_.lineStyle(4 * SCALEDOWN,0,100,true,"normal","round");
         _loc2_.moveTo(line.x1,line.y1);
         _loc2_.lineTo(line.x2,line.y2);
         break;
      case 1:
         _loc2_.lineStyle(5 * SCALEDOWN,13369344,100,true,"normal","none","miter");
         _loc2_.moveTo(line.x1 + _loc3_,line.y1 + _loc4_);
         _loc2_.lineTo(line.x2 + _loc3_,line.y2 + _loc4_);
         _loc2_.moveTo(line.x2,line.y2);
         _loc2_.lineTo(line.x2 + (line.nx * 4 - line.dx * line.invDst * 5),line.y2 + (line.ny * 4 - line.dy * line.invDst * 5));
         _loc2_.lineTo(line.x2 - line.dx * line.invDst * 5,line.y2 - line.dy * line.invDst * 5);
         _loc2_.lineStyle(4 * SCALEDOWN,0,100,true,"normal","round");
         _loc2_.moveTo(line.x1,line.y1);
         _loc2_.lineTo(line.x2,line.y2);
         break;
      case 2:
         _loc2_.lineStyle(4 * SCALEDOWN,52224,100,true,"normal","round");
         _loc2_.moveTo(line.x1,line.y1);
         _loc2_.lineTo(line.x2,line.y2);
         break;
      case 3:
         _loc2_.lineStyle(4 * SCALEDOWN,13369548,100,true,"normal","round");
         _loc2_.moveTo(line.x1 + _loc3_,line.y1 + _loc4_);
         _loc2_.lineTo(line.x2 + _loc3_ - line.dx * line.invDst * 5,line.y2 + _loc4_ - line.dy * line.invDst * 5);
         _loc2_.lineStyle(4 * SCALEDOWN,0,100,true,"normal","round");
         _loc2_.moveTo(line.x1,line.y1);
         _loc2_.lineTo(line.x2,line.y2);
         break;
      case 4:
         _loc2_.lineStyle(5 * SCALEDOWN,6697728,100,true,"normal","none","miter");
         _loc2_.moveTo(line.x1 + _loc3_,line.y1 + _loc4_);
         _loc2_.lineTo(line.x2 + _loc3_,line.y2 + _loc4_);
         _loc2_.moveTo(line.x2,line.y2);
         _loc2_.curveTo(line.x2 + line.nx * 8 - line.dx * line.invDst * 2.5,line.y2 + line.ny * 8 - line.dy * line.invDst * 2.5,line.x2 - line.dx * line.invDst * 5,line.y2 - line.dy * line.invDst * 5);
         _loc2_.lineStyle(4 * SCALEDOWN,0,100,true,"normal","round");
         _loc2_.moveTo(line.x1,line.y1);
         _loc2_.lineTo(line.x2,line.y2);
         break;
      case 5:
         _loc2_.lineStyle(4 * SCALEDOWN,13421772,100,true,"normal","round");
         _loc2_.moveTo(line.x1 + _loc3_,line.y1 + _loc4_);
         _loc2_.lineTo(line.x2 + _loc3_,line.y2 + _loc4_);
         _loc2_.lineStyle(4 * SCALEDOWN,10066329,100,true,"normal","round");
         _loc2_.moveTo(line.x1,line.y1);
         _loc2_.lineTo(line.x2,line.y2);
   }
   _loc2_.cacheAsBitmap = true;
}
function scaleRiderWorld(newScale)
{
   var _loc3_ = tla._xscale;
   tla._xscale = tla._yscale = newScale;
   tla._x = Stage.width * 0.5 + (tla._x - Stage.width * 0.5) * (newScale / _loc3_);
   tla._y = Stage.height * 0.5 + (tla._y - Stage.height * 0.5) * (newScale / _loc3_);
   for(var _loc2_ in riders)
   {
      riders[_loc2_].scaleRider(newScale,tla._x,tla._y);
   }
}
function render()
{
   if(Key.isDown(88))
   {
      scaleRiderWorld(Math.max(tla._xscale * 0.9,20));
   }
   if(Key.isDown(90))
   {
      scaleRiderWorld(Math.min(tla._xscale * 1.1,300));
   }
   updateCamera();
   renderRiders();
   fireCameraTriggers();
}
function satisfyBoundaries(dots)
{
   var _loc7_ = 0;
   var _loc5_;
   var _loc6_;
   var _loc4_;
   var _loc1_;
   var _loc3_;
   var _loc2_;
   while(_loc7_ < dots.length)
   {
      _loc5_ = dots[_loc7_];
      if(_loc5_.active)
      {
         _loc6_ = gridPos(_loc5_.x,_loc5_.y);
         _loc4_ = -1;
         while(_loc4_ < 2)
         {
            _loc1_ = "x" + (_loc6_.x + _loc4_);
            if(grid[_loc1_] != undefined)
            {
               _loc3_ = -1;
               while(_loc3_ < 2)
               {
                  _loc2_ = "y" + (_loc6_.y + _loc3_);
                  if(grid[_loc1_][_loc2_] != undefined)
                  {
                     for(var _loc8_ in grid[_loc1_][_loc2_].storage)
                     {
                        if(grid[_loc1_][_loc2_].storage[_loc8_].colide(_loc5_))
                        {
                           colided = true;
                        }
                     }
                  }
                  _loc3_ = _loc3_ + 1;
               }
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      _loc7_ = _loc7_ + 1;
   }
}
function framerate()
{
   steuc.text = frameCounter + " fps";
   frameCounter = 0;
}
function SetHelpEventFunctions()
{
   DisableCompassToolTips();
   compas.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(22);
      mouse.show();
   };
   compas2.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(23);
      mouse.show();
   };
   tipReleaseOutside();
   panel.lineB.onRollOver = panel.swatches.blue.onRollOver = panel.swatches.red.onRollOver = panel.swatches.green.onRollOver = panel.swatches.purple.onRollOver = panel.swatches.brown.onRollOver = panel.swatches.gray.onRollOver = panel.zoomB.onRollOver = panel.eraserB.onRollOver = panel.flagB.onRollOver = panel.handB.onRollOver = panel.pencilB.onRollOver = panel.playB.onRollOver = panel.stopB.onRollOver = panel.saveB.onRollOver = panel.trashB.onRollOver = panel.rider1B.onRollOver = panel.rider2B.onRollOver = panel
   .cameraB.onRollOver = panel.camera0.onRollOver = panel.lineB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.swatches.purple.onRollOut = panel.swatches.brown.onRollOut = panel.swatches.gray.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.rider1B
   .onRollOut = panel.rider2B.onRollOut = panel.cameraB.onRollOut = panel.camera0.onRollOut = panel.lineB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.swatches.purple.onReleaseOutside = panel.swatches.brown.onReleaseOutside = panel.swatches.gray.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel
   .playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.trashB.onReleaseOutside = panel.rider1B.onReleaseOutside = panel.rider2B.onReleaseOutside = panel.cameraB.onReleaseOutside = panel.camera0.onReleaseOutside = panel.lineB.onPress = panel.swatches.blue.onPress = panel.swatches.red.onPress = panel.swatches.green.onPress = panel.swatches.purple.onPress = panel.swatches.brown.onPress = panel.swatches.gray.onPress = panel.zoomB.onPress = panel.eraserB.onPress = panel
   .flagB.onPress = panel.handB.onPress = panel.pencilB.onPress = panel.playB.onPress = panel.stopB.onPress = panel.saveB.onPress = panel.trashB.onPress = panel.rider1B.onPress = panel.rider2B.onPress = panel.cameraB.onPress = panel.camera0.onPress = panel.lineB.onRelease = panel.swatches.blue.onRelease = panel.swatches.red.onRelease = panel.swatches.green.onRelease = panel.swatches.purple.onRelease = panel.swatches.brown.onRelease = panel.swatches.gray.onRelease = panel.zoomB.onRelease = panel.eraserB
   .onRelease = panel.flagB.onRelease = panel.handB.onRelease = panel.pencilB.onRelease = panel.playB.onRelease = panel.stopB.onRelease = panel.saveB.onRelease = panel.trashB.onRelease = panel.rider1B.onRelease = panel.rider2B.onRelease = panel.cameraB.onRelease = panel.camera0.onRelease = startpoint.onRollOver = startpoint.onRollOut = startpoint.onReleaseOutside = startpoint.onPress = startpoint.onRelease = startpoint2.onRollOver = startpoint2.onRollOut = startpoint2.onReleaseOutside = startpoint2
   .onPress = startpoint2.onRelease = function()
   {
   };
   for(var _loc2_ in riders)
   {
      riders[_loc2_].setOnEvents(false);
   }
   SetCamerasOnEvents(false);
   panel.cameraB.onPress = function()
   {
      this._alpha = 30;
   };
   panel.cameraB.onRelease = function()
   {
      this._alpha = 50;
   };
   panel.cameraB.onRollOut = function()
   {
      this._alpha = 100;
   };
   panel.pencilB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(2);
      mouse.show();
   };
   panel.lineB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(3);
      mouse.show();
   };
   panel.eraserB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(4);
      mouse.show();
   };
   panel.zoomB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(6);
      mouse.show();
   };
   panel.handB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(7);
      mouse.show();
   };
   panel.playB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(8);
      mouse.show();
   };
   panel.stopB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(9);
      mouse.show();
   };
   panel.flagB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(10);
      mouse.show();
   };
   panel.saveB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(11);
      mouse.show();
   };
   panel.trashB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(12);
      mouse.show();
   };
   helpscreen.icons.editor.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(13);
      mouse.show();
      this._alpha = 50;
   };
   helpscreen.icons.simulator.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(14);
      mouse.show();
      this._alpha = 50;
   };
   panel.swatches.red.onRollOver = panel.swatches.green.onRollOver = panel.swatches.blue.onRollOver = function()
   {
      if(invisibleLinesEnabled && trapdoorLinesEnabled)
      {
         helpscreen.texts.gotoAndStop(5);
      }
      else
      {
         helpscreen.texts.gotoAndStop(25);
      }
      mouse.show();
      this._alpha = 50;
   };
   panel.swatches.purple.onRollOver = panel.swatches.brown.onRollOver = panel.swatches.gray.onRollOver = function()
   {
      if(invisibleLinesEnabled)
      {
         helpscreen.texts.gotoAndStop(19);
      }
      else if(trapdoorLinesEnabled)
      {
         helpscreen.texts.gotoAndStop(24);
      }
      else
      {
         helpscreen.texts.gotoAndStop(25);
      }
      mouse.show();
      this._alpha = 50;
   };
   helpscreen.icons.startPoint.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(15);
      mouse.show();
      this._alpha = 50;
   };
   helpscreen.icons.helpCameraB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(20);
      mouse.show();
      this._alpha = 50;
   };
   panel.rider1B.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(16);
      mouse.show();
      this._alpha = 50;
   };
   panel.rider2B.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(17);
      mouse.show();
      this._alpha = 50;
   };
   panel.cameraB.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(18);
      mouse.show();
      this._alpha = 50;
   };
   panel.camera0.onRollOver = function()
   {
      helpscreen.texts.gotoAndStop(21);
      mouse.show();
      this._alpha = 50;
   };
   helpscreen.icons.startPoint.onRollOut = helpscreen.icons.editor.onRollOut = helpscreen.icons.simulator.onRollOut = helpscreen.icons.helpCameraB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.swatches.purple.onRollOut = panel.swatches.brown.onRollOut = panel.swatches.gray.onRollOut = panel.rider1B.onRollOut = panel.rider2B.onRollOut = panel.cameraB.onRollOut = panel.camera0.onRollOut = helpscreen.icons.startPoint.onReleaseOutside = helpscreen
   .icons.editor.onReleaseOutside = helpscreen.icons.simulator.onReleaseOutside = helpscreen.icons.helpCameraB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.swatches.purple.onReleaseOutside = panel.swatches.brown.onReleaseOutside = panel.swatches.gray.onReleaseOutside = panel.rider1B.onReleaseOutside = panel.rider2B.onReleaseOutside = panel.cameraB.onReleaseOutside = panel.camera0.onReleaseOutside = function()
   {
      this._alpha = 100;
   };
}
function switchToVersion(ver)
{
   switch(ver)
   {
      case "6":
         compatible = "6";
         trace("version 6 mode");
         switchToVersion60Compatible();
         break;
      case "6.1":
         compatible = "6.1";
         trace("version 6.1 mode");
         switchToVersion61Compatible();
         break;
      case "6.2":
         compatible = "6.2";
         trace("version 6.2 mode");
         switchToVersion62Compatible();
         break;
      case "7.0":
         compatible = "7.0";
         trace("version 7.0 mode");
         switchToVersion62Compatible();
         break;
      case "7.0T":
         compatible = "7.0T";
         trace("version 7.0T mode");
         switchToVersion62Compatible();
   }
}
function switchToVersion60Compatible()
{
   MAX_LENGTH = 2000;
   trace("version 6 mode");
   registerInGrid = function(line)
   {
      var _loc8_ = gridPos(line.x1,line.y1);
      var _loc7_ = gridPos(line.x2,line.y2);
      var _loc6_ = Math.min(_loc8_.x,_loc7_.x);
      var _loc4_;
      var _loc1_;
      var _loc2_;
      var _loc5_;
      while(_loc6_ <= Math.max(_loc7_.x,_loc8_.x))
      {
         _loc4_ = Math.min(_loc8_.y,_loc7_.y);
         while(_loc4_ <= Math.max(_loc7_.y,_loc8_.y))
         {
            _loc1_ = new Object();
            _loc1_.storage = [];
            _loc1_.storage2 = [];
            _loc1_.x = _loc6_ * GRIDSIZE + GRIDSIZE * 0.5;
            _loc1_.y = _loc4_ * GRIDSIZE + GRIDSIZE * 0.5;
            _loc1_.hx = _loc1_.hy = GRIDSIZE * 0.5;
            burek = lineBoxCheck(line,_loc1_);
            if(burek)
            {
               _loc2_ = "x" + _loc6_;
               _loc5_ = "y" + _loc4_;
               if(grid[_loc2_] == undefined)
               {
                  grid[_loc2_] = [];
               }
               if(grid[_loc2_][_loc5_] == undefined)
               {
                  grid[_loc2_][_loc5_] = _loc1_;
               }
               line.grids.push([_loc6_,_loc4_]);
               if(line.type != 2)
               {
                  grid[_loc2_][_loc5_].storage[line.name] = line;
               }
               grid[_loc2_][_loc5_].storage2[line.name] = line;
            }
            _loc4_ = _loc4_ + 1;
         }
         _loc6_ = _loc6_ + 1;
      }
   };
}
function switchToVersion61Compatible()
{
   MAX_LENGTH = 2000;
   trace("version 6.1 mode");
   registerInGrid = function(line)
   {
      var _loc1_ = gridPos(line.x1,line.y1);
      var _loc14_ = gridPos(line.x2,line.y2);
      var _loc12_ = line.dx <= 0 ? _loc1_.x : _loc14_.x;
      var _loc15_ = line.dx <= 0 ? _loc14_.x : _loc1_.x;
      var _loc13_ = line.dy <= 0 ? _loc1_.y : _loc14_.y;
      var _loc10_ = line.dy <= 0 ? _loc14_.y : _loc1_.y;
      if(line.dx == 0 && line.dy == 0 || _loc1_.x == _loc14_.x && _loc1_.y == _loc14_.y)
      {
         register(line,_loc1_.x,_loc1_.y);
         return undefined;
      }
      register(line,_loc1_.x,_loc1_.y);
      var _loc3_ = line.x1;
      var _loc2_ = line.y1;
      var _loc9_;
      var _loc11_;
      var _loc8_;
      if(line.dx != 0 && line.dy != 0)
      {
         _loc9_ = line.dy / line.dx;
         _loc11_ = 1 / _loc9_;
         _loc8_ = line.y1 - _loc9_ * line.x1;
      }
      var _loc6_;
      var _loc5_;
      var _loc7_;
      while(true)
      {
         _loc6_ = line.dx <= 0 ? - (_loc1_.gx + 1) : GRIDSIZE - _loc1_.gx;
         _loc5_ = line.dy <= 0 ? - (_loc1_.gy + 1) : GRIDSIZE - _loc1_.gy;
         if(line.dx == 0)
         {
            _loc2_ += _loc5_;
         }
         else if(line.dy == 0)
         {
            _loc3_ += _loc6_;
         }
         else
         {
            _loc7_ = Math.round(_loc9_ * (_loc3_ + _loc6_) + _loc8_);
            if(Math.abs(_loc7_ - _loc2_) < Math.abs(_loc5_))
            {
               _loc3_ += _loc6_;
               _loc2_ = _loc7_;
            }
            else if(Math.abs(_loc7_ - _loc2_) == Math.abs(_loc5_))
            {
               _loc3_ += _loc6_;
               _loc2_ += _loc5_;
            }
            else
            {
               _loc3_ = Math.round((_loc2_ + _loc5_ - _loc8_) * _loc11_);
               _loc2_ += _loc5_;
            }
         }
         _loc1_ = gridPos(_loc3_,_loc2_);
         if(!(_loc1_.x >= _loc15_ && _loc1_.x <= _loc12_ && _loc1_.y >= _loc10_ && _loc1_.y <= _loc13_))
         {
            return undefined;
         }
         register(line,_loc1_.x,_loc1_.y);
      }
   };
}
function switchToVersion62Compatible()
{
   MAX_LENGTH = 2000;
   registerInGrid = function(line)
   {
      var _loc1_ = gridPos(line.x1,line.y1);
      var _loc13_ = gridPos(line.x2,line.y2);
      var _loc9_ = line.dx <= 0 ? _loc1_.x : _loc13_.x;
      var _loc7_ = line.dx <= 0 ? _loc13_.x : _loc1_.x;
      var _loc10_ = line.dy <= 0 ? _loc1_.y : _loc13_.y;
      var _loc8_ = line.dy <= 0 ? _loc13_.y : _loc1_.y;
      if(line.dx == 0 && line.dy == 0 || _loc1_.x == _loc13_.x && _loc1_.y == _loc13_.y)
      {
         register(line,_loc1_.x,_loc1_.y);
         return undefined;
      }
      register(line,_loc1_.x,_loc1_.y);
      var _loc4_ = line.x1;
      var _loc3_ = line.y1;
      var _loc11_ = 1 / line.dx;
      var _loc12_ = 1 / line.dy;
      var _loc5_;
      var _loc6_;
      while(true)
      {
         if(_loc1_.x < 0)
         {
            difX = line.dx <= 0 ? - GRIDSIZE - _loc1_.gx : GRIDSIZE + _loc1_.gx;
         }
         else
         {
            difX = line.dx <= 0 ? - (_loc1_.gx + 1) : GRIDSIZE - _loc1_.gx;
         }
         if(_loc1_.y < 0)
         {
            _loc5_ = line.dy <= 0 ? - GRIDSIZE - _loc1_.gy : GRIDSIZE + _loc1_.gy;
         }
         else
         {
            _loc5_ = line.dy <= 0 ? - (_loc1_.gy + 1) : GRIDSIZE - _loc1_.gy;
         }
         if(line.dx == 0)
         {
            _loc3_ += _loc5_;
         }
         else if(line.dy == 0)
         {
            _loc4_ += difX;
         }
         else
         {
            _loc6_ = _loc3_ + line.dy * difX * _loc11_;
            if(Math.abs(_loc6_ - _loc3_) < Math.abs(_loc5_))
            {
               _loc4_ += difX;
               _loc3_ = _loc6_;
            }
            else if(Math.abs(_loc6_ - _loc3_) == Math.abs(_loc5_))
            {
               _loc4_ += difX;
               _loc3_ += _loc5_;
            }
            else
            {
               _loc4_ += line.dx * _loc5_ * _loc12_;
               _loc3_ += _loc5_;
            }
         }
         _loc1_ = gridPos(_loc4_,_loc3_);
         if(!(_loc1_.x >= _loc7_ && _loc1_.x <= _loc9_ && _loc1_.y >= _loc8_ && _loc1_.y <= _loc10_))
         {
            return undefined;
         }
         register(line,_loc1_.x,_loc1_.y);
      }
   };
}
function showToolTip()
{
   clearInterval(tooltipInterval);
   tooltip_mc.onEnterFrame = null;
   tooltip_mc._x = _xmouse;
   tooltip_mc._y = _ymouse <= Stage.height * 0.5 ? _ymouse + 22 : _ymouse - tooltip_mc.tip.height - 2;
   if(tooltip_mc.xtip != undefined)
   {
      tooltip_mc._x = tooltip_mc.xtip;
   }
   if(tooltip_mc.ytip != undefined)
   {
      tooltip_mc._y = tooltip_mc.ytip;
   }
   var _loc1_ = 10;
   var _loc2_ = 1;
   if(tooltip_mc._x + tooltip_mc.tip.width + _loc1_ > Stage.width)
   {
      tooltip_mc._x = Stage.width - tooltip_mc.tip.width - _loc1_;
   }
   if(tooltip_mc._x < _loc1_)
   {
      tooltip_mc.x = _loc1_;
   }
   if(tooltip_mc._y < _loc2_)
   {
      tooltip_mc._y = _loc2_;
   }
   if(tooltip_mc._y + tooltip_mc.tip.height + _loc2_ > Stage.height)
   {
      tooltip_mc._y = Stage.height - tooltip_mc.tip.height - _loc2_;
   }
   tooltip_mc._visible = true;
}
function EnableCompassToolTips()
{
   compas.onRollOver = compas2.onRollOver = myRollOver;
   compas.onRollOut = compas2.onRollOut = myRollOut;
   compas.onReleaseOutside = compas2.onReleaseOutside = myReleaseOutside;
}
function DisableCompassToolTips()
{
   compas.onRollOver = compas2.onRollOver = undefined;
   compas.onRollOut = compas2.onRollOut = undefined;
   compas.onReleaseOutside = compas2.onReleaseOutside = undefined;
}
function openTrackDialog()
{
   nothing();
   cursorImage("normal");
   panelMode("trackOptions");
   tipReleaseOutside();
   for(var _loc1_ in ridersInfo)
   {
      ridersInfo[_loc1_].typeOld = ridersInfo[_loc1_].type;
   }
   panel.trackDialog.cbRider1.selected = panel.camera0.showRider1;
   panel.trackDialog.cbRider2.selected = panel.camera0.showRider2;
   panel.trackDialog.rider1.gotoAndStop(ridersInfo[0].type);
   if(ridersInfo[1].type == 0)
   {
      panel.trackDialog.rider2.gotoAndStop(panel.trackDialog.rider2._totalframes);
   }
   else
   {
      panel.trackDialog.rider2.gotoAndStop(ridersInfo[1].type);
   }
   panel.trackDialog.rider1.riderName._visible = false;
   panel.trackDialog.rider2.riderName._visible = false;
   panel.trackDialog._visible = true;
   active = false;
   active2 = false;
}
function renderLineSimAll()
{
   var _loc1_;
   for(var _loc2_ in lines)
   {
      _loc1_ = lines[_loc2_];
      if(_loc1_.type == 7)
      {
         removeLine(_loc1_);
      }
      else
      {
         _loc1_.parent.clear();
         if(_loc1_.type == 3)
         {
            if(!_loc1_.hidden)
            {
               _loc1_.parent.lineStyle(4 * SCALEDOWN,0,100,false,"normal","round");
               _loc1_.parent.moveTo(_loc1_.x1 + _loc1_.currentdx,_loc1_.y1 + _loc1_.currentdy);
               _loc1_.parent.lineTo(_loc1_.x2,_loc1_.y2);
            }
         }
         else
         {
            _loc1_.parent.lineStyle(4 * SCALEDOWN,0,100,false,"normal","round");
            _loc1_.parent.moveTo(_loc1_.x1,_loc1_.y1);
            _loc1_.parent.lineTo(_loc1_.x2,_loc1_.y2);
         }
      }
   }
}
function getSSTrackCount()
{
   sstTarget.unloadMovie();
   sstTarget.removeMovieClip();
   this.createEmptyMovieClip("sstTarget",this.getNextHighestDepth());
   sstTarget.loadVariables("LR3B.sst");
   param_interval = setInterval(checkParamsLoaded,100,startSSTrackMode);
}
function startSSTrackMode()
{
   nTrackCount = sstTarget.numTracks;
   startSSTrack();
}
function checkParamsLoaded(callbackFunction)
{
   if(sstTarget.done != undefined)
   {
      clearInterval(param_interval);
      tla.titleBackground.ChangeList.text = getChangeListNumber();
      callbackFunction();
   }
}
function startSSTrack()
{
   init();
   getSSTrack(nTrackNumber);
}
function getSSTrack(nTrackNumber)
{
   this.createEmptyMovieClip("sstTarget",this.getNextHighestDepth());
   sstTarget.loadVariables("LR3B." + nTrackNumber + ".sst");
   param_interval = setInterval(checkParamsLoaded,100,parseSSTrack);
}
function parseSSTrack()
{
   var _loc4_ = sstTarget.startLine.split(",");
   tla.startPoint._x = Number(_loc4_[0]);
   tla.startPoint._y = Number(_loc4_[1]);
   var _loc2_ = sstTarget.startLine2.split(",");
   tla.startPoint2._x = Number(_loc2_[0]);
   tla.startPoint2._y = Number(_loc2_[1]);
   var _loc3_ = sstTarget.riderData.split(",");
   var _loc1_ = [];
   _loc1_[0] = Number(_loc3_[0]);
   _loc1_[1] = Number(_loc3_[1]);
   ssTracks.data.trackList.addItemAt(0,{label:sstTarget.label,data:sstTarget.data,level:Number(sstTarget.level),startLine:[tla.startPoint._x,tla.startPoint._y],startLine2:[tla.startPoint2._x,tla.startPoint2._y],cameraData:sstTarget.cameraData,riderData:_loc1_,version:sstTarget.version});
   loadRemoteTrack();
   playSSTrack();
}
function playSSTrack()
{
   panel.playB.onPress();
   clearInterval(pickTrackInterval);
   pickTrackInterval = setInterval(pickSSTrack,30000);
}
function pickSSTrack()
{
   clearInterval(pickTrackInterval);
   nTrackNumber++;
   nTrackNumber %= nTrackCount;
   startSSTrack();
}
function loadRemoteTrack()
{
   reset();
   var _loc6_ = sstTarget.data;
   var _loc3_ = _loc6_.split(",");
   for(i in _loc3_)
   {
      if(_loc3_[i] != "undefined")
      {
         _loc3_[i] = Number(_loc3_[i]);
      }
   }
   var _loc5_ = sstTarget.version;
   if(_loc5_ == undefined)
   {
      _loc5_ = "6";
   }
   switchToVersion(_loc5_);
   segmentsRemainingToLoad = _loc3_.length / 10;
   loadBounds(_loc3_);
   showAll();
   if(tla._xscale > 100)
   {
      tla._xscale = tla._yscale = bufScale = 100;
      tla._x = tla._y = canvasX = canvasY = 0;
   }
   var _loc1_;
   var _loc2_;
   var _loc4_;
   while(segmentsRemainingToLoad > 0)
   {
      bufIndex = (segmentsRemainingToLoad - 1) * 10;
      _loc1_ = _loc3_;
      segmentsRemainingToLoad--;
      _loc1_[bufIndex + 9] = Number(_loc1_[bufIndex + 9]);
      if(_loc1_[bufIndex + 9] == undefined)
      {
         _loc1_[bufIndex + 9] = 0;
      }
      switch(_loc1_[bufIndex + 9])
      {
         case 0:
            _loc2_ = new Floor(_loc1_[bufIndex + 0],_loc1_[bufIndex + 1],_loc1_[bufIndex + 2],_loc1_[bufIndex + 3],Boolean(_loc1_[bufIndex + 5]),_loc1_[bufIndex + 4]);
            break;
         case 1:
            _loc2_ = new FloorAcc(_loc1_[bufIndex + 0],_loc1_[bufIndex + 1],_loc1_[bufIndex + 2],_loc1_[bufIndex + 3],Boolean(_loc1_[bufIndex + 5]),_loc1_[bufIndex + 4]);
            break;
         case 2:
            _loc2_ = new FloorScenery(_loc1_[bufIndex + 0],_loc1_[bufIndex + 1],_loc1_[bufIndex + 2],_loc1_[bufIndex + 3]);
            break;
         case 3:
            _loc2_ = new FloorTrapdoor(_loc1_[bufIndex + 0],_loc1_[bufIndex + 1],_loc1_[bufIndex + 2],_loc1_[bufIndex + 3],Boolean(_loc1_[bufIndex + 5]),_loc1_[bufIndex + 4]);
            break;
         case 4:
            _loc2_ = new FloorSlow(_loc1_[bufIndex + 0],_loc1_[bufIndex + 1],_loc1_[bufIndex + 2],_loc1_[bufIndex + 3],Boolean(_loc1_[bufIndex + 5]),_loc1_[bufIndex + 4]);
            break;
         case 5:
            _loc2_ = new FloorInvisible(_loc1_[bufIndex + 0],_loc1_[bufIndex + 1],_loc1_[bufIndex + 2],_loc1_[bufIndex + 3],Boolean(_loc1_[bufIndex + 5]),_loc1_[bufIndex + 4]);
      }
      Lines++;
      _loc2_.name = _loc1_[bufIndex + 8];
      undoList.push(_loc1_[bufIndex + 8]);
      _loc2_.prevLine = _loc1_[bufIndex + 6];
      _loc2_.nextLine = _loc1_[bufIndex + 7];
      registerInGrid(_loc2_);
      lines["line" + _loc2_.name] = _loc2_;
      _loc4_ = tla.createEmptyMovieClip(_loc2_.name,tla.getNextHighestDepth());
      _loc2_.parent = _loc4_;
      _loc2_._alpha = 0;
   }
   finishLoad(sstTarget);
   riders[1].setRiderType(5);
}
tla.titleBackground.play.onPress = function()
{
   _root.enablePlayButton = false;
   panel.stopB.onPress();
   gotoAndStop(7);
   clearInterval(pickTrackInterval);
};
stop();
Stage.align = "TL";
barrierR = Stage.width * 0.61803;
barrierL = Stage.width * 0.38197;
barrierT = Stage.height * 0.38197;
barrierB = Stage.height * 0.61803;
resize = new Object();
navodila._x = Stage.width * 0.5;
navodila._y = Stage.height * 0.5;
navodila.cover._width = Stage.width;
navodila.cover._height = Stage.height;
navodila.cover._x = (- Stage.width) * 0.5;
navodila.cover._y = (- Stage.height) * 0.5;
compas.distance.autoSize = "left";
compas2.distance.autoSize = "left";
resize.onResize = function()
{
   helpscreen.icons._x = helpscreen.texts._x = panel._x = Stage.width * 0.5;
   steuc._width = Stage.width - (panel._x + panel._width * 0.5) - 25;
   steuc._x = Math.max(Stage.width - steuc._width - 15,panel._x + panel._width * 0.5);
   barrierR = Stage.width * 0.61803;
   barrierL = Stage.width * 0.38197;
   barrierT = Stage.height * 0.38197;
   barrierB = Stage.height * 0.61803;
   navodila._x = vStage.width * 0.5;
   navodila._y = Stage.height * 0.5;
   navodila.cover._width = Stage.width;
   navodila.cover._height = Stage.height;
   navodila.cover._x = (- Stage.width) * 0.5;
   navodila.cover._y = (- Stage.height) * 0.5;
   helpscreen.back._y = help._y = Stage.height - 24;
   compas._y = Stage.height - 14;
   compas._x = Stage.width * 0.4;
   compas2._y = Stage.height - 14;
   compas2._x = Stage.width * 0.6;
   helpscreen.icons._x = Stage.width * 0.5;
   helpscreen.icons._x = 7;
};
resize.onResize();
Stage.addListener(resize);
var DOTS_PER_RIDER = 15;
var DOTS2_PER_RIDER = 6;
var DOTSBRAID_PER_RIDER = 10;
var ITERATE = 6;
var SCALEDOWN = 0.5;
var INVSCALE = 200;
var ENDURANCE = 0.057;
var AIR_FRICTION = 0.9;
var SNAP_DISTANCE = 14;
var ERASER_SIZE = 5;
var MAX_LENGTH = 10000;
var MIN_LENGTH = 10;
var MIN_ANGLE = 0.03;
var GRIDSIZE = 14;
var TO_DEG = 57.29578;
var UNITS_STEP_SIZE = GRIDSIZE / 4;
var simulation = false;
var frameCounter = 0;
var canvasX = 0;
var canvasY = 0;
var bufScale = 100;
var a = {x:0,y:0.35 * SCALEDOWN};
var aGravity = {x:0,y:0.35 * SCALEDOWN};
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
var riders = [];
var ridersInfo = [];
var defaultRiderType1 = 1;
var defaultRiderType2 = 0;
ridersInfo[0] = new RiderInfo(true,world1,tla.dummy,compas,tla.startPoint,SCALEDOWN,defaultRiderType1);
ridersInfo[1] = new RiderInfo(false,world2,tla.dummy2,compas2,tla.startPoint2,SCALEDOWN,defaultRiderType2);
var enabledRiderTypes = [];
enabledRiderTypes[0] = true;
enabledRiderTypes[1] = true;
enabledRiderTypes[2] = true;
enabledRiderTypes[3] = true;
enabledRiderTypes[4] = true;
enabledRiderTypes[5] = true;
enabledRiderTypes[6] = true;
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
var BraidDX = 2.5;
var HeadTopX = ShoulderX;
var HeadTopY = ShoulderY - 13;
var degreesLimitBraid = 0.698132;
var PumpkinX = ShoulderX;
var PumpkinY = ShoulderY - 7;
var PUMPKIN_RADIUS = 6;
var PUMPKIN_CIRCUMF = 6.28318 * PUMPKIN_RADIUS;
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
var savedTracks = SharedObject.getLocal("savedLines","/");
if(savedTracks.data.trackList == undefined)
{
   savedTracks.data.trackList = [];
}
panel.fileDialog.savedTracks.dataProvider = savedTracks.data.trackList;
panel.fileDialog.savedTracks.defaultIcon = "rev6";
panel.fileDialog.savedTracks.iconFunction = function(item)
{
   var _loc1_ = item.version;
   switch(_loc1_)
   {
      case "6.1":
         return "rev6.1";
      case "6.2":
         return "rev6.2";
      case "7.0":
         return "rev7.0";
      case "7.0T":
         return "rev7.0T";
      default:
         return "rev6";
   }
};
panel.fileDialog._visible = false;
panel.confirmDialog._visible = false;
panel.cameraDialog._visible = false;
panel.trackDialog._visible = false;
helpscreen._visible = false;
SetPanelEventFunctions();
helpscreen.Continue.onPress = function()
{
   helpscreen._visible = false;
   cursorImage(lastTool);
};
var mouseListener = new Object();
mouseListener.onMouseWheel = function(delta)
{
   var _loc1_;
   var _loc2_;
   if(simulation == false)
   {
      _loc1_ = tla._xscale;
      _loc2_ = Math.min(Math.max(_loc1_ + _loc1_ * 0.04 * delta,5),300);
      tla._x = Stage.width * 0.5 + (canvasX - Stage.width * 0.5) * (_loc2_ / _loc1_);
      tla._y = Stage.height * 0.5 + (canvasY - Stage.height * 0.5) * (_loc2_ / _loc1_);
      tla._xscale = tla._yscale = _loc2_;
      bufScale = tla._xscale;
      canvasX = tla._x;
      canvasY = tla._y;
      pointToStartPoints();
   }
};
Mouse.addListener(mouseListener);
cursor.onMouseMove = function()
{
   cursor._x = _xmouse;
   cursor._y = _ymouse;
   pointToStartPoints();
};
cursorImage = function(Mode)
{
   switch(Mode)
   {
      case "pencil":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(1);
         cursorMode = Mode;
         break;
      case "hand":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(2);
         cursorMode = Mode;
         break;
      case "eraser":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(3);
         cursorMode = Mode;
         break;
      case "zoom":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(4);
         cursorMode = Mode;
         break;
      case "normal":
         Mouse.show();
         cursor._visible = false;
         cursorMode = Mode;
         break;
      case "line":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(5);
         cursorMode = Mode;
         break;
      case "camera":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(6);
         cursorMode = Mode;
   }
};
panelMode = function(Mode)
{
   if(Mode == "draw")
   {
      panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.stopB.enabled = panel.flagB.enabled = panel.rider1B.enabled = panel.rider2B.enabled = panel.cameraB.enabled = true;
      panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.stopB._alpha = panel.flagB._alpha = panel.rider1B._alpha = panel.rider2B._alpha = panel.cameraB._alpha = 100;
      panel.flagB.gotoAndStop(2);
      active2 = true;
      showCompasses(true);
      showStartPoints(true);
      EnableCompassToolTips();
   }
   else if(Mode == "simulate")
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
   else if(Mode == "save" || Mode == "cameraEdit" || Mode == "trackOptions")
   {
      panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = panel.rider1B.enabled = panel.rider2B.enabled = panel.cameraB.enabled = false;
      panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = panel.rider1B._alpha = panel.rider2B._alpha = panel.cameraB._alpha = 30;
      panel.flagB.gotoAndStop(1);
      panel.swatches._visible = false;
      showToolSwatch(false);
      tipReleaseOutside();
   }
};
SetCamerasOnEvents(bFlag);
if(bFlag)
{
   var nIndex = 0;
   while(nIndex < cameras.length)
   {
      SetCameraOnEvents(nIndex);
      nIndex++;
   }
}
else
{
   var nIndex = 0;
   while(nIndex < cameras.length)
   {
      cameras[nIndex].onPress = cameras[nIndex].onRelease = cameras[nIndex].onRollOver = cameras[nIndex].onRollOut = cameras[nIndex].onReleaseOutside = function()
      {
      };
      nIndex++;
   }
}
panel.cameraDialog.Delete.onRelease = function()
{
   var _loc1_ = 0;
   while(_loc1_ < cameras.length)
   {
      if(panel.cameraDialog.cameraRef == cameras[_loc1_])
      {
         cameras[_loc1_].removeMovieClip();
         delete cameras[_loc1_];
         cameras.splice(_loc1_,1);
      }
      _loc1_ = _loc1_ + 1;
   }
   panel.cameraDialog._visible = false;
   panel.cameraDialog.Delete.enabled = false;
   panel.cameraDialog.cbPan.enabled = false;
   cursorImage(lastTool);
   panelMode("draw");
   panel[lastTool + "B"].onPress();
   active = true;
   if(Lines != 0)
   {
      panel.playB.enabled = true;
      panel.playB._alpha = 100;
   }
};
panel.cameraDialog.Ok.onRelease = panel.cameraDialog.close.onRelease = function()
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
   if(panel.cameraDialog.cameraRef.cameraIc._currentframe != 3)
   {
      panel.cameraDialog.cameraRef.cameraIc.gotoAndStop(1 + panel.cameraDialog.cbPan.selected);
   }
   if(Lines != 0)
   {
      panel.playB.enabled = true;
      panel.playB._alpha = 100;
   }
   UpdateCameraTriggerIcon();
};
var oldScale;
var oldy;
var bufScale = 100;
registerInGrid = function(line)
{
   var _loc1_ = gridPos(line.x1,line.y1);
   var _loc13_ = gridPos(line.x2,line.y2);
   var _loc9_ = line.dx <= 0 ? _loc1_.x : _loc13_.x;
   var _loc7_ = line.dx <= 0 ? _loc13_.x : _loc1_.x;
   var _loc10_ = line.dy <= 0 ? _loc1_.y : _loc13_.y;
   var _loc8_ = line.dy <= 0 ? _loc13_.y : _loc1_.y;
   if(line.dx == 0 && line.dy == 0 || _loc1_.x == _loc13_.x && _loc1_.y == _loc13_.y)
   {
      register(line,_loc1_.x,_loc1_.y);
      return undefined;
   }
   register(line,_loc1_.x,_loc1_.y);
   var _loc4_ = line.x1;
   var _loc3_ = line.y1;
   var _loc11_ = 1 / line.dx;
   var _loc12_ = 1 / line.dy;
   var _loc5_;
   var _loc6_;
   while(true)
   {
      if(_loc1_.x < 0)
      {
         difX = line.dx <= 0 ? - GRIDSIZE - _loc1_.gx : GRIDSIZE + _loc1_.gx;
      }
      else
      {
         difX = line.dx <= 0 ? - (_loc1_.gx + 1) : GRIDSIZE - _loc1_.gx;
      }
      if(_loc1_.y < 0)
      {
         _loc5_ = line.dy <= 0 ? - GRIDSIZE - _loc1_.gy : GRIDSIZE + _loc1_.gy;
      }
      else
      {
         _loc5_ = line.dy <= 0 ? - (_loc1_.gy + 1) : GRIDSIZE - _loc1_.gy;
      }
      if(line.dx == 0)
      {
         _loc3_ += _loc5_;
      }
      else if(line.dy == 0)
      {
         _loc4_ += difX;
      }
      else
      {
         _loc6_ = _loc3_ + line.dy * difX * _loc11_;
         if(Math.abs(_loc6_ - _loc3_) < Math.abs(_loc5_))
         {
            _loc4_ += difX;
            _loc3_ = _loc6_;
         }
         else if(Math.abs(_loc6_ - _loc3_) == Math.abs(_loc5_))
         {
            _loc4_ += difX;
            _loc3_ += _loc5_;
         }
         else
         {
            _loc4_ += line.dx * _loc5_ * _loc12_;
            _loc3_ += _loc5_;
         }
      }
      _loc1_ = gridPos(_loc4_,_loc3_);
      if(!(_loc1_.x >= _loc7_ && _loc1_.x <= _loc9_ && _loc1_.y >= _loc8_ && _loc1_.y <= _loc10_))
      {
         return undefined;
      }
      register(line,_loc1_.x,_loc1_.y);
   }
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
tipRollOver = function(tipobj)
{
   if(tipobj.tiptext != undefined)
   {
      tooltip_mc.tip.text = tipobj.tiptext;
      tooltip_mc.wait = tipobj.tipwait;
      if(tooltip_mc.wait == undefined)
      {
         tooltip_mc.wait = 0;
         tipobj.tipwait = 1000;
      }
      tooltip_mc.xtip = tipobj.xtip;
      tooltip_mc.ytip = tipobj.ytip;
      tooltip_mc._visible = false;
      clearInterval(tooltipInterval);
      tooltipInterval = setInterval(showToolTip,tooltip_mc.wait);
   }
};
tipRollOut = function()
{
   clearInterval(tooltipInterval);
   tooltip_mc._visible = false;
   tooltip_mc.onEnterFrame = null;
};
tipReleaseOutside = tipRollOut;
myRollOver = function()
{
   active2 = false;
   cursor._visible = false;
   Mouse.show();
   tipRollOver(this);
};
myRollOut = function()
{
   active2 = true;
   cursorImage(cursorMode);
   tipRollOut();
};
myReleaseOutside = myRollOut;
panel.trackDialog.Cancel.onRelease = function()
{
   panel.trackDialog._visible = false;
   active2 = true;
   active = true;
   panel[lastTool + "B"].onPress();
   cursorImage(lastTool);
   panelMode("draw");
   if(Lines != 0)
   {
      panel.playB.enabled = true;
      panel.playB._alpha = 100;
   }
};
panel.trackDialog.Ok.onRelease = panel.trackDialog.close.onRelease = function()
{
   panel.trackDialog._visible = false;
   panel.camera0.showRider1 = panel.trackDialog.cbRider1.selected;
   panel.camera0.showRider2 = panel.trackDialog.cbRider2.selected;
   ridersInfo[0].type = panel.trackDialog.rider1._currentframe;
   riders2type = panel.trackDialog.rider2._currentframe % panel.trackDialog.rider2._totalframes;
   ridersInfo[1].type = riders2type;
   if(ridersInfo[1].type != ridersInfo[0].typeOld || ridersInfo[1].type != ridersInfo[1].typeOld)
   {
      cleanup();
      init();
      panel.flagB.onPress();
      for(var _loc1_ in ridersInfo)
      {
         ridersInfo[_loc1_].activateRider(ridersInfo[_loc1_].type != 0);
      }
   }
   updateCameraTeloBs();
   active2 = true;
   active = true;
   panel[lastTool + "B"].onPress();
   cursorImage(lastTool);
   panelMode("draw");
   if(Lines != 0)
   {
      panel.playB.enabled = true;
      panel.playB._alpha = 100;
   }
};
panel.trackDialog.rider1.onRelease = panel.trackDialog.rider2.onRelease = function()
{
   var _loc2_ = this._currentframe - 1;
   var _loc3_ = this._name != "rider1" ? panel.trackDialog.rider1._currentframe - 1 : panel.trackDialog.rider2._currentframe - 1;
   enabledRiderTypes[this._totalframes - 1] = this._name == "rider2";
   do
   {
      _loc2_ = (_loc2_ + 1) % this._totalframes;
   }
   while(_loc3_ == _loc2_ || !enabledRiderTypes[_loc2_]);
   
   this.gotoAndStop(1 + _loc2_);
   this.riderName._visible = false;
};
reset();
setInterval(blink,1000);
var nTrackCount = 0;
var nTrackNumber = 0;
if(!titleMovieMode)
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
}
var pickTrackInterval;
