trigger CC_ECOMM_Zinvoice_Trigger_Sage on Zuora__ZInvoice__c (after insert) {
    List<Zuora__ZInvoice__c > Zinvoicelist=trigger.new;
    for(Zuora__ZInvoice__c zinvoice:Zinvoicelist){
        ccrz__E_Invoice__c ccinvoice = new ccrz__E_Invoice__c();
        ccinvoice.ccrz__InvoiceId__c= Zinvoice.Name;
        ccinvoice.ccrz__Status__c = Zinvoice.Zuora__Status__c;
        ccinvoice.ccrz__OriginalAmount__c = Zinvoice.Zuora__TotalAmount__c;
        ccinvoice.ccrz__DateDue__c = zinvoice.Zuora__DueDate__c;
        ccinvoice.ccrz__DateIssued__c = zinvoice.Zuora__InvoiceDate__c;
        ccinvoice.CurrencyIsoCode=Zinvoice.CurrencyIsoCode;
        ccinvoice.ccrz__BillTo__c=Zinvoice.Zuora__Account__c;
        ccinvoice.ccrz__Contact__c=Zinvoice.Zuora__BillToId__c;
        system.debug('Zinvoice.Zuora__SoldToId__c'+Zinvoice.Zuora__SoldToId__c);
        ccinvoice.ccrz__SoldTo__c=Zinvoice.Zuora__SoldToId__c;
        ccinvoice.ccrz__InvoiceId__c=Zinvoice.Name;
        ccinvoice.ccrz__RemainingAmount__c=Zinvoice.Zuora__Balance2__c;
        insert ccinvoice;
    }
}