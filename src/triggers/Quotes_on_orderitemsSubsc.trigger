trigger Quotes_on_orderitemsSubsc on ccrz__E_Subscription__c(after insert) 
{
    if(trigger.isinsert)
    {
        List<id> subsid=new list<id>();
        List<id> subsidorder= new list<id>();
        map<id,id> subsgrp=new map<id,id>();
        map<Id,string> ordername1=new map<id,string>();
        for(ccrz__E_Subscription__c sub: trigger.new)
        {
            subsidorder.add(sub.ccrz__CCOrder__c);
            subsid.add(sub.ccrz__CCOrderItem__c);
            subsgrp.put(sub.ccrz__CCOrder__c,sub.ccrz__CCOrderItem__c);
        }
        map<id,List<string>> orderprodname=new map<id,List<string>>();
        List<ccrz__E_OrderItem__c> orderitemlist=[select id,name,ccrz__Product__c,ccrz__Quantity__c,ccrz__Coupon__c,ccrz__Order__c from ccrz__E_OrderItem__c where id in:subsid];
        for(ccrz__E_OrderItem__c c:orderitemlist)
        {
            ordername1.put(c.id,c.name);
        }      
        //system.debug('ordername1'+ordername1);
        for(ccrz__E_OrderItem__c c: [select ccrz__Order__c,ccrz__Product_Name__c from  ccrz__E_OrderItem__c  where ccrz__Order__c in: subsidorder])
        {
            if(orderprodname.get(c.ccrz__Order__c)==null)
            {
                orderprodname.put(c.ccrz__Order__c,new list<string>());
            }
            orderprodname.get(c.ccrz__Order__c).add(c.ccrz__Product_Name__c);
        }        
        map<id,list<String>> finalmap=new map<id,list<string>>();
        for(id i:subsgrp.keyset())
        {
            finalmap.put(subsgrp.get(i),orderprodname.get(i));
        }
        //system.debug('finalmap'+finalmap);
        map<string,list<String>> finalmap1=new map<string,list<string>>();
        for(id c:finalmap.keyset())
        {
            //system.debug('here');
            finalmap1.put(ordername1.get(c),finalmap.get(c));
        }
        //system.debug('finalmap1'+finalmap1);
        map<string,string> ccSKU= new map<string,string>();
        List<id> ccorderitemids= new list<id>();
        List<id> ccorderids = new list<id>();        
        map<string,id> ccprodids = new map<string,id>();        
        map<string,id> ccCoupon = new map<string,id>();
        map<string,decimal> ccQuantity= new map<string,decimal>();

        for(ccrz__E_OrderItem__c ccitem:orderitemlist)
        {
            ccorderitemids.add(ccitem.id);
            ccprodids.put(ccitem.name,ccitem.ccrz__Product__c);
            if(ccitem.ccrz__Coupon__c!=null)
            {
                //system.debug('Coupon code'+ccitem.ccrz__Coupon__c);
                ccCoupon.put(ccitem.name,ccitem.ccrz__Coupon__c);
                
            }
            ccQuantity.put(ccitem.name,ccitem.ccrz__Quantity__c);
            ccorderids.add(ccitem.ccrz__Order__c);
        }
        //system.debug('ccCoupon.values()'+cccoupon.values());
        
        map<id,string> qidpridcoupon=new map<id,string>();
        map<id,decimal> qidquantity=new map<id,decimal>();
        //system.debug('ccprodids'+ccprodids);
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
        
        map<string,string> subscriptionordermap= new map<string,string>();
        //system.debug('trrigger'+trigger.newMap.keySet());
        //system.debug('orderitemid'+ccorderitemids);
        //system.debug('query'+[select ccrz__CCOrderItem__r.name,ccrz__SPT__r.name,ccrz__SPT__c from ccrz__E_Subscription__c where ccrz__CCOrderItem__c in :ccorderitemids]);
        for(ccrz__E_Subscription__c subs: [select ccrz__CCOrderItem__r.name,ccrz__SPT__r.name,ccrz__SPT__c from ccrz__E_Subscription__c where ccrz__CCOrderItem__c in :ccorderitemids])
        {
            subscriptionordermap.put(subs.ccrz__CCOrderItem__r.name,subs.ccrz__SPT__r.name);
        }
        //system.debug('subscriptionordermap'+subscriptionordermap);
        
        
        
        map<string,string> ordername=new map<string,string>();
        map<id,id> qidprid=new map<id,id>();
        map<id,string> qidsubsid=new map<id,string>();
        map<string,id> ccprodlist=new Map<string, id>();
        //system.debug('query'+[select id,zqu__SKU2__c from product2 where zqu__SKU2__c in: ccprolist.values()]);
        for(product2 pr:[select id,zqu__SKU2__c from product2 where zqu__SKU2__c in: ccprolist.values()])
        {
            ccprodlist.put(pr.zqu__SKU2__c,pr.id);
        }
        //system.debug('ccprodlist'+ccprodlist);
        map<string,string> orderproductname = new map<string,string>();
        for(String s:ccprodids.keyset())
        {       
                //system.debug('check'+ccprodlist.get(ccprolist.get(ccprodids.get(s))));
                //system.debug('q1'+ccprodids.get(s));
                orderproductname.put(s,ccprodlist.get(ccprolist.get(ccprodids.get(s))));
        }
        //system.debug('orderproductname'+orderproductname);
        
        map<string,string> ordercoupon=new map<string,string>();
        for(string s:ccCoupon.keyset())
        {
            ordercoupon.put(s,ccCouponlist.get(cccoupon.get(s)));
        }
        //system.debug('ordercoupn'+orderCoupon);
        
        map<id,ccrz__E_Order__c> ccaccountlist=new Map<ID, ccrz__E_Order__c>([select id,ccrz__Account__c,ccrz__Contact__c from ccrz__E_Order__c where id in:ccorderids ]);
        
        List<Zqu__quote__C> quotes=new List<Zqu__quote__c>();
        
        for(ccrz__E_OrderItem__c ccitem:orderitemlist)
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
            q.zqu__ZuoraAccountID__c= '2c92c0f95847b07a01584e0e74f37917';
            q.zqu__BillingEntity__c='a2W7E0000006G08UAE';
            quotes.add(q);
            //ordername.put(ccitem.name,orderproductname.get(ccitem.name)); 
        }
        insert quotes;
        ////system.debug('ordername'+ordername);
        map<id,list<string>> qidspayroll = new map<id,list<string>>();
        for(Zqu__quote__C q:quotes)
        {
            if(orderCoupon.get(q.name)!=null)
                qidpridcoupon.put(q.id,orderCoupon.get(q.name));
            
            qidprid.put(q.id,orderproductname.get(q.name));
            qidquantity.put(q.id,ccquantity.get(q.name));
            qidsubsid.put(q.id,subscriptionordermap.get(q.name));
            qidspayroll.put(q.id,finalmap1.get(q.name)) ;
            
        }
        
        //system.debug('qidprid'+qidprid);
        //system.debug('qidpridcoupon'+qidpridcoupon);
        helperinsertquote.addchargegroupmethodbymap(qidprid,qidquantity,qidsubsid,qidspayroll);
        helperinsertquote.addchargegroupmethodbymaponCoupon(qidpridcoupon);
    }
     
}