trigger SageApiActivityTrigger on SageApiActivity__c (after insert) {
    SageApiActivityTriggerHandler handler = new SageApiActivityTriggerHandler();

    if (Application_Control__c.getOrgDefaults().Run_Triggers__c &&
        CBC_Application_Control__c.getOrgDefaults().Run_Triggers__c) {

        /* After Insert */
        if (Trigger.isAfter && Trigger.isInsert) {
            handler.onAfterInsert(Trigger.new, Trigger.newMap);
        }
    }
}