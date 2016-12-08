trigger CC_ecomm_CC_CoupnTrigger_sage on ccrz__E_Coupon__c(after insert) {
      
    system.enqueueJob(new cc_ecomm_Promotionrateplan (trigger.new[0]));
//    System.enqueueJob(new cc_ecomm_FutureCallouttoZuora (Quotes[0]));    

}