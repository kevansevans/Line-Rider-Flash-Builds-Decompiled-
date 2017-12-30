class RiderBase
{
    var tlaref, rworld, rdummy, rcompas, rstartPoint, rscaleFactor, riding, crash, prevX, prevY, velocityX, velocityY, type, edges, dots, headRadiusScaledDown, canDismember, scarfColor, scarfColor2, braidColor, invHeadCircumfScaledDown, sfxCrash, brokenArm1, brokenArm2, brokenLeg1, brokenLeg2, dots2, dotsBraid, edges2, edgesBraid, sbrokenArm1, sbrokenArm2, sbrokenLeg1, sbrokenLeg2, sheadRot, sbrokenNeck;
    function RiderBase(_active, _tlaref, _world, _dummy, _compas, _startPoint, scaleFactor, dBase, d2Base, dbBase, eBase, e2Base, ebBase, _riderType, _riderBref)
    {
        active = _active;
        tlaref = _tlaref;
        rworld = _world;
        rdummy = _dummy;
        rdummy._visible = false;
        rcompas = _compas;
        rcompas._visible = false;
        rstartPoint = _startPoint;
        rstartPoint._visible = false;
        rstartPoint.rscaleFactor = rscaleFactor = scaleFactor;
        riding = false;
        crash = false;
        this.setRiderType(_riderType);
        prevX = rworld.worldsled.sled._x;
        prevY = rworld.worldsled.sled._y;
        velocityX = 0;
        velocityY = 0;
        rworld.worldsled.sled._xscale = rworld.worldsled.sled._yscale = rworld.body._xscale = rworld.body._yscale = rworld.worldarmL.arm._xscale = rworld.worldarmL.arm._yscale = rworld.worldarmR.arm._xscale = rworld.worldarmR.arm._yscale = rworld.worldlegL.leg._xscale = rworld.worldlegL.leg._yscale = rworld.worldlegR.leg._xscale = rworld.worldlegR.leg._yscale = rscaleFactor * 100;
        rdummy.sanke._xscale = rdummy.sanke._yscale = rdummy.sankac._xscale = rdummy.sankac._yscale = rdummy.roka1._xscale = rdummy.roka1._yscale = rdummy.roka2._xscale = rdummy.roka2._yscale = rdummy.noga1._xscale = rdummy.noga1._yscale = rdummy.noga2._xscale = rdummy.noga2._yscale = rscaleFactor * 100;
        rworld.worldhead.head._xscale = rworld.worldhead.head._yscale = rscaleFactor * 100;
        rstartPoint.help._visible = false;
        rstartPoint.arrows._visible = false;
        this.initDots();
        this.initEdges();
    } // End of the function
    function setRiderType(_riderType, bIsSimulation)
    {
        type = _riderType;
        edges[11].a = dots[5];
        edges[11].satisfyDistance();
        edges[12].a = dots[5];
        edges[12].satisfyDistance();
        edges[13].a = dots[4];
        edges[13].satisfyDistance();
        edges[14].a = dots[4];
        edges[14].satisfyDistance();
        edges[15].a = dots[5];
        edges[15].satisfyDistance();
        edges[23].broken = false;
        rworld.worldsled.sled.gotoAndStop(1);
        rworld.body.gotoAndStop(type);
        rworld.worldarmL.arm.gotoAndStop(type);
        rworld.worldarmR.arm.gotoAndStop(type);
        rworld.worldlegL.leg.gotoAndStop(type);
        rworld.worldlegR.leg.gotoAndStop(type);
        rworld.worldhead.head.gotoAndStop(type);
        rdummy.sanke.gotoAndStop(1);
        rdummy.sankac.body.gotoAndStop(type);
        rdummy.sankac.scarfetc.gotoAndStop(type);
        rdummy.sankac.head.gotoAndStop(type);
        rdummy.roka1.gotoAndStop(type);
        rdummy.roka2.gotoAndStop(type);
        rdummy.noga1.gotoAndStop(type);
        rdummy.noga2.gotoAndStop(type);
        headRadiusScaledDown = 0;
        canDismember = false;
        rworld.worldhead.head._visible = false;
        switch (type)
        {
            case 1:
            {
                scarfColor = 16777215;
                scarfColor2 = 13763074;
                braidColor = 0;
                break;
            } 
            case 2:
            {
                scarfColor = 14252006;
                scarfColor2 = 16764159;
                braidColor = 0;
                break;
            } 
            case 3:
            {
                scarfColor = 16777215;
                scarfColor2 = 1081344;
                braidColor = 0;
                headRadiusScaledDown = 1 * rscaleFactor;
                invHeadCircumfScaledDown = 1 / (6.283185 * headRadiusScaledDown);
                rworld.worldhead.head._visible = true;
                sfxCrash = new Sound(rdummy);
                sfxCrash.attachSound("Crash_Warrior_SFX");
                sfxCrash.setVolume(25);
                break;
            } 
            case 4:
            {
                scarfColor = 6679807;
                scarfColor2 = 16501987;
                braidColor = 0;
                headRadiusScaledDown = 1 * rscaleFactor;
                invHeadCircumfScaledDown = 1 / (6.283185 * headRadiusScaledDown);
                rworld.worldhead.head._visible = true;
                sfxCrash = new Sound(rdummy);
                sfxCrash.attachSound("Crash_Huntress_SFX");
                sfxCrash.setVolume(25);
                break;
            } 
            case 5:
            {
                scarfColor = 6723840;
                scarfColor2 = 6710835;
                braidColor = 0;
                headRadiusScaledDown = 6 * rscaleFactor;
                invHeadCircumfScaledDown = 1 / (6.283185 * headRadiusScaledDown);
                canDismember = true;
                rworld.worldhead.head._visible = true;
                break;
            } 
            case 6:
            {
                scarfColor = 16777215;
                scarfColor2 = 16711680;
                braidColor = 0;
                headRadiusScaledDown = 6 * rscaleFactor;
                invHeadCircumfScaledDown = 1 / (6.283185 * headRadiusScaledDown);
                canDismember = true;
                rworld.worldhead.head._visible = true;
                break;
            } 
            case 7:
            {
                scarfColor = 10066329;
                scarfColor2 = 7631988;
                braidColor = 0;
                headRadiusScaledDown = 6 * rscaleFactor;
                invHeadCircumfScaledDown = 1 / (6.283185 * headRadiusScaledDown);
                canDismember = true;
                rworld.worldhead.head._visible = true;
                sfxCrash = new Sound(rdummy);
                sfxCrash.attachSound("Crash_Wargar_SFX");
                sfxCrash.setVolume(25);
                break;
            } 
            default:
            {
                scarfColor = 16777215;
                scarfColor2 = 13763074;
                braidColor = 0;
                break;
            } 
        } // End of switch
    } // End of the function
    function BreakLimb(limb, bRestore)
    {
        var _loc2;
        var _loc3;
        var _loc5;
        var _loc6 = -1;
        var _loc9 = 10;
        var _loc4 = 1;
        switch (limb)
        {
            case "arm1":
            {
                brokenArm1 = true;
                _loc2 = 13;
                _loc3 = 5;
                _loc5 = 12;
                _loc6 = 15;
                _loc4 = _loc4 * -1;
                break;
            } 
            case "arm2":
            {
                brokenArm2 = true;
                _loc2 = 11;
                _loc3 = 5;
                _loc5 = 11;
                break;
            } 
            case "leg1":
            {
                brokenLeg1 = true;
                _loc2 = 10;
                _loc3 = 4;
                _loc5 = 13;
                break;
            } 
            case "leg2":
            {
                brokenLeg2 = true;
                _loc2 = 12;
                _loc3 = 4;
                _loc5 = 14;
                _loc4 = _loc4 * -1;
                break;
            } 
        } // End of switch
        dots[_loc2].active = true;
        if (!bRestore)
        {
            dots[_loc2].x = dots[_loc3].x;
            dots[_loc2].y = dots[_loc3].y;
            var _loc7 = dots[_loc3].dx;
            var _loc8 = dots[_loc3].dy;
            dots[_loc2].vx = dots[_loc3].x + _loc7 * _loc4;
            dots[_loc2].vy = dots[_loc3].y + Math.abs(_loc8);
        } // end if
        edges[_loc5].a = dots[_loc2];
        if (_loc6 != -1)
        {
            edges[_loc6].a = dots[_loc2];
        } // end if
    } // End of the function
    function activateDots()
    {
        for (var _loc2 in dots)
        {
            if (_loc2 >= 10 && _loc2 <= 13 || _loc2 == 14 && type != 3 && type != 4 && type != 5 && type != 6 && type != 7)
            {
                dots[_loc2].active = false;
                continue;
            } // end if
            dots[_loc2].active = active;
        } // end of for...in
        for (var _loc2 in dots2)
        {
            dots2[_loc2].active = active;
        } // end of for...in
        for (var _loc2 in dotsBraid)
        {
            dotsBraid[_loc2].active = active;
        } // end of for...in
    } // End of the function
    function showBurek()
    {
        rdummy._visible = true;
        rdummy._x = rworld._x - tlaref._x;
        rdummy._y = rworld._y - tlaref._y;
        rdummy.sankac._x = rworld.body._x;
        rdummy.sankac._y = rworld.body._y;
        rdummy.sankac._rotation = rworld.body._rotation;
        rdummy.roka1._x = rworld.worldarmL.arm._x;
        rdummy.roka1._y = rworld.worldarmL.arm._y;
        rdummy.roka1._rotation = rworld.worldarmL.arm._rotation;
        rdummy.roka2._x = rworld.worldarmR.arm._x;
        rdummy.roka2._y = rworld.worldarmR.arm._y;
        rdummy.roka2._rotation = rworld.worldarmR.arm._rotation;
        rdummy.noga1._x = rworld.worldlegL.leg._x;
        rdummy.noga1._y = rworld.worldlegL.leg._y;
        rdummy.noga1._rotation = rworld.worldlegL.leg._rotation;
        rdummy.noga2._x = rworld.worldlegR.leg._x;
        rdummy.noga2._y = rworld.worldlegR.leg._y;
        rdummy.noga2._rotation = rworld.worldlegR.leg._rotation;
        rdummy.sanke._x = rworld.worldsled.sled._x;
        rdummy.sanke._y = rworld.worldsled.sled._y;
        rdummy.sanke._rotation = rworld.worldsled.sled._rotation;
        rdummy.sanke._yscale = rworld.worldsled.sled._yscale;
        rdummy.sanke.gotoAndStop(rworld.worldsled.sled._currentframe);
        rdummy.sankac.face.gotoAndStop(rworld.body.face._currentframe);
        if (brokenArm1)
        {
        } // end if
    } // End of the function
    function blink()
    {
        if (Math.random() < BLINK_RATE)
        {
            rworld.body.face.uch1.play();
            rworld.body.face.uch2.play();
        } // end if
    } // End of the function
    function scaleRider(newScale, newX, newY)
    {
        var _loc2 = tlaref._xscale;
        rworld.worldlegL._xscale = rworld.worldlegL._yscale = rworld.worldlegR._xscale = rworld.worldlegR._yscale = rworld.worldarmL._xscale = rworld.worldarmL._yscale = rworld.worldarmR._xscale = rworld.worldarmR._yscale = rworld.worldsled._xscale = rworld.worldsled._yscale = rworld.worldhead._xscale = rworld.worldhead._yscale = rworld._xscale = rworld._yscale = newScale;
        this.translateRider(newX, newY);
    } // End of the function
    function translateRider(newX, newY)
    {
        rworld.worldlegL._x = rworld.worldlegR._x = rworld.worldarmL._x = rworld.worldarmR._x = rworld.worldsled._x = rworld.worldhead._x = rworld._x = newX;
        rworld.worldlegL._y = rworld.worldlegR._y = rworld.worldarmL._y = rworld.worldarmR._y = rworld.worldsled._y = rworld.worldhead._y = rworld._y = newY;
    } // End of the function
    function showRider(bVisible)
    {
        rworld.worldlegL._visible = rworld.worldlegR._visible = rworld.worldarmL._visible = rworld.worldarmR._visible = rworld.worldsled._visible = rworld.worldhead._visible = rworld._visible = rworld._visible = bVisible;
    } // End of the function
    function updateVelocity()
    {
        velocityX = rworld.body._x - prevX;
        velocityY = rworld.body._y - prevY;
        prevX = rworld.body._x;
        prevY = rworld.body._y;
    } // End of the function
    function bRiderIsGirl()
    {
        switch (type)
        {
            case 2:
            case 4:
            {
                return (true);
                break;
            } 
            default:
            {
                return (false);
                break;
            } 
        } // End of switch
    } // End of the function
    function initDotsHuman()
    {
        var _loc3 = _root.AIR_FRICTION;
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
        dots2[0] = new PointAirFri(7, -10, _loc3);
        dots2[1] = new PointAirFri(3, -10, _loc3);
        dots2[2] = new PointAirFri(0, -10, _loc3);
        dots2[3] = new PointAirFri(-4, -10, _loc3);
        dots2[4] = new PointAirFri(-7, -10, _loc3);
        dots2[5] = new PointAirFri(-11, -10, _loc3);
        for (var _loc4 in dots)
        {
            dots[_loc4].x = dots[_loc4].x * rscaleFactor;
            dots[_loc4].y = dots[_loc4].y * rscaleFactor;
        } // end of for...in
        for (var _loc4 in dots2)
        {
            dots2[_loc4].x = dots2[_loc4].x * rscaleFactor;
            dots2[_loc4].y = dots2[_loc4].y * rscaleFactor;
        } // end of for...in
    } // End of the function
    function initEdgesHuman()
    {
        var _loc3 = _root.ENDURANCE;
        edges = [];
        edges2 = [];
        edges[0] = new Stick(dots[0], dots[1]);
        edges[1] = new Stick(dots[1], dots[2]);
        edges[2] = new Stick(dots[2], dots[3]);
        edges[3] = new Stick(dots[3], dots[0]);
        edges[4] = new Stick(dots[0], dots[2]);
        edges[5] = new Stick(dots[3], dots[1]);
        edges[6] = new BindStick(dots[0], dots[4], _loc3, this);
        edges[8] = new BindStick(dots[1], dots[4], _loc3, this);
        edges[9] = new BindStick(dots[2], dots[4], _loc3, this);
        edges[10] = new Stick(dots[5], dots[4]);
        edges[11] = new Stick(dots[5], dots[6]);
        edges[12] = new Stick(dots[5], dots[7]);
        edges[13] = new Stick(dots[4], dots[8]);
        edges[14] = new Stick(dots[4], dots[9]);
        edges[15] = new Stick(dots[5], dots[7]);
        edges[16] = new BindStick(dots[5], dots[0], _loc3, this);
        edges[17] = new BindStick(dots[3], dots[6], _loc3, this);
        edges[18] = new BindStick(dots[3], dots[7], _loc3, this);
        edges[19] = new BindStick(dots[8], dots[2], _loc3, this);
        edges[20] = new BindStick(dots[9], dots[2], _loc3, this);
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
    function initDotsBoy()
    {
        this.initDotsHuman();
    } // End of the function
    function initEdgesBoy()
    {
        this.initEdgesHuman();
    } // End of the function
    function initDotsGirl()
    {
        this.initDotsHuman();
        var _loc4 = _root.BraidX;
        var _loc5 = _root.BraidY;
        var _loc8 = _root.HeadTopX;
        var _loc9 = _root.HeadTopY;
        var _loc6 = _root.BraidDX;
        var _loc10 = _root.BraidDY;
        var _loc3 = _root.AIR_FRICTION;
        dotsBraid = [];
        dotsBraid[0] = new PointAirFri(_loc4, _loc5, _loc3);
        dotsBraid[1] = new PointAirFri(_loc8, _loc9, _loc3);
        dotsBraid[2] = new PointAirFri(_loc4 - 1 * _loc6, _loc5, _loc3 + 0.050000);
        dotsBraid[3] = new PointAirFri(_loc4 - 2 * _loc6, _loc5, _loc3 + 0.050000);
        dotsBraid[4] = new PointAirFri(_loc4 - 3 * _loc6, _loc5, _loc3 + 0.050000);
        dotsBraid[5] = new PointAirFri(_loc4 - 4 * _loc6, _loc5, _loc3 + 0.050000);
        dotsBraid[6] = new PointAirFri(_loc4 - 5 * _loc6, _loc5, _loc3 + 0.050000);
        dotsBraid[7] = new PointAirFri(_loc4 - 6 * _loc6, _loc5, _loc3 * 1.100000 + 0.050000);
        dotsBraid[8] = new PointAirFri(_loc4 - 6 * _loc6, _loc5, _loc3 + 0.050000);
        dotsBraid[9] = new PointAirFri(_loc4 - 6 * _loc6, _loc5, _loc3 * 0.850000 + 0.050000);
        for (var _loc7 in dotsBraid)
        {
            dotsBraid[_loc7].x = dotsBraid[_loc7].x * rscaleFactor;
            dotsBraid[_loc7].y = dotsBraid[_loc7].y * rscaleFactor;
        } // end of for...in
    } // End of the function
    function initEdgesGirl()
    {
        this.initEdgesHuman();
        var _loc3 = _root.degreesLimitBraid;
        edgesBraid = [];
        edgesBraid[0] = new StickPerp(dots[4], dots[5], dotsBraid[0], 1);
        edgesBraid[1] = new StickPerp(dots[4], dots[5], dotsBraid[1], 1);
        edgesBraid[2] = new ShalAngle(dotsBraid[1], dotsBraid[0], dotsBraid[2], _loc3, 0.800000, braidColor);
        edgesBraid[3] = new ShalAngle(dotsBraid[0], dotsBraid[2], dotsBraid[3], _loc3, 0.700000, braidColor);
        edgesBraid[4] = new ShalAngle(dotsBraid[2], dotsBraid[3], dotsBraid[4], _loc3, 0.600000, braidColor);
        edgesBraid[5] = new ShalAngle(dotsBraid[3], dotsBraid[4], dotsBraid[5], _loc3, 0.500000, braidColor);
        edgesBraid[6] = new ShalAngle(dotsBraid[4], dotsBraid[5], dotsBraid[6], _loc3, 0.400000, scarfColor2);
        edgesBraid[7] = new Shal(dotsBraid[6], dotsBraid[7]);
        edgesBraid[8] = new Shal(dotsBraid[6], dotsBraid[8]);
        edgesBraid[9] = new Shal(dotsBraid[6], dotsBraid[9]);
    } // End of the function
    function initDotsDismemberable()
    {
        this.initDotsHuman();
        var _loc4 = _root.ShoulderX;
        var _loc3 = _root.ShoulderY;
        var _loc5 = _root.HeadTopX;
        var _loc6 = _root.HeadTopY;
        dots[10] = new Point(10, -11, 0.100000);
        dots[10].active = false;
        dots[11] = new Point(10, -11, 0.100000);
        dots[11].active = false;
        dots[12] = new Point(10, -11, 0.100000);
        dots[12].active = false;
        dots[13] = new Point(10, -11, 0.100000);
        dots[13].active = false;
        dots[14] = new Point(_root.PumpkinX, _root.PumpkinY, 0.050000);
        dots[14].radius = headRadiusScaledDown;
        dots[14].x = dots[14].x * rscaleFactor;
        dots[14].y = dots[14].y * rscaleFactor;
    } // End of the function
    function initEdgesDismemberable()
    {
        this.initEdgesHuman();
        var _loc2 = 0.261799;
        if (canDismember)
        {
            edges[23] = new ShalAngleBreakable(dots[4], dots[5], dots[14], _loc2);
        }
        else
        {
            edges[23] = new ShalAngle(dots[4], dots[5], dots[14], _loc2, 0, braidColor);
        } // end else if
    } // End of the function
    function initDots()
    {
        crash = false;
        switch (type)
        {
            case 2:
            {
                this.initDotsGirl();
                break;
            } 
            case 3:
            case 4:
            {
                this.initDotsDismemberable();
                break;
            } 
            case 5:
            {
                this.initDotsDismemberable();
                break;
            } 
            case 6:
            {
                this.initDotsDismemberable();
                dots[14].friction = 0.150000;
                break;
            } 
            case 7:
            {
                this.initDotsDismemberable();
                dots[14].friction = 0.100000;
                break;
            } 
            default:
            {
                this.initDotsBoy();
                break;
            } 
        } // End of switch
        rworld.worldsled.sled.gotoAndStop(1);
        rworld.worldsled.sled._xscale = rworld.worldsled.sled._yscale = rworld.body._xscale = rworld.body._yscale = rworld.worldarmL.arm._xscale = rworld.worldarmL.arm._yscale = rworld.worldarmR.arm._xscale = rworld.worldarmR.arm._yscale = rworld.worldlegL.leg._xscale = rworld.worldlegL.leg._yscale = rworld.worldlegR.leg._xscale = rworld.worldlegR.leg._yscale = rscaleFactor * 100;
    } // End of the function
    function initEdges()
    {
        switch (type)
        {
            case 2:
            {
                this.initEdgesGirl();
                break;
            } 
            case 3:
            case 4:
            {
                this.initEdgesDismemberable();
                break;
            } 
            case 5:
            case 6:
            case 7:
            {
                this.initEdgesDismemberable();
                break;
            } 
            default:
            {
                this.initEdgesBoy();
                break;
            } 
        } // End of switch
    } // End of the function
    function reset()
    {
        switch (type)
        {
            case 2:
            {
                this.resetPositionGirl();
                break;
            } 
            case 3:
            case 4:
            {
                this.resetPositionScarecrow();
                break;
            } 
            case 5:
            case 6:
            case 7:
            {
                this.resetPositionScarecrow();
                break;
            } 
            default:
            {
                this.resetPositionBoy();
                break;
            } 
        } // End of switch
        this.activateDots();
    } // End of the function
    function resetPositionHuman()
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
        for (var _loc2 in dots)
        {
            dots[_loc2].x = dots[_loc2].x * rscaleFactor;
            dots[_loc2].y = dots[_loc2].y * rscaleFactor;
        } // end of for...in
        for (var _loc2 in dots2)
        {
            dots2[_loc2].x = dots2[_loc2].x * rscaleFactor;
            dots2[_loc2].y = dots2[_loc2].y * rscaleFactor;
        } // end of for...in
    } // End of the function
    function resetPositionGirl()
    {
        this.resetPositionHuman();
        var _loc3 = _root.BraidX;
        var _loc4 = _root.BraidY;
        var _loc7 = _root.HeadTopX;
        var _loc8 = _root.HeadTopY;
        var _loc5 = _root.BraidDX;
        var _loc9 = _root.BraidDY;
        dotsBraid[0].x = _loc3;
        dotsBraid[0].y = _loc4;
        dotsBraid[1].x = _loc7;
        dotsBraid[1].y = _loc8;
        dotsBraid[2].x = _loc3 - 1 * _loc5;
        dotsBraid[2].y = _loc4;
        dotsBraid[3].x = _loc3 - 2 * _loc5;
        dotsBraid[3].y = _loc4;
        dotsBraid[4].x = _loc3 - 3 * _loc5;
        dotsBraid[4].y = _loc4;
        dotsBraid[5].x = _loc3 - 4 * _loc5;
        dotsBraid[5].y = _loc4;
        dotsBraid[6].x = _loc3 - 5 * _loc5;
        dotsBraid[6].y = _loc4;
        dotsBraid[7].x = _loc3 - 6 * _loc5;
        dotsBraid[7].y = _loc4;
        for (var _loc6 in dotsBraid)
        {
            dotsBraid[_loc6].x = dotsBraid[_loc6].x * rscaleFactor;
            dotsBraid[_loc6].y = dotsBraid[_loc6].y * rscaleFactor;
        } // end of for...in
    } // End of the function
    function resetPositionBoy()
    {
        this.resetPositionHuman();
    } // End of the function
    function resetPositionScarecrow()
    {
        this.resetPositionHuman();
        dots[14].x = _root.PumpkinX * rscaleFactor;
        dots[14].y = _root.PumpkinY * rscaleFactor;
        edges[11].a = dots[5];
        edges[11].satisfyDistance();
        edges[12].a = dots[5];
        edges[12].satisfyDistance();
        edges[13].a = dots[4];
        edges[13].satisfyDistance();
        edges[14].a = dots[4];
        edges[14].satisfyDistance();
        edges[15].a = dots[5];
        edges[15].satisfyDistance();
        edges[23].broken = false;
    } // End of the function
    function setCrash(bFlag, bSimulation)
    {
        if (canDismember)
        {
            if (bFlag && !crash)
            {
                this.setRiderType(type, bSimulation);
                this.BreakLimb("arm1", false);
                this.BreakLimb("arm2", false);
                this.BreakLimb("leg1", false);
                this.BreakLimb("leg2", false);
                edges[23].broken = true;
                if (type == 5)
                {
                    rworld.worldlegL.leg.scarecrow.gotoAndStop(2);
                    rworld.worldlegR.leg.scarecrow.gotoAndStop(2);
                    rworld.worldarmL.arm.scarecrow.gotoAndStop(2);
                    rworld.worldarmR.arm.scarecrow.gotoAndStop(2);
                    rworld.body.scarecrow.gotoAndStop(2);
                }
                else if (type == 7)
                {
                    rworld.worldlegL.leg.zombie.gotoAndStop(2);
                    rworld.worldlegR.leg.zombie.gotoAndStop(2);
                    rworld.worldarmL.arm.zombie.gotoAndStop(2);
                    rworld.worldarmR.arm.zombie.gotoAndStop(2);
                    rworld.body.zombie.gotoAndStop(2);
                } // end else if
            }
            else if (!bFlag)
            {
                this.setRiderType(type, bSimulation);
                brokenArm1 = false;
                brokenArm2 = false;
                brokenLeg1 = false;
                brokenLeg2 = false;
                if (type == 5)
                {
                    rworld.worldlegL.leg.scarecrow.gotoAndStop(1);
                    rworld.worldlegR.leg.scarecrow.gotoAndStop(1);
                    rworld.worldarmL.arm.scarecrow.gotoAndStop(1);
                    rworld.worldarmR.arm.scarecrow.gotoAndStop(1);
                    rworld.body.scarecrow.gotoAndStop(1);
                }
                else if (type == 7)
                {
                    rworld.worldlegL.leg.zombie.gotoAndStop(1);
                    rworld.worldlegR.leg.zombie.gotoAndStop(1);
                    rworld.worldarmL.arm.zombie.gotoAndStop(1);
                    rworld.worldarmR.arm.zombie.gotoAndStop(1);
                    rworld.body.zombie.gotoAndStop(1);
                } // end if
            } // end else if
        } // end else if
        if (bFlag && !crash && sfxCrash != undefined)
        {
            sfxCrash.start();
        } // end if
        crash = bFlag;
    } // End of the function
    function save()
    {
        for (var _loc3 in dots)
        {
            dots[_loc3].savePoint();
        } // end of for...in
        for (var _loc2 in dots2)
        {
            dots2[_loc2].savePoint();
        } // end of for...in
        for (var _loc2 in dotsBraid)
        {
            dotsBraid[_loc2].savePoint();
        } // end of for...in
        sbrokenArm1 = brokenArm1;
        sbrokenArm2 = brokenArm2;
        sbrokenLeg1 = brokenLeg1;
        sbrokenLeg2 = brokenLeg2;
        sheadRot = rworld.worldhead.head._rotation;
        if (canDismember)
        {
            sbrokenNeck = edges[23].broken;
        } // end if
    } // End of the function
    function restore()
    {
        for (var _loc3 in dots)
        {
            dots[_loc3].restore();
        } // end of for...in
        for (var _loc2 in dots2)
        {
            dots2[_loc2].restore();
        } // end of for...in
        for (var _loc2 in dotsBraid)
        {
            dotsBraid[_loc2].restore();
        } // end of for...in
        brokenArm1 = sbrokenArm1;
        brokenArm2 = sbrokenArm2;
        brokenLeg1 = sbrokenLeg1;
        brokenLeg2 = sbrokenLeg2;
        if (sbrokenArm1)
        {
            this.BreakLimb("arm1", true);
        } // end if
        if (sbrokenArm2)
        {
            this.BreakLimb("arm2", true);
        } // end if
        if (sbrokenLeg1)
        {
            this.BreakLimb("leg1", true);
        } // end if
        if (sbrokenLeg2)
        {
            this.BreakLimb("leg2", true);
        } // end if
        if (canDismember)
        {
            edges[23].broken = sbrokenNeck;
        } // end if
        rworld.worldhead.head._rotation = sheadRot;
    } // End of the function
    function render()
    {
        var _loc3 = false;
        var _loc4 = 0.500000;
        rworld.worldarmL.clear();
        if (type <= 2)
        {
            rworld.worldarmL.lineStyle(4 * _loc4 * tlaref._xscale / 100, scarfColor, 100, false, "none", "none");
            edges2[0].render(rworld.worldarmL, _loc3);
            edges2[2].render(rworld.worldarmL, _loc3);
            edges2[4].render(rworld.worldarmL, _loc3);
            rworld.worldarmL.lineStyle(4 * _loc4 * tlaref._xscale / 100, scarfColor2, 100, false, "none", "none");
            edges2[1].render(rworld.worldarmL, _loc3);
            edges2[3].render(rworld.worldarmL, _loc3);
            edges2[5].render(rworld.worldarmL, _loc3);
        } // end if
        rworld.clear();
        rworld.lineStyle(1 * _loc4, 0, 100);
        if (!crash)
        {
            rworld.lineStyle(1 * _loc4, 0, 100);
            edges[17].render(rworld, _loc3);
            edges[18].render(rworld, _loc3);
        }
        else if (rworld.body.face._currentframe != 14 && !this.bRiderIsGirl())
        {
            rworld.body.face.play();
        } // end else if
        if (this.bRiderIsGirl() && type <= 2)
        {
            rworld.lineStyle(0.250000 * _loc4 * rworld._xscale / 100, braidColor, 100, false, "none", "none");
            edgesBraid[2].render(rworld, _loc3);
            edgesBraid[3].render(rworld, _loc3);
            edgesBraid[4].render(rworld, _loc3);
            edgesBraid[5].render(rworld, _loc3);
            rworld.lineStyle(1 * _loc4 * rworld._xscale / 100, braidColor, 100, false, "none", "none");
            edgesBraid[7].render(rworld, _loc3);
            edgesBraid[8].render(rworld, _loc3);
            edgesBraid[9].render(rworld, _loc3);
            rworld.lineStyle(0.500000 * _loc4 * rworld._xscale / 100, scarfColor2, 100, false, "none", "none");
            edgesBraid[6].render(rworld, _loc3);
        } // end if
        rworld.worldsled.sled._x = dots[0].x;
        rworld.worldsled.sled._y = dots[0].y;
        rworld.body._x = dots[4].x;
        rworld.body._y = dots[4].y;
        rworld.worldhead.head._x = dots[0].x;
        rworld.worldhead.head._y = dots[0].y;
        if (!headRadiusScaledDown)
        {
            rworld.worldarmL.arm._x = rworld.worldarmR.arm._x = dots[5].x;
            rworld.worldarmL.arm._y = rworld.worldarmR.arm._y = dots[5].y;
            rworld.worldlegL.leg._x = rworld.worldlegR.leg._x = dots[4].x;
            rworld.worldlegL.leg._y = rworld.worldlegR.leg._y = dots[4].y;
        }
        else if (!crash || !canDismember)
        {
            rworld.worldhead.head._x = dots[14].x;
            rworld.worldhead.head._y = dots[14].y;
            rworld.worldarmL.arm._x = rworld.worldarmR.arm._x = dots[5].x;
            rworld.worldarmL.arm._y = rworld.worldarmR.arm._y = dots[5].y;
            rworld.worldlegL.leg._x = rworld.worldlegR.leg._x = dots[4].x;
            rworld.worldlegL.leg._y = rworld.worldlegR.leg._y = dots[4].y;
        }
        else
        {
            rworld.worldhead.head._x = dots[14].x;
            rworld.worldhead.head._y = dots[14].y;
            rworld.worldarmL.arm._x = dots[13].x;
            rworld.worldarmL.arm._y = dots[13].y;
            rworld.worldlegL.leg._x = dots[10].x;
            rworld.worldlegL.leg._y = dots[10].y;
            rworld.worldarmR.arm._x = dots[11].x;
            rworld.worldarmR.arm._y = dots[11].y;
            rworld.worldlegR.leg._x = dots[12].x;
            rworld.worldlegR.leg._y = dots[12].y;
        } // end else if
        var _loc5 = dots[3].x - dots[0].x;
        var _loc6 = dots[3].y - dots[0].y;
        if (_loc5 * (dots[1].y - dots[0].y) - _loc6 * (dots[1].x - dots[0].x) < 0)
        {
            if (rworld.worldsled.sled._yscale != -_loc4 * 100)
            {
                rworld.worldsled.sled._yscale = -_loc4 * 100;
                rworld.worldsled.sled.gotoAndStop(2);
                this.setCrash(true, _root.simulation);
            } // end if
        }
        else if (rworld.worldsled.sled._yscale != _loc4 * 100)
        {
            rworld.worldsled.sled._yscale = _loc4 * 100;
        } // end else if
        if (_loc5 * (dots[5].y - dots[4].y) - _loc6 * (dots[5].x - dots[4].x) > 0)
        {
            this.setCrash(true, _root.simulation);
        } // end if
        rworld.worldsled.sled._rotation = Math.atan2(_loc6, _loc5) * TO_DEG;
        if (headRadiusScaledDown > 0)
        {
            if (edges[23].broken && canDismember)
            {
                rworld.worldhead.head._rotation = rworld.worldhead.head._rotation + (dots[14].x - dots[14].vx) * invHeadCircumfScaledDown * 360;
            }
            else
            {
                rworld.worldhead.head._rotation = Math.atan2(dots[14].y - dots[5].y, dots[14].x - dots[5].x) * TO_DEG;
            } // end if
        } // end else if
        if (canDismember && crash)
        {
            rworld.worldlegL.leg._rotation = Math.atan2(dots[8].y - dots[10].y, dots[8].x - dots[10].x) * TO_DEG;
            rworld.worldarmL.arm._rotation = Math.atan2(dots[7].y - dots[13].y, dots[7].x - dots[13].x) * TO_DEG;
            rworld.worldlegR.leg._rotation = Math.atan2(dots[9].y - dots[12].y, dots[9].x - dots[12].x) * TO_DEG;
            rworld.worldarmR.arm._rotation = Math.atan2(dots[6].y - dots[11].y, dots[6].x - dots[11].x) * TO_DEG;
        }
        else
        {
            rworld.worldlegL.leg._rotation = Math.atan2(dots[8].y - dots[4].y, dots[8].x - dots[4].x) * TO_DEG;
            rworld.worldarmL.arm._rotation = Math.atan2(dots[7].y - dots[5].y, dots[7].x - dots[5].x) * TO_DEG;
            rworld.worldlegR.leg._rotation = Math.atan2(dots[9].y - dots[4].y, dots[9].x - dots[4].x) * TO_DEG;
            rworld.worldarmR.arm._rotation = Math.atan2(dots[6].y - dots[5].y, dots[6].x - dots[5].x) * TO_DEG;
        } // end else if
        rworld.body._rotation = Math.atan2(dots[5].y - dots[4].y, dots[5].x - dots[4].x) * TO_DEG;
        this.updateVelocity();
    } // End of the function
    function physics()
    {
        this.verlet(dots);
        dots2[1].x = dots2[1].x + Math.random() * 0.300000 * -Math.min(dots[5].dx, 125);
        dots2[1].y = dots2[1].y + Math.random() * 0.300000 * -Math.min(dots[5].dy, 125);
        this.verlet(dots2);
        this.verlet(dotsBraid);
        this.satisfyConstraints();
    } // End of the function
    function verlet(dotsArray)
    {
        for (var _loc2 = 0; _loc2 < dotsArray.length; ++_loc2)
        {
            if (dotsArray[_loc2].active)
            {
                dotsArray[_loc2].verlet(_root.aGravity);
            } // end if
        } // end of for
    } // End of the function
    function satisfyConstraints()
    {
        _root.colided = false;
        for (var _loc3 = 0; _loc3 < _root.ITERATE; ++_loc3)
        {
            this.satisfyDistance(edges);
            _root.satisfyBoundaries(dots);
        } // end of for
        this.satisfyDistance(edges2);
        this.satisfyDistance(edgesBraid);
    } // End of the function
    function satisfyDistance(edgeArray)
    {
        for (var _loc1 = 0; _loc1 < edgeArray.length; ++_loc1)
        {
            edgeArray[_loc1].satisfyDistance();
        } // end of for
    } // End of the function
    function moveToStartPos()
    {
        for (var _loc3 = 0; _loc3 < dots.length; ++_loc3)
        {
            dots[_loc3].x = dots[_loc3].x + rstartPoint._x;
            dots[_loc3].y = dots[_loc3].y + rstartPoint._y;
            dots[_loc3].vx = dots[_loc3].x - 0.800000 * _root.SCALEDOWN;
            dots[_loc3].vy = dots[_loc3].y;
        } // end of for
        for (var _loc3 = 0; _loc3 < dots2.length; ++_loc3)
        {
            dots2[_loc3].x = dots2[_loc3].x + rstartPoint._x;
            dots2[_loc3].y = dots2[_loc3].y + rstartPoint._y;
            dots2[_loc3].vx = dots2[_loc3].x - 0.800000 * _root.SCALEDOWN;
            dots2[_loc3].vy = dots2[_loc3].y;
        } // end of for
        for (var _loc3 = 0; _loc3 < dotsBraid.length; ++_loc3)
        {
            dotsBraid[_loc3].x = dotsBraid[_loc3].x + rstartPoint._x;
            dotsBraid[_loc3].y = dotsBraid[_loc3].y + rstartPoint._y;
            dotsBraid[_loc3].vx = dotsBraid[_loc3].x - 0.800000 * _root.SCALEDOWN;
            dotsBraid[_loc3].vy = dotsBraid[_loc3].y;
        } // end of for
    } // End of the function
    function cleanUp()
    {
        for (var _loc2 = 0; _loc2 < edges.length; ++_loc2)
        {
            delete edges[_loc2];
        } // end of for
        for (var _loc2 = 0; _loc2 < dots.length; ++_loc2)
        {
            delete dots[_loc2];
        } // end of for
        for (var _loc2 = 0; _loc2 < edges2.length; ++_loc2)
        {
            delete edges2[_loc2];
        } // end of for
        for (var _loc2 = 0; _loc2 < dots2.length; ++_loc2)
        {
            delete dots2[_loc2];
        } // end of for
        for (var _loc2 = 0; _loc2 < edgesBraid.length; ++_loc2)
        {
            delete edgesBraid[_loc2];
        } // end of for
        for (var _loc2 = 0; _loc2 < dotsBraid.length; ++_loc2)
        {
            delete dotsBraid[_loc2];
        } // end of for
    } // End of the function
    var active = false;
    var BLINK_RATE = 0.428571;
    var TO_DEG = 57.295780;
    var bInitialized = false;
} // End of Class
