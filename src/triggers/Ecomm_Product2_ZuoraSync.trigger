trigger Ecomm_Product2_ZuoraSync on Product2 (after insert, after update) {
    List<Product2> ProductCatalog = Trigger.new;
    List<Zuora.zObject> Products = new List<Zuora.zObject>();
    
    if(trigger.isinsert){
    
        Ecomm_ProductsyncZuorahelperClass EcommZuoraSync = new Ecomm_ProductsyncZuorahelperClass (ProductCatalog);
        EcommZuoraSync.syncProductDatatoZuora();
        system.enqueueJob(EcommZuoraSync );
    }
    if(trigger.isupdate && Ecomm_ProductsyncZuorahelperClass.ExecuteUpdate==true){
        
    }

}