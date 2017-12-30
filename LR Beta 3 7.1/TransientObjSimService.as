class TransientObjSimService
{
    var list, slist, listName, save, debugTossListRef;
    function TransientObjSimService(Name, Save)
    {
        list = [];
        slist = [];
        listName = Name;
        save = Save;
        tossCount = tossCount = ++TransientObjSimService.tossCount;
        TransientObjSimService.tossList[TransientObjSimService.tossCount] = this;
        debugTossListRef = TransientObjSimService.tossList;
    } // End of the function
    function addObject(objThis, objName)
    {
        list[objName] = objThis;
    } // End of the function
    function UpdateList()
    {
        for (var _loc2 in list)
        {
            if (list[_loc2].simUpdate() == false)
            {
                list.removeItemAt(_loc2);
            } // end if
        } // end of for...in
    } // End of the function
    function SaveList()
    {
        if (save)
        {
            slist = [];
            for (var _loc2 in list)
            {
                list[_loc2].simSave();
                slist[_loc2] = list[_loc2];
            } // end of for...in
        } // end if
    } // End of the function
    function RestoreList()
    {
        for (var _loc2 in list)
        {
            list[_loc2].simRestore();
        } // end of for...in
        list = [];
        if (save)
        {
            for (var _loc2 in slist)
            {
                slist[_loc2].simRestore();
                list[_loc2] = slist[_loc2];
            } // end of for...in
        } // end if
    } // End of the function
    function ResetList()
    {
        for (var _loc2 in list)
        {
            list[_loc2].simReset();
        } // end of for...in
        list = [];
    } // End of the function
    function ClearList()
    {
        for (var _loc2 in list)
        {
            list[_loc2].simClear();
        } // end of for...in
        for (var _loc2 in slist)
        {
            slist[_loc2].simClear();
        } // end of for...in
        list = [];
        slist = [];
    } // End of the function
    function TraceList()
    {
        trace ("      Active:");
        for (var _loc2 in list)
        {
            list[_loc2].simTrace(_loc2);
        } // end of for...in
        trace ("      Saved:");
        for (var _loc2 in slist)
        {
            slist[_loc2].simTrace(_loc2);
        } // end of for...in
    } // End of the function
    static function UpdateAllLists()
    {
        for (var _loc1 in TransientObjSimService.tossList)
        {
            TransientObjSimService.tossList[_loc1].UpdateList();
        } // end of for...in
    } // End of the function
    static function SaveAllLists()
    {
        for (var _loc1 in TransientObjSimService.tossList)
        {
            TransientObjSimService.tossList[_loc1].SaveList();
        } // end of for...in
    } // End of the function
    static function RestoreAllLists()
    {
        for (var _loc1 in TransientObjSimService.tossList)
        {
            TransientObjSimService.tossList[_loc1].RestoreList();
        } // end of for...in
    } // End of the function
    static function ResetAllLists()
    {
        for (var _loc1 in TransientObjSimService.tossList)
        {
            TransientObjSimService.tossList[_loc1].ResetList();
        } // end of for...in
    } // End of the function
    static function ClearAllLists()
    {
        for (var _loc1 in TransientObjSimService.tossList)
        {
            TransientObjSimService.tossList[_loc1].ClearList();
        } // end of for...in
    } // End of the function
    static function TraceAllLists(msg)
    {
        trace ("TransientObjSimService Trace \'" + msg + "\':");
        for (var _loc1 in TransientObjSimService.tossList)
        {
            trace ("   List \'" + TransientObjSimService.tossList[_loc1].listName + "\':");
            TransientObjSimService.tossList[_loc1].TraceList();
            trace ("   End \'" + TransientObjSimService.tossList[_loc1].listName + "\'.");
        } // end of for...in
    } // End of the function
    static var tossList = [];
    static var tossCount = 0;
} // End of Class
