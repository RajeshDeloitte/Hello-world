trigger Quotes_on_orderitems on ccrz__E_OrderItem__c(after insert) 
{
    if(trigger.isinsert)
    {
        map<string,string> ccSKU= new map<string,string>();
        List<id> ccorderitemids= new list<id>();
        List<id> ccorderids = new list<id>();        
        map<string,id> ccprodids = new map<string,id>();        
        map<string,id> ccCoupon = new map<string,id>();
        map<string,decimal> ccQuantity= new map<string,decimal>();
        for(ccrz__E_OrderItem__c ccitem:trigger.new)
        {
            ccorderitemids.add(ccitem.id);
            ccprodids.put(ccitem.name,ccitem.ccrz__Product__c);
            if(ccitem.ccrz__Coupon__c!=null)
            {
                system.debug('Coupon code'+ccitem.ccrz__Coupon__c);
                ccCoupon.put(ccitem.name,ccitem.ccrz__Coupon__c);
                
            }
            ccQuantity.put(ccitem.name,ccitem.ccrz__Quantity__c);
            ccorderids.add(ccitem.ccrz__Order__c);
        }
        system.debug('ccCoupon.values()'+cccoupon.values());
        map<id,string> qidpridcoupon=new map<id,string>();
        map<id,decimal> qidquantity=new map<id,decimal>();
        system.debug('ccprodids'+ccprodids);
        map<id,string> ccprolist= new map<id,string>();
        for(ccrz__E_Product__c s: [select id,ccrz__SKU__c from ccrz__E_Product__c where id in : ccprodids.values()])
        {
            ccprolist.put(s.id,s.ccrz__SKU__c);
        }
        map<id,string> ccCouponlist= new map<id,string>();        
        for(ccrz__E_Coupon__c s: [select id,ccrz__CouponName__c from ccrz__E_Coupon__c where id in : ccCoupon.values()])
        {
            ccCouponlist.put(s.id,s.ccrz__CouponName__c);
        } 
        map<string,ccrz__E_Subscription__c> subscriptionordermap= new map<string,ccrz__E_Subscription__c>();
        system.debug('trrigger'+trigger.newMap.keySet());
        system.debug('orderitemid'+ccorderitemids);
        system.debug('query'+[select ccrz__CCOrderItem__r.name,ccrz__SPT__r.name,ccrz__SPT__c from ccrz__E_Subscription__c where ccrz__CCOrderItem__c in :ccorderitemids]);
        for(ccrz__E_Subscription__c subs: [select ccrz__CCOrderItem__r.name,ccrz__SPT__r.name,ccrz__SPT__c from ccrz__E_Subscription__c where ccrz__CCOrderItem__c in :ccorderitemids])
        {
            subscriptionordermap.put(subs.ccrz__CCOrderItem__r.name,subs);
        }
        system.debug('subscriptionordermap'+subscriptionordermap);
        system.debug('ccprolist'+ccCouponlist);
        
        map<string,string> ordername=new map<string,string>();
        map<id,id> qidprid=new map<id,id>();
        map<string,id> ccprodlist=new Map<string, id>();
        system.debug('query'+[select id,zqu__SKU2__c from product2 where zqu__SKU2__c in: ccprolist.values()]);
        for(product2 pr:[select id,zqu__SKU2__c from product2 where zqu__SKU2__c in: ccprolist.values()])
        {
            ccprodlist.put(pr.zqu__SKU2__c,pr.id);
        }
        system.debug('ccprodlist'+ccprodlist);
        map<string,string> orderproductname = new map<string,string>();
        for(String s:ccprodids.keyset())
        {       
                system.debug('check'+ccprodlist.get(ccprolist.get(ccprodids.get(s))));
                system.debug('q1'+ccprodids.get(s));
                orderproductname.put(s,ccprodlist.get(ccprolist.get(ccprodids.get(s))));
        }
        system.debug('orderproductname'+orderproductname);
        
        map<string,string> ordercoupon=new map<string,string>();
        for(string s:ccCoupon.keyset())
        {
            ordercoupon.put(s,ccCouponlist.get(cccoupon.get(s)));
        }
        system.debug('ordercoupn'+orderCoupon);
        
        map<id,ccrz__E_Order__c> ccaccountlist=new Map<ID, ccrz__E_Order__c>([select id,ccrz__Account__c,ccrz__Contact__c from ccrz__E_Order__c where id in:ccorderids ]);
        
        List<Zqu__quote__C> quotes=new List<Zqu__quote__c>();
        
        for(ccrz__E_OrderItem__c ccitem:trigger.new)
        {
            zqu__Quote__c q= new zqu__Quote__c(Name=ccitem.name);
            q.zqu__Account__c=ccaccountlist.get(ccitem.ccrz__Order__c).ccrz__Account__c;
            q.zqu__ApplyCreditBalance__c=   false;
            q.zqu__ApprovalStatus__c='Approved'; 
            q.zqu__AutoRenew__c =false;
            q.zqu__BillCycleDay__c= '1';
            q.zqu__BillingBatch__c  ='Batch1';
            q.zqu__BillingMethod__c=    'Email';
            q.zqu__BillToContact__c =ccaccountlist.get(ccitem.ccrz__Order__c).ccrz__Contact__c;
            q.zqu__Currency__c= 'USD';
            q.zqu__GenerateInvoice__c=  false;
            q.zqu__InitialTerm__c=  12.0;
            q.zqu__InvoiceProcessingOption__c=  'Subscription';
            q.zqu__InvoiceSeparately__c =false;
            q.zqu__Is_Charge_Expired__c=    false;
            q.zqu__Is_Parent_Quote__c   =false;
            q.zqu__PaymentMethod__c ='Credit Card';
            q.zqu__PaymentTerm__c=  'Net 30';
            q.zqu__Primary__c=  true;
            q.zqu__ProcessPayment__c=   false;
            q.zqu__RenewalSetting__c    ='RENEW_WITH_SPECIFIC_TERM';
            q.zqu__RenewalTerm__c=  12.0;
            q.zqu__SoldToContact__c =ccaccountlist.get(ccitem.ccrz__Order__c).ccrz__Contact__c;
            q.zqu__StartDate__c =system.today();
            q.zqu__SubscriptionType__c  ='New Subscription';
            q.zqu__Subscription_Term_Type__c=   'Termed';
            //q.zqu__ZuoraEntityId__c= '11e643f4a41c9e7fb0610025904c57d6';
            q.zqu__BillingEntity__c='a2W7E0000006G08UAE';
            quotes.add(q);
            //ordername.put(ccitem.name,orderproductname.get(ccitem.name)); 
        }
        insert quotes;
        //system.debug('ordername'+ordername);
        for(Zqu__quote__C q:quotes)
        {
            if(orderCoupon.get(q.name)!=null)
                qidpridcoupon.put(q.id,orderCoupon.get(q.name));
            
            qidprid.put(q.id,orderproductname.get(q.name));
            qidquantity.put(q.id,ccquantity.get(q.name));
            
            
        }
        
        system.debug('qidprid'+qidprid);
        system.debug('qidpridcoupon'+qidpridcoupon);
        helperinsertquote.addchargegroupmethodbymap(qidprid,qidquantity);
        helperinsertquote.addchargegroupmethodbymaponCoupon(qidpridcoupon);
    }
     
}