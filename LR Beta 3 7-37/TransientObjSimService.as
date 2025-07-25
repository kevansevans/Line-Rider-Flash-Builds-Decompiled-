class TransientObjSimService
{
   var list;
   var slist;
   var listName;
   var save;
   var debugTossListRef;
   static var tossList = [];
   static var tossCount = 0;
   function TransientObjSimService(Name, Save)
   {
      this.list = [];
      this.slist = [];
      this.listName = Name;
      this.save = Save;
      TransientObjSimService.tossCount = ++TransientObjSimService.tossCount;
      TransientObjSimService.tossList[TransientObjSimService.tossCount] = this;
      this.debugTossListRef = TransientObjSimService.tossList;
   }
   function addObject(objThis, objName)
   {
      this.list[objName] = objThis;
   }
   function UpdateList()
   {
      for(var _loc2_ in this.list)
      {
         if(this.list[_loc2_].simUpdate() == false)
         {
            this.list.removeItemAt(_loc2_);
         }
      }
   }
   function SaveList()
   {
      if(this.save)
      {
         this.slist = [];
         for(var _loc2_ in this.list)
         {
            this.list[_loc2_].simSave();
            this.slist[_loc2_] = this.list[_loc2_];
         }
      }
   }
   function RestoreList()
   {
      for(var _loc2_ in this.list)
      {
         this.list[_loc2_].simRestore();
      }
      this.list = [];
      if(this.save)
      {
         for(_loc2_ in this.slist)
         {
            this.slist[_loc2_].simRestore();
            this.list[_loc2_] = this.slist[_loc2_];
         }
      }
   }
   function ResetList()
   {
      for(var _loc2_ in this.list)
      {
         this.list[_loc2_].simReset();
      }
      this.list = [];
   }
   function ClearList()
   {
      for(var _loc2_ in this.list)
      {
         this.list[_loc2_].simClear();
      }
      for(_loc2_ in this.slist)
      {
         this.slist[_loc2_].simClear();
      }
      this.list = [];
      this.slist = [];
   }
   function TraceList()
   {
      trace("      Active:");
      for(var _loc2_ in this.list)
      {
         this.list[_loc2_].simTrace(_loc2_);
      }
      trace("      Saved:");
      for(_loc2_ in this.slist)
      {
         this.slist[_loc2_].simTrace(_loc2_);
      }
   }
   static function UpdateAllLists()
   {
      for(var _loc1_ in TransientObjSimService.tossList)
      {
         TransientObjSimService.tossList[_loc1_].UpdateList();
      }
   }
   static function SaveAllLists()
   {
      for(var _loc1_ in TransientObjSimService.tossList)
      {
         TransientObjSimService.tossList[_loc1_].SaveList();
      }
   }
   static function RestoreAllLists()
   {
      for(var _loc1_ in TransientObjSimService.tossList)
      {
         TransientObjSimService.tossList[_loc1_].RestoreList();
      }
   }
   static function ResetAllLists()
   {
      for(var _loc1_ in TransientObjSimService.tossList)
      {
         TransientObjSimService.tossList[_loc1_].ResetList();
      }
   }
   static function ClearAllLists()
   {
      for(var _loc1_ in TransientObjSimService.tossList)
      {
         TransientObjSimService.tossList[_loc1_].ClearList();
      }
   }
   static function TraceAllLists(msg)
   {
      trace("TransientObjSimService Trace \'" + msg + "\':");
      for(var _loc1_ in TransientObjSimService.tossList)
      {
         trace("   List \'" + TransientObjSimService.tossList[_loc1_].listName + "\':");
         TransientObjSimService.tossList[_loc1_].TraceList();
         trace("   End \'" + TransientObjSimService.tossList[_loc1_].listName + "\'.");
      }
   }
}
