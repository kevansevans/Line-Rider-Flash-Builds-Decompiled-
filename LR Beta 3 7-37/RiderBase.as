class RiderBase
{
   var tlaref;
   var rworld;
   var rdummy;
   var rcompas;
   var rstartPoint;
   var rscaleFactor;
   var riding;
   var crash;
   var prevX;
   var prevY;
   var velocityX;
   var velocityY;
   var type;
   var edges;
   var dots;
   var headRadiusScaledDown;
   var canDismember;
   var scarfColor;
   var scarfColor2;
   var braidColor;
   var invHeadCircumfScaledDown;
   var brokenArm1;
   var brokenArm2;
   var brokenLeg1;
   var brokenLeg2;
   var dots2;
   var dotsBraid;
   var edges2;
   var edgesBraid;
   var sbrokenArm1;
   var sbrokenArm2;
   var sbrokenLeg1;
   var sbrokenLeg2;
   var sheadRot;
   var sbrokenNeck;
   var active = false;
   var BLINK_RATE = 0.428571;
   var TO_DEG = 57.29578;
   var bInitialized = false;
   function RiderBase(_active, _tlaref, _world, _dummy, _compas, _startPoint, scaleFactor, dBase, d2Base, dbBase, eBase, e2Base, ebBase, _riderType, _riderBref)
   {
      this.active = _active;
      this.tlaref = _tlaref;
      this.rworld = _world;
      this.rdummy = _dummy;
      this.rdummy._visible = false;
      this.rcompas = _compas;
      this.rcompas._visible = false;
      this.rstartPoint = _startPoint;
      this.rstartPoint._visible = false;
      this.rstartPoint.rscaleFactor = this.rscaleFactor = scaleFactor;
      this.riding = false;
      this.crash = false;
      this.setRiderType(_riderType);
      this.prevX = this.rworld.worldsled.sled._x;
      this.prevY = this.rworld.worldsled.sled._y;
      this.velocityX = 0;
      this.velocityY = 0;
      this.rworld.worldsled.sled._xscale = this.rworld.worldsled.sled._yscale = this.rworld.body._xscale = this.rworld.body._yscale = this.rworld.worldarmL.arm._xscale = this.rworld.worldarmL.arm._yscale = this.rworld.worldarmR.arm._xscale = this.rworld.worldarmR.arm._yscale = this.rworld.worldlegL.leg._xscale = this.rworld.worldlegL.leg._yscale = this.rworld.worldlegR.leg._xscale = this.rworld.worldlegR.leg._yscale = this.rscaleFactor * 100;
      this.rdummy.sanke._xscale = this.rdummy.sanke._yscale = this.rdummy.sankac._xscale = this.rdummy.sankac._yscale = this.rdummy.roka1._xscale = this.rdummy.roka1._yscale = this.rdummy.roka2._xscale = this.rdummy.roka2._yscale = this.rdummy.noga1._xscale = this.rdummy.noga1._yscale = this.rdummy.noga2._xscale = this.rdummy.noga2._yscale = this.rscaleFactor * 100;
      this.rworld.worldhead.head._xscale = this.rworld.worldhead.head._yscale = this.rscaleFactor * 100;
      this.rstartPoint.help._visible = false;
      this.rstartPoint.arrows._visible = false;
      this.initDots();
      this.initEdges();
   }
   function setRiderType(_riderType, bIsSimulation)
   {
      this.type = _riderType;
      this.edges[11].a = this.dots[5];
      this.edges[11].satisfyDistance();
      this.edges[12].a = this.dots[5];
      this.edges[12].satisfyDistance();
      this.edges[13].a = this.dots[4];
      this.edges[13].satisfyDistance();
      this.edges[14].a = this.dots[4];
      this.edges[14].satisfyDistance();
      this.edges[15].a = this.dots[5];
      this.edges[15].satisfyDistance();
      this.edges[23].broken = false;
      this.rworld.worldsled.sled.gotoAndStop(1);
      this.rworld.body.gotoAndStop(this.type);
      this.rworld.worldarmL.arm.gotoAndStop(this.type);
      this.rworld.worldarmR.arm.gotoAndStop(this.type);
      this.rworld.worldlegL.leg.gotoAndStop(this.type);
      this.rworld.worldlegR.leg.gotoAndStop(this.type);
      this.rworld.worldhead.head.gotoAndStop(this.type);
      this.rdummy.sanke.gotoAndStop(1);
      this.rdummy.sankac.body.gotoAndStop(this.type);
      this.rdummy.sankac.scarfetc.gotoAndStop(this.type);
      this.rdummy.sankac.head.gotoAndStop(this.type);
      this.rdummy.roka1.gotoAndStop(this.type);
      this.rdummy.roka2.gotoAndStop(this.type);
      this.rdummy.noga1.gotoAndStop(this.type);
      this.rdummy.noga2.gotoAndStop(this.type);
      this.headRadiusScaledDown = 0;
      this.canDismember = false;
      this.rworld.worldhead.head._visible = false;
      switch(this.type)
      {
         case 1:
            this.scarfColor = 16777215;
            this.scarfColor2 = 13763074;
            this.braidColor = 0;
            break;
         case 2:
            this.scarfColor = 14252006;
            this.scarfColor2 = 16764159;
            this.braidColor = 0;
            break;
         case 3:
            this.scarfColor = 16777215;
            this.scarfColor2 = 1081344;
            this.braidColor = 0;
            break;
         case 4:
            this.scarfColor = 6679807;
            this.scarfColor2 = 16501987;
            this.braidColor = 0;
            break;
         case 5:
            this.scarfColor = 6723840;
            this.scarfColor2 = 6710835;
            this.braidColor = 0;
            this.headRadiusScaledDown = 6 * this.rscaleFactor;
            this.invHeadCircumfScaledDown = 1 / (6.283185 * this.headRadiusScaledDown);
            this.canDismember = true;
            this.rworld.worldhead.head._visible = true;
            break;
         case 6:
            this.scarfColor = 16777215;
            this.scarfColor2 = 16711680;
            this.braidColor = 0;
            this.headRadiusScaledDown = 6 * this.rscaleFactor;
            this.invHeadCircumfScaledDown = 1 / (6.283185 * this.headRadiusScaledDown);
            this.canDismember = true;
            this.rworld.worldhead.head._visible = true;
            break;
         default:
            this.scarfColor = 16777215;
            this.scarfColor2 = 13763074;
            this.braidColor = 0;
      }
   }
   function BreakLimb(limb, bRestore)
   {
      var _loc2_;
      var _loc3_;
      var _loc5_;
      var _loc6_ = -1;
      var _loc9_ = 10;
      var _loc4_ = 1;
      switch(limb)
      {
         case "arm1":
            this.brokenArm1 = true;
            _loc2_ = 13;
            _loc3_ = 5;
            _loc5_ = 12;
            _loc6_ = 15;
            _loc4_ *= -1;
            break;
         case "arm2":
            this.brokenArm2 = true;
            _loc2_ = 11;
            _loc3_ = 5;
            _loc5_ = 11;
            break;
         case "leg1":
            this.brokenLeg1 = true;
            _loc2_ = 10;
            _loc3_ = 4;
            _loc5_ = 13;
            break;
         case "leg2":
            this.brokenLeg2 = true;
            _loc2_ = 12;
            _loc3_ = 4;
            _loc5_ = 14;
            _loc4_ *= -1;
      }
      this.dots[_loc2_].active = true;
      var _loc7_;
      var _loc8_;
      if(!bRestore)
      {
         this.dots[_loc2_].x = this.dots[_loc3_].x;
         this.dots[_loc2_].y = this.dots[_loc3_].y;
         _loc7_ = this.dots[_loc3_].dx;
         _loc8_ = this.dots[_loc3_].dy;
         this.dots[_loc2_].vx = this.dots[_loc3_].x + _loc7_ * _loc4_;
         this.dots[_loc2_].vy = this.dots[_loc3_].y + Math.abs(_loc8_);
      }
      this.edges[_loc5_].a = this.dots[_loc2_];
      if(_loc6_ != -1)
      {
         this.edges[_loc6_].a = this.dots[_loc2_];
      }
   }
   function activateDots()
   {
      for(var _loc2_ in this.dots)
      {
         if(_loc2_ >= 10 && _loc2_ <= 13 || _loc2_ == 14 && this.type != 5 && this.type != 6)
         {
            this.dots[_loc2_].active = false;
         }
         else
         {
            this.dots[_loc2_].active = this.active;
         }
      }
      for(_loc2_ in this.dots2)
      {
         this.dots2[_loc2_].active = this.active;
      }
      for(_loc2_ in this.dotsBraid)
      {
         this.dotsBraid[_loc2_].active = this.active;
      }
   }
   function showBurek()
   {
      this.rdummy._visible = true;
      this.rdummy._x = this.rworld._x - this.tlaref._x;
      this.rdummy._y = this.rworld._y - this.tlaref._y;
      this.rdummy.sankac._x = this.rworld.body._x;
      this.rdummy.sankac._y = this.rworld.body._y;
      this.rdummy.sankac._rotation = this.rworld.body._rotation;
      this.rdummy.roka1._x = this.rworld.worldarmL.arm._x;
      this.rdummy.roka1._y = this.rworld.worldarmL.arm._y;
      this.rdummy.roka1._rotation = this.rworld.worldarmL.arm._rotation;
      this.rdummy.roka2._x = this.rworld.worldarmR.arm._x;
      this.rdummy.roka2._y = this.rworld.worldarmR.arm._y;
      this.rdummy.roka2._rotation = this.rworld.worldarmR.arm._rotation;
      this.rdummy.noga1._x = this.rworld.worldlegL.leg._x;
      this.rdummy.noga1._y = this.rworld.worldlegL.leg._y;
      this.rdummy.noga1._rotation = this.rworld.worldlegL.leg._rotation;
      this.rdummy.noga2._x = this.rworld.worldlegR.leg._x;
      this.rdummy.noga2._y = this.rworld.worldlegR.leg._y;
      this.rdummy.noga2._rotation = this.rworld.worldlegR.leg._rotation;
      this.rdummy.sanke._x = this.rworld.worldsled.sled._x;
      this.rdummy.sanke._y = this.rworld.worldsled.sled._y;
      this.rdummy.sanke._rotation = this.rworld.worldsled.sled._rotation;
      this.rdummy.sanke._yscale = this.rworld.worldsled.sled._yscale;
      this.rdummy.sanke.gotoAndStop(this.rworld.worldsled.sled._currentframe);
      this.rdummy.sankac.face.gotoAndStop(this.rworld.body.face._currentframe);
      if(!this.brokenArm1)
      {
      }
   }
   function blink()
   {
      if(Math.random() < this.BLINK_RATE)
      {
         this.rworld.body.face.uch1.play();
         this.rworld.body.face.uch2.play();
      }
   }
   function scaleRider(newScale, newX, newY)
   {
      var _loc2_ = this.tlaref._xscale;
      this.rworld.worldlegL._xscale = this.rworld.worldlegL._yscale = this.rworld.worldlegR._xscale = this.rworld.worldlegR._yscale = this.rworld.worldarmL._xscale = this.rworld.worldarmL._yscale = this.rworld.worldarmR._xscale = this.rworld.worldarmR._yscale = this.rworld.worldsled._xscale = this.rworld.worldsled._yscale = this.rworld.worldhead._xscale = this.rworld.worldhead._yscale = this.rworld._xscale = this.rworld._yscale = newScale;
      this.translateRider(newX,newY);
   }
   function translateRider(newX, newY)
   {
      this.rworld.worldlegL._x = this.rworld.worldlegR._x = this.rworld.worldarmL._x = this.rworld.worldarmR._x = this.rworld.worldsled._x = this.rworld.worldhead._x = this.rworld._x = newX;
      this.rworld.worldlegL._y = this.rworld.worldlegR._y = this.rworld.worldarmL._y = this.rworld.worldarmR._y = this.rworld.worldsled._y = this.rworld.worldhead._y = this.rworld._y = newY;
   }
   function showRider(bVisible)
   {
      this.rworld.worldlegL._visible = this.rworld.worldlegR._visible = this.rworld.worldarmL._visible = this.rworld.worldarmR._visible = this.rworld.worldsled._visible = this.rworld.worldhead._visible = this.rworld._visible = this.rworld._visible = bVisible;
   }
   function updateVelocity()
   {
      this.velocityX = this.rworld.body._x - this.prevX;
      this.velocityY = this.rworld.body._y - this.prevY;
      this.prevX = this.rworld.body._x;
      this.prevY = this.rworld.body._y;
   }
   function bRiderIsGirl()
   {
      switch(this.type)
      {
         case 2:
         case 4:
            return true;
         default:
            return false;
      }
   }
   function initDotsHuman()
   {
      var _loc3_ = _root.AIR_FRICTION;
      this.dots = [];
      this.dots2 = [];
      this.dots[0] = new Point(0,0,0.8);
      this.dots[1] = new Point(0,10,0);
      this.dots[2] = new Point(30,10,0);
      this.dots[3] = new Point(35,0,0);
      this.dots[4] = new Point(10,0,0.8);
      this.dots[5] = new Point(10,-11,0.8);
      this.dots[6] = new Point(23,-10,0.1,true);
      this.dots[7] = new Point(23,-10,0.1);
      this.dots[8] = new Point(20,10,0);
      this.dots[9] = new Point(20,10,0);
      this.dots2[0] = new PointAirFri(7,-10,_loc3_);
      this.dots2[1] = new PointAirFri(3,-10,_loc3_);
      this.dots2[2] = new PointAirFri(0,-10,_loc3_);
      this.dots2[3] = new PointAirFri(-4,-10,_loc3_);
      this.dots2[4] = new PointAirFri(-7,-10,_loc3_);
      this.dots2[5] = new PointAirFri(-11,-10,_loc3_);
      for(var _loc4_ in this.dots)
      {
         this.dots[_loc4_].x *= this.rscaleFactor;
         this.dots[_loc4_].y *= this.rscaleFactor;
      }
      for(_loc4_ in this.dots2)
      {
         this.dots2[_loc4_].x *= this.rscaleFactor;
         this.dots2[_loc4_].y *= this.rscaleFactor;
      }
   }
   function initEdgesHuman()
   {
      var _loc3_ = _root.ENDURANCE;
      this.edges = [];
      this.edges2 = [];
      this.edges[0] = new Stick(this.dots[0],this.dots[1]);
      this.edges[1] = new Stick(this.dots[1],this.dots[2]);
      this.edges[2] = new Stick(this.dots[2],this.dots[3]);
      this.edges[3] = new Stick(this.dots[3],this.dots[0]);
      this.edges[4] = new Stick(this.dots[0],this.dots[2]);
      this.edges[5] = new Stick(this.dots[3],this.dots[1]);
      this.edges[6] = new BindStick(this.dots[0],this.dots[4],_loc3_,this);
      this.edges[8] = new BindStick(this.dots[1],this.dots[4],_loc3_,this);
      this.edges[9] = new BindStick(this.dots[2],this.dots[4],_loc3_,this);
      this.edges[10] = new Stick(this.dots[5],this.dots[4]);
      this.edges[11] = new Stick(this.dots[5],this.dots[6]);
      this.edges[12] = new Stick(this.dots[5],this.dots[7]);
      this.edges[13] = new Stick(this.dots[4],this.dots[8]);
      this.edges[14] = new Stick(this.dots[4],this.dots[9]);
      this.edges[15] = new Stick(this.dots[5],this.dots[7]);
      this.edges[16] = new BindStick(this.dots[5],this.dots[0],_loc3_,this);
      this.edges[17] = new BindStick(this.dots[3],this.dots[6],_loc3_,this);
      this.edges[18] = new BindStick(this.dots[3],this.dots[7],_loc3_,this);
      this.edges[19] = new BindStick(this.dots[8],this.dots[2],_loc3_,this);
      this.edges[20] = new BindStick(this.dots[9],this.dots[2],_loc3_,this);
      this.edges[21] = new RepellStick(this.dots[5],this.dots[8]);
      this.edges[22] = new RepellStick(this.dots[5],this.dots[9]);
      this.edges[21].restLength *= 0.5;
      this.edges[22].restLength *= 0.5;
      this.edges2[0] = new Shal(this.dots[5],this.dots2[0]);
      this.edges2[1] = new Shal(this.dots2[0],this.dots2[1]);
      this.edges2[2] = new Shal(this.dots2[1],this.dots2[2]);
      this.edges2[3] = new Shal(this.dots2[2],this.dots2[3]);
      this.edges2[4] = new Shal(this.dots2[3],this.dots2[4]);
      this.edges2[5] = new Shal(this.dots2[4],this.dots2[5]);
   }
   function initDotsBoy()
   {
      this.initDotsHuman();
   }
   function initEdgesBoy()
   {
      this.initEdgesHuman();
   }
   function initDotsGirl()
   {
      this.initDotsHuman();
      var _loc4_ = _root.BraidX;
      var _loc5_ = _root.BraidY;
      var _loc8_ = _root.HeadTopX;
      var _loc9_ = _root.HeadTopY;
      var _loc6_ = _root.BraidDX;
      var _loc10_ = _root.BraidDY;
      var _loc3_ = _root.AIR_FRICTION;
      this.dotsBraid = [];
      this.dotsBraid[0] = new PointAirFri(_loc4_,_loc5_,_loc3_);
      this.dotsBraid[1] = new PointAirFri(_loc8_,_loc9_,_loc3_);
      this.dotsBraid[2] = new PointAirFri(_loc4_ - 1 * _loc6_,_loc5_,_loc3_ + 0.05);
      this.dotsBraid[3] = new PointAirFri(_loc4_ - 2 * _loc6_,_loc5_,_loc3_ + 0.05);
      this.dotsBraid[4] = new PointAirFri(_loc4_ - 3 * _loc6_,_loc5_,_loc3_ + 0.05);
      this.dotsBraid[5] = new PointAirFri(_loc4_ - 4 * _loc6_,_loc5_,_loc3_ + 0.05);
      this.dotsBraid[6] = new PointAirFri(_loc4_ - 5 * _loc6_,_loc5_,_loc3_ + 0.05);
      this.dotsBraid[7] = new PointAirFri(_loc4_ - 6 * _loc6_,_loc5_,_loc3_ * 1.1 + 0.05);
      this.dotsBraid[8] = new PointAirFri(_loc4_ - 6 * _loc6_,_loc5_,_loc3_ + 0.05);
      this.dotsBraid[9] = new PointAirFri(_loc4_ - 6 * _loc6_,_loc5_,_loc3_ * 0.85 + 0.05);
      for(var _loc7_ in this.dotsBraid)
      {
         this.dotsBraid[_loc7_].x *= this.rscaleFactor;
         this.dotsBraid[_loc7_].y *= this.rscaleFactor;
      }
   }
   function initEdgesGirl()
   {
      this.initEdgesHuman();
      var _loc3_ = _root.degreesLimitBraid;
      this.edgesBraid[0] = new StickPerp(this.dots[4],this.dots[5],this.dotsBraid[0],1);
      this.edgesBraid[1] = new StickPerp(this.dots[4],this.dots[5],this.dotsBraid[1],1);
      this.edgesBraid[2] = new ShalAngle(this.dotsBraid[1],this.dotsBraid[0],this.dotsBraid[2],_loc3_,0.8,this.braidColor);
      this.edgesBraid[3] = new ShalAngle(this.dotsBraid[0],this.dotsBraid[2],this.dotsBraid[3],_loc3_,0.7,this.braidColor);
      this.edgesBraid[4] = new ShalAngle(this.dotsBraid[2],this.dotsBraid[3],this.dotsBraid[4],_loc3_,0.6,this.braidColor);
      this.edgesBraid[5] = new ShalAngle(this.dotsBraid[3],this.dotsBraid[4],this.dotsBraid[5],_loc3_,0.5,this.braidColor);
      this.edgesBraid[6] = new ShalAngle(this.dotsBraid[4],this.dotsBraid[5],this.dotsBraid[6],_loc3_,0.4,this.scarfColor2);
      this.edgesBraid[7] = new Shal(this.dotsBraid[6],this.dotsBraid[7]);
      this.edgesBraid[8] = new Shal(this.dotsBraid[6],this.dotsBraid[8]);
      this.edgesBraid[9] = new Shal(this.dotsBraid[6],this.dotsBraid[9]);
   }
   function initDotsScarecrow()
   {
      this.initDotsHuman();
      var _loc4_ = _root.ShoulderX;
      var _loc3_ = _root.ShoulderY;
      var _loc5_ = _root.HeadTopX;
      var _loc6_ = _root.HeadTopY;
      this.dots[10] = new Point(10,-11,0.1);
      this.dots[10].active = false;
      this.dots[11] = new Point(10,-11,0.1);
      this.dots[11].active = false;
      this.dots[12] = new Point(10,-11,0.1);
      this.dots[12].active = false;
      this.dots[13] = new Point(10,-11,0.1);
      this.dots[13].active = false;
      this.dots[14] = new Point(_root.PumpkinX,_root.PumpkinY,0.05);
      this.dots[14].radius = this.headRadiusScaledDown;
      this.dots[14].x *= this.rscaleFactor;
      this.dots[14].y *= this.rscaleFactor;
   }
   function initEdgesScarecrow()
   {
      this.initEdgesHuman();
      var _loc2_ = 0.261799;
      this.edges[23] = new ShalAngleBreakable(this.dots[4],this.dots[5],this.dots[14],_loc2_);
   }
   function initDots()
   {
      this.crash = false;
      switch(this.type)
      {
         case 2:
         case 4:
            this.initDotsGirl();
            break;
         case 5:
            this.initDotsScarecrow();
            break;
         case 6:
            this.initDotsScarecrow();
            this.dots[14].friction = 0.15;
            break;
         default:
            this.initDotsBoy();
      }
      this.rworld.worldsled.sled.gotoAndStop(1);
      var _loc0_;
      this.rworld.worldlegR.leg._yscale = _loc0_ = this.rscaleFactor * 100;
      this.rworld.worldlegR.leg._xscale = _loc0_;
      this.rworld.worldlegL.leg._yscale = _loc0_;
      this.rworld.worldlegL.leg._xscale = _loc0_;
      this.rworld.worldarmR.arm._yscale = _loc0_;
      this.rworld.worldarmR.arm._xscale = _loc0_;
      this.rworld.worldarmL.arm._yscale = _loc0_;
      this.rworld.worldarmL.arm._xscale = _loc0_;
      this.rworld.body._yscale = _loc0_;
      this.rworld.body._xscale = _loc0_;
      this.rworld.worldsled.sled._yscale = _loc0_;
      this.rworld.worldsled.sled._xscale = _loc0_;
   }
   function initEdges()
   {
      switch(this.type)
      {
         case 2:
         case 4:
            this.initEdgesGirl();
            break;
         case 5:
         case 6:
            this.initEdgesScarecrow();
            break;
         default:
            this.initEdgesBoy();
      }
   }
   function reset()
   {
      switch(this.type)
      {
         case 2:
         case 4:
            this.resetPositionGirl();
            break;
         case 5:
         case 6:
            this.resetPositionScarecrow();
            break;
         default:
            this.resetPositionBoy();
      }
      this.activateDots();
   }
   function resetPositionHuman()
   {
      this.dots[0].x = 0;
      this.dots[0].y = 0;
      this.dots[1].x = 0;
      this.dots[1].y = 10;
      this.dots[2].x = 30;
      this.dots[2].y = 10;
      this.dots[3].x = 35;
      this.dots[3].y = 0;
      this.dots[4].x = 10;
      this.dots[4].y = 0;
      this.dots[5].x = 10;
      this.dots[5].y = -11;
      this.dots[6].x = 23;
      this.dots[6].y = -10;
      this.dots[7].x = 23;
      this.dots[7].y = -10;
      this.dots[8].x = 20;
      this.dots[8].y = 10;
      this.dots[9].x = 20;
      this.dots[9].y = 10;
      this.dots2[0].x = 7;
      this.dots2[0].y = -10;
      this.dots2[1].x = 3;
      this.dots2[1].y = -10;
      this.dots2[2].x = 0;
      this.dots2[2].y = -10;
      this.dots2[3].x = -4;
      this.dots2[3].y = -10;
      this.dots2[4].x = -7;
      this.dots2[4].y = -10;
      this.dots2[5].x = -11;
      this.dots2[5].y = -10;
      for(var _loc2_ in this.dots)
      {
         this.dots[_loc2_].x *= this.rscaleFactor;
         this.dots[_loc2_].y *= this.rscaleFactor;
      }
      for(_loc2_ in this.dots2)
      {
         this.dots2[_loc2_].x *= this.rscaleFactor;
         this.dots2[_loc2_].y *= this.rscaleFactor;
      }
   }
   function resetPositionGirl()
   {
      this.resetPositionHuman();
      var _loc3_ = _root.BraidX;
      var _loc4_ = _root.BraidY;
      var _loc7_ = _root.HeadTopX;
      var _loc8_ = _root.HeadTopY;
      var _loc5_ = _root.BraidDX;
      var _loc9_ = _root.BraidDY;
      this.dotsBraid[0].x = _loc3_;
      this.dotsBraid[0].y = _loc4_;
      this.dotsBraid[1].x = _loc7_;
      this.dotsBraid[1].y = _loc8_;
      this.dotsBraid[2].x = _loc3_ - 1 * _loc5_;
      this.dotsBraid[2].y = _loc4_;
      this.dotsBraid[3].x = _loc3_ - 2 * _loc5_;
      this.dotsBraid[3].y = _loc4_;
      this.dotsBraid[4].x = _loc3_ - 3 * _loc5_;
      this.dotsBraid[4].y = _loc4_;
      this.dotsBraid[5].x = _loc3_ - 4 * _loc5_;
      this.dotsBraid[5].y = _loc4_;
      this.dotsBraid[6].x = _loc3_ - 5 * _loc5_;
      this.dotsBraid[6].y = _loc4_;
      this.dotsBraid[7].x = _loc3_ - 6 * _loc5_;
      this.dotsBraid[7].y = _loc4_;
      for(var _loc6_ in this.dotsBraid)
      {
         this.dotsBraid[_loc6_].x *= this.rscaleFactor;
         this.dotsBraid[_loc6_].y *= this.rscaleFactor;
      }
   }
   function resetPositionBoy()
   {
      this.resetPositionHuman();
   }
   function resetPositionScarecrow()
   {
      this.resetPositionHuman();
      this.dots[14].x = _root.PumpkinX * this.rscaleFactor;
      this.dots[14].y = _root.PumpkinY * this.rscaleFactor;
      this.edges[11].a = this.dots[5];
      this.edges[11].satisfyDistance();
      this.edges[12].a = this.dots[5];
      this.edges[12].satisfyDistance();
      this.edges[13].a = this.dots[4];
      this.edges[13].satisfyDistance();
      this.edges[14].a = this.dots[4];
      this.edges[14].satisfyDistance();
      this.edges[15].a = this.dots[5];
      this.edges[15].satisfyDistance();
      this.edges[23].broken = false;
   }
   function setCrash(bFlag, bSimulation)
   {
      if(this.canDismember)
      {
         if(bFlag && !this.crash)
         {
            this.setRiderType(this.type,bSimulation);
            this.BreakLimb("arm1",false);
            this.BreakLimb("arm2",false);
            this.BreakLimb("leg1",false);
            this.BreakLimb("leg2",false);
            this.edges[23].broken = true;
            if(this.type == 5)
            {
               this.rworld.worldlegL.leg.scarecrow.gotoAndStop(2);
               this.rworld.worldlegR.leg.scarecrow.gotoAndStop(2);
               this.rworld.worldarmL.arm.scarecrow.gotoAndStop(2);
               this.rworld.worldarmR.arm.scarecrow.gotoAndStop(2);
               this.rworld.body.scarecrow.gotoAndStop(2);
            }
         }
         else if(!bFlag)
         {
            this.setRiderType(this.type,bSimulation);
            this.brokenArm1 = false;
            this.brokenArm2 = false;
            this.brokenLeg1 = false;
            this.brokenLeg2 = false;
            if(this.type == 5)
            {
               this.rworld.worldlegL.leg.scarecrow.gotoAndStop(1);
               this.rworld.worldlegR.leg.scarecrow.gotoAndStop(1);
               this.rworld.worldarmL.arm.scarecrow.gotoAndStop(1);
               this.rworld.worldarmR.arm.scarecrow.gotoAndStop(1);
               this.rworld.body.scarecrow.gotoAndStop(1);
            }
         }
      }
      this.crash = bFlag;
   }
   function save()
   {
      for(var _loc3_ in this.dots)
      {
         this.dots[_loc3_].savePoint();
      }
      for(var _loc2_ in this.dots2)
      {
         this.dots2[_loc2_].savePoint();
      }
      for(_loc2_ in this.dotsBraid)
      {
         this.dotsBraid[_loc2_].savePoint();
      }
      this.sbrokenArm1 = this.brokenArm1;
      this.sbrokenArm2 = this.brokenArm2;
      this.sbrokenLeg1 = this.brokenLeg1;
      this.sbrokenLeg2 = this.brokenLeg2;
      this.sheadRot = this.rworld.worldhead.head._rotation;
      if(this.canDismember)
      {
         this.sbrokenNeck = this.edges[23].broken;
      }
   }
   function restore()
   {
      for(var _loc3_ in this.dots)
      {
         this.dots[_loc3_].restore();
      }
      for(var _loc2_ in this.dots2)
      {
         this.dots2[_loc2_].restore();
      }
      for(_loc2_ in this.dotsBraid)
      {
         this.dotsBraid[_loc2_].restore();
      }
      this.brokenArm1 = this.sbrokenArm1;
      this.brokenArm2 = this.sbrokenArm2;
      this.brokenLeg1 = this.sbrokenLeg1;
      this.brokenLeg2 = this.sbrokenLeg2;
      if(this.sbrokenArm1)
      {
         this.BreakLimb("arm1",true);
      }
      if(this.sbrokenArm2)
      {
         this.BreakLimb("arm2",true);
      }
      if(this.sbrokenLeg1)
      {
         this.BreakLimb("leg1",true);
      }
      if(this.sbrokenLeg2)
      {
         this.BreakLimb("leg2",true);
      }
      if(this.canDismember)
      {
         this.edges[23].broken = this.sbrokenNeck;
      }
      this.rworld.worldhead.head._rotation = this.sheadRot;
   }
   function render()
   {
      var _loc3_ = false;
      var _loc4_ = 0.5;
      this.rworld.worldarmL.clear();
      this.rworld.worldarmL.lineStyle(4 * _loc4_ * this.tlaref._xscale / 100,this.scarfColor,100,false,"none","none");
      this.edges2[0].render(this.rworld.worldarmL,_loc3_);
      this.edges2[2].render(this.rworld.worldarmL,_loc3_);
      this.edges2[4].render(this.rworld.worldarmL,_loc3_);
      this.rworld.worldarmL.lineStyle(4 * _loc4_ * this.tlaref._xscale / 100,this.scarfColor2,100,false,"none","none");
      this.edges2[1].render(this.rworld.worldarmL,_loc3_);
      this.edges2[3].render(this.rworld.worldarmL,_loc3_);
      this.edges2[5].render(this.rworld.worldarmL,_loc3_);
      this.rworld.clear();
      this.rworld.lineStyle(1 * _loc4_,0,100);
      if(!this.crash)
      {
         this.rworld.lineStyle(1 * _loc4_,0,100);
         this.edges[17].render(this.rworld,_loc3_);
         this.edges[18].render(this.rworld,_loc3_);
      }
      else if(this.rworld.body.face._currentframe != 14 && !this.bRiderIsGirl())
      {
         this.rworld.body.face.play();
      }
      if(this.bRiderIsGirl())
      {
         this.rworld.lineStyle(0.25 * _loc4_ * this.rworld._xscale / 100,this.braidColor,100,false,"none","none");
         this.edgesBraid[2].render(this.rworld,_loc3_);
         this.edgesBraid[3].render(this.rworld,_loc3_);
         this.edgesBraid[4].render(this.rworld,_loc3_);
         this.edgesBraid[5].render(this.rworld,_loc3_);
         this.rworld.lineStyle(1 * _loc4_ * this.rworld._xscale / 100,this.braidColor,100,false,"none","none");
         this.edgesBraid[7].render(this.rworld,_loc3_);
         this.edgesBraid[8].render(this.rworld,_loc3_);
         this.edgesBraid[9].render(this.rworld,_loc3_);
         this.rworld.lineStyle(0.5 * _loc4_ * this.rworld._xscale / 100,this.scarfColor2,100,false,"none","none");
         this.edgesBraid[6].render(this.rworld,_loc3_);
      }
      this.rworld.worldsled.sled._x = this.dots[0].x;
      this.rworld.worldsled.sled._y = this.dots[0].y;
      this.rworld.body._x = this.dots[4].x;
      this.rworld.body._y = this.dots[4].y;
      this.rworld.worldhead.head._x = this.dots[0].x;
      this.rworld.worldhead.head._y = this.dots[0].y;
      if(!this.canDismember)
      {
         this.rworld.worldarmL.arm._x = this.rworld.worldarmR.arm._x = this.dots[5].x;
         this.rworld.worldarmL.arm._y = this.rworld.worldarmR.arm._y = this.dots[5].y;
         this.rworld.worldlegL.leg._x = this.rworld.worldlegR.leg._x = this.dots[4].x;
         this.rworld.worldlegL.leg._y = this.rworld.worldlegR.leg._y = this.dots[4].y;
      }
      else if(!this.crash)
      {
         this.rworld.worldhead.head._x = this.dots[14].x;
         this.rworld.worldhead.head._y = this.dots[14].y;
         this.rworld.worldarmL.arm._x = this.rworld.worldarmR.arm._x = this.dots[5].x;
         this.rworld.worldarmL.arm._y = this.rworld.worldarmR.arm._y = this.dots[5].y;
         this.rworld.worldlegL.leg._x = this.rworld.worldlegR.leg._x = this.dots[4].x;
         this.rworld.worldlegL.leg._y = this.rworld.worldlegR.leg._y = this.dots[4].y;
      }
      else
      {
         this.rworld.worldhead.head._x = this.dots[14].x;
         this.rworld.worldhead.head._y = this.dots[14].y;
         this.rworld.worldarmL.arm._x = this.dots[13].x;
         this.rworld.worldarmL.arm._y = this.dots[13].y;
         this.rworld.worldlegL.leg._x = this.dots[10].x;
         this.rworld.worldlegL.leg._y = this.dots[10].y;
         this.rworld.worldarmR.arm._x = this.dots[11].x;
         this.rworld.worldarmR.arm._y = this.dots[11].y;
         this.rworld.worldlegR.leg._x = this.dots[12].x;
         this.rworld.worldlegR.leg._y = this.dots[12].y;
      }
      var _loc5_ = this.dots[3].x - this.dots[0].x;
      var _loc6_ = this.dots[3].y - this.dots[0].y;
      if(_loc5_ * (this.dots[1].y - this.dots[0].y) - _loc6_ * (this.dots[1].x - this.dots[0].x) < 0)
      {
         if(this.rworld.worldsled.sled._yscale != (- _loc4_) * 100)
         {
            this.rworld.worldsled.sled._yscale = (- _loc4_) * 100;
            this.rworld.worldsled.sled.gotoAndStop(2);
            this.setCrash(true,_root.simulation);
         }
      }
      else if(this.rworld.worldsled.sled._yscale != _loc4_ * 100)
      {
         this.rworld.worldsled.sled._yscale = _loc4_ * 100;
      }
      if(_loc5_ * (this.dots[5].y - this.dots[4].y) - _loc6_ * (this.dots[5].x - this.dots[4].x) > 0)
      {
         this.setCrash(true,_root.simulation);
      }
      this.rworld.worldsled.sled._rotation = Math.atan2(_loc6_,_loc5_) * this.TO_DEG;
      if(this.headRadiusScaledDown > 0)
      {
         if(this.edges[23].broken)
         {
            this.rworld.worldhead.head._rotation += (this.dots[14].x - this.dots[14].vx) * this.invHeadCircumfScaledDown * 360;
         }
         else
         {
            this.rworld.worldhead.head._rotation = Math.atan2(this.dots[14].y - this.dots[5].y,this.dots[14].x - this.dots[5].x) * this.TO_DEG;
         }
      }
      if(this.canDismember && this.crash)
      {
         this.rworld.worldlegL.leg._rotation = Math.atan2(this.dots[8].y - this.dots[10].y,this.dots[8].x - this.dots[10].x) * this.TO_DEG;
         this.rworld.worldarmL.arm._rotation = Math.atan2(this.dots[7].y - this.dots[13].y,this.dots[7].x - this.dots[13].x) * this.TO_DEG;
         this.rworld.worldlegR.leg._rotation = Math.atan2(this.dots[9].y - this.dots[12].y,this.dots[9].x - this.dots[12].x) * this.TO_DEG;
         this.rworld.worldarmR.arm._rotation = Math.atan2(this.dots[6].y - this.dots[11].y,this.dots[6].x - this.dots[11].x) * this.TO_DEG;
      }
      else
      {
         this.rworld.worldlegL.leg._rotation = Math.atan2(this.dots[8].y - this.dots[4].y,this.dots[8].x - this.dots[4].x) * this.TO_DEG;
         this.rworld.worldarmL.arm._rotation = Math.atan2(this.dots[7].y - this.dots[5].y,this.dots[7].x - this.dots[5].x) * this.TO_DEG;
         this.rworld.worldlegR.leg._rotation = Math.atan2(this.dots[9].y - this.dots[4].y,this.dots[9].x - this.dots[4].x) * this.TO_DEG;
         this.rworld.worldarmR.arm._rotation = Math.atan2(this.dots[6].y - this.dots[5].y,this.dots[6].x - this.dots[5].x) * this.TO_DEG;
      }
      this.rworld.body._rotation = Math.atan2(this.dots[5].y - this.dots[4].y,this.dots[5].x - this.dots[4].x) * this.TO_DEG;
      this.updateVelocity();
   }
   function physics()
   {
      this.verlet(this.dots);
      this.dots2[1].x += Math.random() * 0.3 * (- Math.min(this.dots[5].dx,125));
      this.dots2[1].y += Math.random() * 0.3 * (- Math.min(this.dots[5].dy,125));
      this.verlet(this.dots2);
      this.verlet(this.dotsBraid);
      this.satisfyConstraints();
   }
   function verlet(dotsArray)
   {
      var _loc2_ = 0;
      while(_loc2_ < dotsArray.length)
      {
         if(dotsArray[_loc2_].active)
         {
            dotsArray[_loc2_].verlet(_root.aGravity);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function satisfyConstraints()
   {
      _root.colided = false;
      var _loc3_ = 0;
      while(_loc3_ < _root.ITERATE)
      {
         this.satisfyDistance(this.edges);
         _root.satisfyBoundaries(this.dots);
         _loc3_ = _loc3_ + 1;
      }
      this.satisfyDistance(this.edges2);
      this.satisfyDistance(this.edgesBraid);
   }
   function satisfyDistance(edgeArray)
   {
      var _loc1_ = 0;
      while(_loc1_ < edgeArray.length)
      {
         edgeArray[_loc1_].satisfyDistance();
         _loc1_ = _loc1_ + 1;
      }
   }
   function moveToStartPos()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.dots.length)
      {
         this.dots[_loc3_].x += this.rstartPoint._x;
         this.dots[_loc3_].y += this.rstartPoint._y;
         this.dots[_loc3_].vx = this.dots[_loc3_].x - 0.8 * _root.SCALEDOWN;
         this.dots[_loc3_].vy = this.dots[_loc3_].y;
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < this.dots2.length)
      {
         this.dots2[_loc3_].x += this.rstartPoint._x;
         this.dots2[_loc3_].y += this.rstartPoint._y;
         this.dots2[_loc3_].vx = this.dots2[_loc3_].x - 0.8 * _root.SCALEDOWN;
         this.dots2[_loc3_].vy = this.dots2[_loc3_].y;
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < this.dotsBraid.length)
      {
         this.dotsBraid[_loc3_].x += this.rstartPoint._x;
         this.dotsBraid[_loc3_].y += this.rstartPoint._y;
         this.dotsBraid[_loc3_].vx = this.dotsBraid[_loc3_].x - 0.8 * _root.SCALEDOWN;
         this.dotsBraid[_loc3_].vy = this.dotsBraid[_loc3_].y;
         _loc3_ = _loc3_ + 1;
      }
   }
   function cleanUp()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.edges.length)
      {
         delete this.edges[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.dots.length)
      {
         delete this.dots[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.edges2.length)
      {
         delete this.edges2[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.dots2.length)
      {
         delete this.dots2[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.edgesBraid.length)
      {
         delete this.edgesBraid[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.dotsBraid.length)
      {
         delete this.dotsBraid[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
   }
}
