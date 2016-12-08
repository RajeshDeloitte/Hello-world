trigger LeadTrigger on Lead (after update,before update, before insert) {
    LeadTriggerHandler hndlr = new LeadTriggerHandler();
    if(Trigger.isUpdate && Trigger.isBefore){
       /* if(LeadTriggerHandler.runOnce()){//round robin disabled
            LeadTriggerHandler.onAfterInsert(trigger.new);
            system.debug('@@@@@ Enter trigger');
        }*/
    }
    if(Trigger.isInsert && Trigger.isBefore){
        LeadTriggerHandler.LeadSourceMostRecentToLeadSource(trigger.new);
    }
    
}