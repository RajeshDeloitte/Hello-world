/************************************************************************************
* Author       :    Manoj Vootla
* Date         :    16-11-2016
* Description  :    Trigger on standard product to sync it with CC Product    
*************************************************************************************/

trigger CC_Ecom_Product_Trigger  on Product2 (after insert,after update,after delete,after undelete) {

if(Trigger.isInsert||Trigger.IsUndelete)
  {
   Product_Trigger_Helper.insertCCProductRecords(Trigger.new);
  }
  
  //update operation
  if(Trigger.IsUpdate)
  {
   List<Id> zProductIdList = new List<Id>();
   Map<Id,Id> prodtoCCProdMap = new Map<Id,Id>();
   List<Product2> prodUpdateList = new  List<Product2>();
   List<Product2> prodInsertList = new  List<Product2>();
   
   for(Product2 prod : Trigger.new)
   {
    zProductIdList.add(prod.id);
   }
   
   for(ccrz__E_Product__c ccProd : [select id,name,Zuora_Product_Id__c from ccrz__E_Product__c where Zuora_Product_Id__c in :zProductIdList])
   {
   ProdtoCCProdMap.put(ccProd.Zuora_Product_Id__c,ccProd.id);
   }
  
  for(Product2 zprod : Trigger.new)
   {
    if(ProdtoCCProdMap.containskey(zprod.id))
     prodUpdateList.add(zprod);
    else
     prodInsertList.add(zprod);
   }
   
   if(!prodUpdateList.isEmpty())
    Product_Trigger_Helper.updateCCProductRecords(prodUpdateList);
  
   if(!prodInsertList.isEmpty())
    Product_Trigger_Helper.insertCCProductRecords(prodInsertList);
   
  }
  
  //Delete Operation
 else if(Trigger.IsDelete)
  {
   List<Id> zProductIdListDel = new List<Id>();
   
   for(Product2 prod : Trigger.old)
   {
    zProductIdListDel.add(prod.id);
   }
   
   List<ccrz__E_Product__c> ccProdDeleteList = [select id,name,Zuora_Product_Id__c from ccrz__E_Product__c where Zuora_Product_Id__c in :zProductIdListDel];
  
  if(!ccProdDeleteList.isEmpty())
  {
   delete ccProdDeleteList;
  }
   
  }
  

}