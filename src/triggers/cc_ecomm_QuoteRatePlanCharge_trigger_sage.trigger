/*
Author Name: 1) Megha Mittal
2) Pankaj Kumar

Author Comments:
Trigger Description:
The trigger is fired before the insert of quote rate plan charge for a particular quote.
It fetches the Product rate plans for the particular quote rate plan charge and the promotions for this rate plan   
It maps the recent promotions data to the quote rate plan charge which then gets synced with zuora.
*/
trigger cc_ecomm_QuoteRatePlanCharge_trigger_sage on zqu__QuoteRatePlanCharge__c (before insert) {
    List<zqu__QuoteRatePlanCharge__c > quoterateplancharge=trigger.new;
    for(zqu__QuoteRatePlanCharge__c  qrpc:quoterateplancharge){
        system.debug('I am here');
        if(qrpc.zqu__model__c.containsIgnoreCase('Discount')){
            List<zqu__QuoteRatePlan__c>  qrp=[select name from zqu__QuoteRatePlan__c where id=:qrpc.zqu__QuoteRatePlan__c];
            String quote_Name = qrp[0].name;
            List<ccrz__E_Promo__c> cpn_promotions_dtls = [select Apply_Discount_To__c,No_Of_Months__c,Discount_Level__c,ccrz__Coupon__r.ccrz__DiscountAmount__c,ccrz__Coupon__r.ccrz__CouponName__c,ccrz__Coupon__r.ccrz__DiscountType__c from ccrz__E_Promo__c where ccrz__Coupon__r.ccrz__CouponName__c = :quote_Name];
            List<ccrz__E_Coupon__c> cpn_coupon=[select ccrz__DiscountAmount__c from ccrz__E_Coupon__c where ccrz__CouponName__c = :quote_Name];
            if (cpn_promotions_dtls .size() > 0 ){
                
                qrpc.zqu__EffectivePrice__c  = cpn_promotions_dtls [0].ccrz__Coupon__r.ccrz__DiscountAmount__c;
                if (cpn_promotions_dtls [0].Discount_Level__c.equalsIgnoreCase('subscription')) {
                        qrpc.zqu__Discount_Level__c = 'subscription' ;
                } 
                else{
                    qrpc.zqu__Discount_Level__c = 'account' ;
                }
                if(cpn_promotions_dtls[0].ccrz__Coupon__r.ccrz__CouponName__c.contains('Reporting'))
                {
                    qrpc.zqu__Discount_Level__c = 'RatePlan' ;
                }
                
                qrpc.zqu__Upto_How_Many_Periods__c = cpn_promotions_dtls[0].No_Of_Months__c;
                
                if (cpn_promotions_dtls [0].Apply_Discount_To__c.containsIgnoreCase('One Time')){ 
                    qrpc.zqu__Apply_Discount_To_One_Time_Charges__c= true; 
                } else { 
                    qrpc.zqu__Apply_Discount_To_One_Time_Charges__c= false;
                }
                
                if (cpn_promotions_dtls [0].Apply_Discount_To__c.containsIgnoreCase('recurring')) {
                    qrpc.zqu__Apply_Discount_To_Recurring_Charges__c= true; 
                    
                } else {
                    qrpc.zqu__Apply_Discount_To_Recurring_Charges__c= false;                     
                    
                }
                
                if (cpn_promotions_dtls [0].Apply_Discount_To__c.containsIgnoreCase('usage')) {
                    qrpc.zqu__Apply_Discount_To_Usage_Charges__c= true;     
                } else {
                    qrpc.zqu__Apply_Discount_To_Usage_Charges__c= false;
                }
                
                qrpc.zqu__EndDateCondition__c = 'Fixed Period';
                qrpc.zqu__Upto_How_Many_Periods_Type__c   = 'Months';    
                
            }
            else if(cpn_coupon.size()>0){
                qrpc.zqu__EffectivePrice__c  = cpn_coupon[0].ccrz__DiscountAmount__c;
            }
        }
    }
}