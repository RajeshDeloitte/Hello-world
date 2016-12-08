/*
Author Details: Megha Mittal

Author Comments: This trigger works on the creation of Quotes in Zuora.
The trigger accesses objects:
    1) CC Orders
    2) CC Order Items
    3) CC Coupons
    4) CC Promotions
    
Helper Class Related to the trigger:
    1) QuoteInsertHelperClass


*/
trigger CC_ecomm_Subscription_trigger_sage on ccrz__E_Subscription__c(after insert) {
    if(trigger.isinsert)    {
    
        //Variable Declaration
        map<id,id> Ordertoorderitem=new map<id,id>();
        List<Zqu__quote__C> quotes;
        map<id,id> Orderitemtoorder=new map<id,id>();
        map<Id,string> orderitemname=new map<id,string>();
        set<id> Orderitems=new set<id>();
        map<id,List<string>> orderprodname=new map<id,List<string>>();
        map<id,string> qidpridcoupon=new map<id,string>();
        map<id,decimal> qidquantity=new map<id,decimal>();
        map<id,string> ccprolist= new map<id,string>();
        map<id,list<String>> Orderitemprod=new map<id,list<string>>();
        List<ccrz__E_OrderItem__c> orderitemsforquotes=new list<ccrz__E_OrderItem__c>();
        map<string,string> ccSKU= new map<string,string>();
        List<id> ccorderitemids= new list<id>();
        List<id> ccorderids = new list<id>();        
        map<string,id> ccprodids = new map<string,id>();        
        map<string,id> ccCoupon = new map<string,id>();
        map<string,decimal> ccQuantity= new map<string,decimal>();
        map<id,string> ccCouponlist= new map<id,string>();       
        map<id,id> qidprid=new map<id,id>();
        map<id,string> qidsubscrpid=new map<id,string>();
        map<string,id> ccprodlist=new Map<string, id>();
        map<id,list<string>> qidspayroll = new map<id,list<string>>();  
        map<string,string> subscriptionordermap= new map<string,string>();
        map<string,list<String>> orderitemnameprods=new map<string,list<string>>();
        map<string,string> orderproductname = new map<string,string>();
        map<string,string> ordercoupon=new map<string,string>();
        
        //Map to relate the orderitems with corresponding order items
        for(ccrz__E_Subscription__c sub: trigger.new){
            Ordertoorderitem.put(sub.ccrz__CCOrder__c,sub.ccrz__CCOrderItem__c);

        }        
        orderitems.addAll(Ordertoorderitem.values());//List of all order items

        //Fetch all the order items for the orders which have been created. 
        List<ccrz__E_OrderItem__c> orderitemlist=[select id,name,ccrz__Product__c,ccrz__ProductType__c,ccrz__Product_Name__c,ccrz__Quantity__c,ccrz__Coupon__c,ccrz__Order__c from ccrz__E_OrderItem__c where ccrz__Order__c in: Ordertoorderitem.keyset()];
        for(ccrz__E_OrderItem__c c:orderitemlist){
            if(orderitems.contains(c.id)){
                orderitemname.put(c.id,c.name);
                orderitemsforquotes.add(c);
            }
            if(c.ccrz__ProductType__c!='Coupon'){
                if(orderprodname.get(c.ccrz__Order__c)==null){
                    orderprodname.put(c.ccrz__Order__c,new list<string>());
                }
                orderprodname.get(c.ccrz__Order__c).add(c.ccrz__Product_Name__c);
            }
        }          
        for(id i:Ordertoorderitem.keyset()){
            orderitemnameprods.put(orderitemname.get(Ordertoorderitem.get(i)),orderprodname.get(i));
        }
        
        //for fetching quantity of order item in CC
        for(ccrz__E_OrderItem__c ccitem:orderitemlist){
            ccprodids.put(ccitem.name,ccitem.ccrz__Product__c);
            if(ccitem.ccrz__Coupon__c!=null){
                ccCoupon.put(ccitem.ccrz__Order__c ,ccitem.ccrz__Coupon__c);
            }
            ccQuantity.put(ccitem.name,ccitem.ccrz__Quantity__c);    
        }
        
        //for fetching the product 2 for the order items on the basis of SKU
        for(ccrz__E_Product__c s: [select id,ccrz__SKU__c from ccrz__E_Product__c where id in : ccprodids.values()]){
            ccprolist.put(s.id,s.ccrz__SKU__c);
        }
        if(test.isrunningtest()==true){
            for(ccrz__E_Product__c pr:[select id,ccrz__SKU__c,ccrz__ProductId__c from ccrz__E_Product__c where id in : ccprodids.values()]){
                ccprodlist.put(pr.ccrz__SKU__c,pr.ccrz__ProductId__c);
            }
            
        } else {
            for(product2 pr:[select id,zqu__SKU2__c from product2 where zqu__SKU2__c in: ccprolist.values()]){
                ccprodlist.put(pr.zqu__SKU2__c,pr.id);
            }
        }
        for(String s:ccprodids.keyset()){       
                orderproductname.put(s,ccprodlist.get(ccprolist.get(ccprodids.get(s))));
        }
        
        //fetching the coupon related to any of the order item in the order
        for(ccrz__E_Coupon__c s: [select id,ccrz__CouponName__c from ccrz__E_Coupon__c where id in : ccCoupon.values()]){
            ccCouponlist.put(s.id,s.ccrz__CouponName__c);
        }
        for(string s:ccCoupon.keyset()){
            ordercoupon.put(orderitemname.get(ordertoorderitem.get(s)),ccCouponlist.get(cccoupon.get(s)));
        }       
        
        
        //fetching the SPT name for subscription for the particular order
        for(ccrz__E_Subscription__c subs: [select ccrz__CCOrderItem__r.name,ccrz__SPT__r.name,ccrz__SPT__c from ccrz__E_Subscription__c where ccrz__CCOrderItem__c in :orderitemname.keyset()]){
            subscriptionordermap.put(subs.ccrz__CCOrderItem__r.name,subs.ccrz__SPT__r.name);
        }
        
        //Fetch the order details for mapping the fields in the quote
        map<id,ccrz__E_Order__c> ccaccountlist=new Map<ID, ccrz__E_Order__c>([select id,name,ccrz__Account__c,ccrz__Contact__c from ccrz__E_Order__c where id in:Ordertoorderitem.keyset()]);
        
        //Calling the helper class method which will insert the quotes.
        quotes=cc_ecomm_QuoteInsertHelperClass.insertQuote(orderitemsforquotes,ccaccountlist);
        
        
        for(Zqu__quote__C q:quotes){
            for(String s:orderitemname.values()){
                if(orderCoupon.get(q.name)!=null){
                    qidpridcoupon.put(q.id,orderCoupon.get(q.name));//Mapping the Coupon related to any order item for the particular order.
                    
                    if(orderCoupon.get(q.name).contains('Reporting'))
                    {
                        List<String> Product=orderitemnameprods.get(q.name);
                        orderitemnameprods.remove(q.name);
                        orderitemnameprods.put(q.name,new list<string>());
                        system.debug('orderitemnameprods'+orderitemnameprods);
                        for(string s1:Product)
                        {
                            if(!s1.contains('Reporting')){
                                orderitemnameprods.get(q.name).add(s1);
                            }
                        }
                        system.debug('orderitemnameprods'+orderitemnameprods);
                        
                    }
                }
            }
            qidprid.put(q.id,orderproductname.get(q.name));//mapping the quote to products which will help in fetching the product rate plans related to the products
            qidquantity.put(q.id,ccquantity.get(q.name));//mapping the quantity ordered for the partricular quote
            qidsubscrpid.put(q.id,subscriptionordermap.get(q.name));//mapping the subscription with quote for fetching the product rate plans
            qidspayroll.put(q.id,orderitemnameprods.get(q.name)) ;//mapping the addons details to quote
            
        }        
        //The below to methods are used for attaching the quote rate plan charge to the particular quote.
        cc_ecomm_QuoteInsertHelperClass.addChargeGroupForProductsAndAddons(qidprid,qidquantity,qidsubscrpid,qidspayroll);
        cc_ecomm_QuoteInsertHelperClass.addChargeGroupForCoupon(qidpridcoupon);
        //cc_ecomm_FutureCallouttoZuora futureclass= new cc_ecomm_FutureCallouttoZuora (Quotes[0]);
        //Queueablecontext qc= new Queueablecontext();
        System.enqueueJob(new cc_ecomm_FutureCallouttoZuora (Quotes[0]));

    }
     
}