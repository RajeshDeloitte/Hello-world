trigger ZProduct_Trigger  on zqu__ZProduct__c (after insert,after update,after delete,after undelete) {

if(Trigger.isInsert||Trigger.IsUndelete)
  {
   ZProduct_Trigger_Helper.insertCCProductRecords(Trigger.new);
  }
  
  //update operation
  if(Trigger.IsUpdate)
  {
   List<Id> zProductIdList = new List<Id>();
   Map<Id,Id> ZProdtoCCProdMap = new Map<Id,Id>();
   List<zqu__ZProduct__c> zProdUpdateList = new  List<zqu__ZProduct__c>();
   List<zqu__ZProduct__c> zProdInsertList = new  List<zqu__ZProduct__c>();
   
   for(zqu__ZProduct__c zprod : Trigger.new)
   {
    zProductIdList.add(zprod.id);
   }
   
   for(ccrz__E_Product__c ccProd : [select id,name,Zuora_Product_Id__c from ccrz__E_Product__c where Zuora_Product_Id__c in :zProductIdList])
   {
   ZProdtoCCProdMap.put(ccProd.Zuora_Product_Id__c,ccProd.id);
   }
  
  for(zqu__ZProduct__c zprod : Trigger.new)
   {
    if(ZProdtoCCProdMap.containskey(zprod.id))
     zProdUpdateList.add(zprod);
    else
     zProdInsertList.add(zprod);
   }
   
   if(!zProdUpdateList.isEmpty())
    ZProduct_Trigger_Helper.updateCCProductRecords(zProdUpdateList);
  
   if(!zProdInsertList.isEmpty())
    ZProduct_Trigger_Helper.insertCCProductRecords(zProdInsertList);
   
  }
  
  //Delete Operation
 else if(Trigger.IsDelete)
  {
   List<Id> zProductIdListDel = new List<Id>();
   
   for(zqu__ZProduct__c zprod : Trigger.old)
   {
    zProductIdListDel.add(zprod.id);
   }
   
   List<ccrz__E_Product__c> ccProdDeleteList = [select id,name,Zuora_Product_Id__c from ccrz__E_Product__c where Zuora_Product_Id__c in :zProductIdListDel];
  
  if(!ccProdDeleteList.isEmpty())
  {
   delete ccProdDeleteList;
  }
   
  }
  

}