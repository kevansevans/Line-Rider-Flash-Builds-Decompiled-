class FloorTrapdoor extends FloorBase
{
    var inv, __set__lim, x2, x1, dx, y2, y1, dy, C, invSqrDis, dst, invDst, nx, ny, x, y, hx, hy, accx, accy, LIM, currentdy, currentdx, __get__lim, prevLine, nextLine, _lim1, _lim2, countDown, name, parent, sridden, shidden, spercent, scurrentdx, scurrentdy, scountDown, sparentalpha;
    function FloorTrapdoor(_unitsStepSize, _x1, _y1, _x2, _y2, _inv, _lim)
    {
        super(_x1, _y1, _x2, _y2);
        inv = _inv;
        this.calculateConstants(_unitsStepSize);
        this.__set__lim(_lim == undefined ? (0) : (_lim));
    } // End of the function
    function calculateConstants(_unitsStepSize)
    {
        dx = x2 - x1;
        dy = y2 - y1;
        C = dy * x1 - dx * y1;
        var _loc2 = Math.pow(dx, 2) + Math.pow(dy, 2);
        invSqrDis = 1 / _loc2;
        dst = Math.sqrt(_loc2);
        invDst = 1 / dst;
        nx = dy * invDst * (inv ? (1) : (-1));
        ny = dx * invDst * (inv ? (-1) : (1));
        x = x1 + dx * 0.500000;
        y = y1 + dy * 0.500000;
        hx = Math.abs(dx) * 0.500000;
        hy = Math.abs(dy) * 0.500000;
        accx = ny * FloorTrapdoor.ACC * (inv ? (1) : (-1));
        accy = nx * FloorTrapdoor.ACC * (inv ? (-1) : (1));
        LIM = Math.min(0.250000, FloorBase.zone / dst);
        percentStepSize = _unitsStepSize / dst;
        currentdx = currentdy = 0;
    } // End of the function
    function addPrevLine(line, extend)
    {
        if (extend && line.type == 1)
        {
            switch (this.__get__lim())
            {
                case 0:
                {
                    this.__set__lim(1);
                    break;
                } 
                case 2:
                {
                    this.__set__lim(3);
                    break;
                } 
            } // End of switch
        } // end if
        prevLine = line.name;
    } // End of the function
    function addNextLine(line, extend)
    {
        if (extend && line.type == 1)
        {
            switch (this.__get__lim())
            {
                case 0:
                {
                    this.__set__lim(2);
                    break;
                } 
                case 1:
                {
                    this.__set__lim(3);
                    break;
                } 
            } // End of switch
        } // end if
        nextLine = line.name;
    } // End of the function
    function colide(dot)
    {
        if (hidden)
        {
            return (false);
        } // end if
        if (dot.dx * nx + dot.dy * ny > 0)
        {
            var _loc4 = dot.x + dot.radius * nx - (x1 + currentdx);
            var _loc5 = dot.y + dot.radius * ny - (y1 + currentdy);
            var _loc3 = nx * _loc4 + ny * _loc5;
            if (_loc3 > 0 && _loc3 < FloorBase.zone)
            {
                var _loc6 = (_loc4 * dx + _loc5 * dy) * invSqrDis;
                if (_loc6 >= _lim1 && _loc6 <= _lim2)
                {
                    dot.x = dot.x - _loc3 * nx;
                    dot.y = dot.y - _loc3 * ny;
                    this.markRidden(true);
                    return (true);
                } // end if
            } // end if
        } // end if
    } // End of the function
    function markRidden(setCountDown)
    {
        if (!ridden)
        {
            ridden = true;
            currentdx = currentdy = 0;
            if (setCountDown)
            {
                countDown = 40;
            } // end if
            FloorTrapdoor.toss.addObject(this, name);
        } // end if
        if (!setCountDown)
        {
            countDown = 0;
        } // end if
    } // End of the function
    function simUpdate()
    {
        if (countDown > 0)
        {
            --countDown;
            return (true);
        } // end if
        if (percent < 1)
        {
            var _loc3 = x1 + currentdx;
            var _loc5 = y1 + currentdy;
            percent = Math.min(1, percent + percentStepSize);
            currentdx = percent * (x2 - x1);
            currentdy = percent * (y2 - y1);
            var _loc4 = x1 + currentdx;
            var _loc6 = y1 + currentdy;
            var _loc8 = new FloorParticle(_loc3, _loc5, _loc4, _loc6, 0, 0, 0, 0.375000, 20, true, inv);
            dx = x2 - (x1 + currentdx);
            dy = y2 - (y1 + currentdy);
            var _loc7 = Math.pow(dx, 2) + Math.pow(dy, 2);
            invSqrDis = 1 / _loc7;
            parent.clear();
            parent.lineStyle(4 * _root.SCALEDOWN, 0, 100, false, "normal", "round");
            parent.moveTo(x1 + currentdx, y1 + currentdy);
            parent.lineTo(x2, y2);
        } // end if
        if (percent >= 1)
        {
            parent._alpha = 0;
            hidden = true;
            if (nextLine != undefined)
            {
                _root.lines["line" + nextLine].markRidden(false);
            } // end if
            return (false);
        } // end if
        return (true);
    } // End of the function
    function simSave()
    {
        sridden = ridden;
        shidden = hidden;
        spercent = percent;
        scurrentdx = currentdx;
        scurrentdy = currentdy;
        scountDown = countDown;
        sparentalpha = parent._alpha;
        saved = true;
    } // End of the function
    function simRestore()
    {
        if (!saved)
        {
            this.simReset();
        }
        else
        {
            ridden = sridden;
            hidden = shidden;
            percent = spercent;
            currentdx = scurrentdx;
            currentdy = scurrentdy;
            dx = x2 - x1;
            dy = y2 - y1;
            var _loc2 = Math.pow(dx, 2) + Math.pow(dy, 2);
            invSqrDis = 1 / _loc2;
            countDown = scountDown;
            parent._alpha = sparentalpha;
        } // end else if
    } // End of the function
    function simReset()
    {
        percent = 0;
        parent._alpha = 100;
        hidden = ridden = false;
        currentdx = currentdy = 0;
        dx = x2 - x1;
        dy = y2 - y1;
        var _loc2 = Math.pow(dx, 2) + Math.pow(dy, 2);
        invSqrDis = 1 / _loc2;
    } // End of the function
    function simClear()
    {
    } // End of the function
    function simTrace(index)
    {
        trace (index + ": name=" + name + " countDown=" + countDown + " ridden=" + ridden + " hidden=" + hidden + " perecent=" + percent + " currentdx=" + currentdx + " currentdy=" + currentdy);
    } // End of the function
    static var ACC = 0.100000;
    var type = 3;
    var ridden = false;
    var hidden = false;
    var percent = 0;
    var percentStepSize = 1;
    var saved = false;
    static var toss = new TransientObjSimService("FloorTrapdoor", true);
} // End of Class
