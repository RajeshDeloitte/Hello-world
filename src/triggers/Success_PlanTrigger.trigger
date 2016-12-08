trigger Success_PlanTrigger on Success_Plan__c (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            Success_PlanTriggerHandler.onAfterInsert(Trigger.New);
        }
    }
}