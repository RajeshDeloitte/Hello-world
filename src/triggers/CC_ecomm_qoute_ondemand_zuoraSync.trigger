trigger CC_ecomm_qoute_ondemand_zuoraSync on zqu__Quote__c (after update) {
      
          
          List<zqu__Quote__c > zquotes=trigger.new;
    
          for(zqu__Quote__c  zquote:zquotes)
          {

              if(zquote.zqu__Status__c=='Sent to Z-Billing')
              {
                  
                  Zuora.OnDemandSyncManager syncManager = new Zuora.OnDemandSyncManager();
                  set<string> syncidaccountset=new set<string>();
                  syncidaccountset.add('2c92c0f95847b07a01584e0e74f37917');//only for portal account(for POC). to be changed
                  syncManager.syncZuoraObjectIdSet = syncidaccountset;
                  if(test.isrunningtest()==false){
                      List<Zuora.SyncResult> syncResult =syncManager.sendRequest();
                  }
                 
              }
          
       }


}