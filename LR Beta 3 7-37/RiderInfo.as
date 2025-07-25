class RiderInfo
{
   var rworld;
   var dummy;
   var compas;
   var startPoint;
   var rscaleFactor;
   var type;
   var typeOld;
   var _x;
   var _y;
   var swapDepths;
   var help;
   var arrows;
   var active = false;
   function RiderInfo(_active, _world, _dummy, _compas, _startPoint, scaleFactor, _riderType)
   {
      this.active = _active;
      this.rworld = _world;
      this.dummy = _dummy;
      this.dummy._visible = false;
      this.compas = _compas;
      this.compas._visible = false;
      this.startPoint = _startPoint;
      this.startPoint._visible = false;
      this.startPoint.rscaleFactor = this.rscaleFactor = scaleFactor;
      this.startPoint.help._visible = false;
      this.startPoint.arrows._visible = false;
      this.setStartPointFunctions();
      this.type = _riderType;
      this.typeOld = -1;
   }
   function showStartPoint(bVisible)
   {
      this.startPoint._visible = bVisible;
      if(this.type != 0)
      {
         this.startPoint.gotoAndStop(this.type);
      }
   }
   function showStartPointHelp(bVisible)
   {
      this.startPoint.help._visible = bVisible;
   }
   function showStartPointArrows(bVisible)
   {
      this.startPoint.arrows._visible = bVisible;
   }
   function showDummy(bVisible)
   {
      this.dummy._visible = bVisible;
   }
   function showCompass(bVisible)
   {
      this.compas._visible = bVisible;
      if(this.type != 0)
      {
         this.compas.gotoAndStop(this.type);
      }
   }
   function pointToStartPoint()
   {
      _root.pointACompasToAStartPoint(this.startPoint,this.compas);
   }
   function activateRider(bActive)
   {
      this.active = bActive;
      if(_root.Lines != 0)
      {
         this.showCompass(bActive);
         this.showStartPoint(bActive);
      }
      if(_root.ridersInfo[1] == this)
      {
         if(this.active == false)
         {
            _root.ridersInfo[0].compas._x = Stage.width * 0.5;
            _root.ridersInfo[0].pointToStartPoint();
         }
         else
         {
            _root.ridersInfo[0].compas._x = Stage.width * 0.4;
            _root.ridersInfo[0].pointToStartPoint();
         }
      }
   }
   function setOnEvents(bFlag)
   {
      if(bFlag)
      {
         this.setStartPointFunctions();
      }
      else
      {
         this.startPoint.onPress = this.startPoint.onRelease = this.startPoint.onRollOver = this.startPoint.onRollOut = this.startPoint.onReleaseOutside = function()
         {
         };
      }
   }
   function setStartPointFunctions()
   {
      this.startPoint.onPress = function()
      {
         var _loc3_;
         if(_root.active)
         {
            if(Key.isDown(68))
            {
               if(Key.isDown(16))
               {
                  _loc3_ = _root.getFirstLine();
                  if(_loc3_ != undefined)
                  {
                     this._x = _loc3_.x1;
                     this._y = _loc3_.y1 - 50 * this.rscaleFactor;
                     if(_root.riders[1].startPoint == this)
                     {
                        this._y -= 60 * this.rscaleFactor;
                     }
                     this.pointToStartPoint();
                  }
               }
               else
               {
                  this.swapDepths(_root.tla.getNextHighestDepth());
                  startDrag(this,0);
                  this.help._visible = false;
                  this.arrows._visible = true;
                  _root.tooltip_mc.tip.text = "To restore position hold Shift+D and click the start point.";
               }
            }
            else
            {
               this.help._visible = false;
               this.arrows._visible = false;
               _root.openTrackDialog();
            }
         }
      };
      this.startPoint.onRelease = function()
      {
         function onMouseMove()
         {
         }
         this.arrows._visible = false;
      };
      this.startPoint.onRollOver = function()
      {
         if(_root.active)
         {
            this.help._visible = true;
            _root.active2 = false;
            _root.cursor._visible = false;
            Mouse.show();
            _root.tipRollOver(this);
         }
      };
      this.startPoint.onRollOut = function()
      {
         this.help._visible = false;
         _root.active2 = true;
         _root.cursorImage(_root.cursorMode);
         _root.tipRollOut();
      };
      this.startPoint.onReleaseOutside = function()
      {
         if(!Key.isDown(68))
         {
            this.arrows._visible = false;
            this.help._visible = false;
         }
      };
   }
}
