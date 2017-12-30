class FloorParticle extends FloorMoving
{
    var inv, calculateConstants, __set__lim, name, mc, parent, age, vx, currentvx, ax, currentdx, vy, currentvy, ay, currentdy, sage, scurrentdx, scurrentdy, y1, x1, y2, x2;
    function FloorParticle(_x1, _y1, _x2, _y2, _vx, _vy, _ax, _ay, _life, _fade, _inv, _lim)
    {
        super(_x1, _y1, _x2, _y2, _vx, _vy, _ax, _ay);
        inv = _inv;
        this.calculateConstants();
        this.__set__lim(_lim == undefined ? (0) : (_lim));
        life = _life;
        fade = _fade;
        name = "fp" + FloorParticle.id;
        mc = _root.tla.createEmptyMovieClip(name, _root.tla.getNextHighestDepth());
        parent = mc;
        this.renderLine();
        FloorParticle.toss.addObject(this, FloorParticle.id);
        id = id = ++FloorParticle.id;
    } // End of the function
    function simUpdate()
    {
        ++age;
        currentdx = (vx + currentvx) * age + ax * age * age / 2;
        currentdy = (vy + currentvy) * age + ay * age * age / 2;
        if (age == life)
        {
            if (!saved)
            {
                this.simClear();
            }
            else
            {
                parent.clear();
            } // end else if
            return (false);
        }
        else
        {
            this.renderLine();
        } // end else if
        return (true);
    } // End of the function
    function simSave()
    {
        saved = true;
        sage = age;
        scurrentdx = currentdx;
        scurrentdy = currentdy;
    } // End of the function
    function simRestore()
    {
        if (saved)
        {
            parent.clear();
            age = sage;
            currentdx = scurrentdx;
            currentdy = scurrentdy;
            this.renderLine();
        }
        else
        {
            this.simClear();
        } // end else if
    } // End of the function
    function simReset()
    {
        parent.clear();
        if (!saved)
        {
            this.simClear();
        } // end if
    } // End of the function
    function simClear()
    {
        parent.clear();
        _root.tla[name].removeMovieClip();
        false;
    } // End of the function
    function simTrace(index)
    {
        trace (index + ":" + "saved=" + saved + " age=" + age + ", fade=" + fade + ", currentdx=" + currentdx + ", currentdy=" + currentdy + ", sage=" + sage + ", scurrentdx=" + scurrentdx + ", scurrentdy=" + currentdy);
    } // End of the function
    function renderLine()
    {
        parent.clear();
        parent.lineStyle(4 * _root.SCALEDOWN, 0, 100, false, "normal", "round");
        if (fade)
        {
            parent.lineStyle(4 * _root.SCALEDOWN, 0, 100 * (1 - age / life), false, "normal", "round");
        } // end if
        parent.moveTo(x1 + currentdx, y1 + currentdy);
        parent.lineTo(x2 + currentdx, y2 + currentdy);
    } // End of the function
    var type = 7;
    var life = 0;
    var fade = false;
    var saved = false;
    static var toss = new TransientObjSimService("FloorParticle", true);
    static var id = 0;
} // End of Class
