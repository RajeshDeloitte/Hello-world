trigger opportunityTrigger on Opportunity (after update, before update) {
    if(trigger.isAfter){
        if(trigger.isUpdate){
            opportunityTriggerHandler.afterUpdate(trigger.oldMap, trigger.new);
        }
    }
    if(trigger.isBefore){
        if(trigger.isUpdate){
            //opportunityTriggerHandler.beforeUpdate(trigger.oldMap, trigger.newMap, trigger.new);
        }
    }
}