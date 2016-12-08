/** 
 *author Original : Swapnil Gorane - Accenture, Last Modified: Swapnil Gorane
 *date Original : 19 July 2016, Last Modified: 19 July 2016
 *description : This Trigger is created for ENHC0010597, to assigned new lead containt with original lead and assign lead to same user. 
 **/
trigger LeadAssignmentTrigger on Lead (before insert , after insert, Before delete , before update) {
       
    if(Trigger.isBefore && Trigger.isInsert){
        LeadAssignmentTriggerHandler.onBeforInsert(trigger.new);
    }
    else if(Trigger.isAfter && Trigger.isInsert){
        LeadAssignmentTriggerHandler.onAfterInsert(trigger.new);
    }
    else if(Trigger.isBefore && Trigger.isDelete){
        LeadAssignmentTriggerHandler.onAfterDelete(Trigger.old);
    }
    else if(Trigger.isBefore && Trigger.isUpdate){
        List<Lead> NewLeadstatus = new List<Lead>();
        List<Lead> NewLeadEmails = new List<Lead>();
        
        for(Lead ld :Trigger.new){
            if(ld.status != Trigger.oldMap.get(ld.id).status){
                NewLeadstatus.add(ld);
            }
            else if(ld.Email != Trigger.oldMap.get(ld.id).Email){
                NewLeadEmails.add(ld);
            }
        }
        LeadAssignmentTriggerHandler.onBeforeUpdateStatus(NewLeadstatus,Trigger.oldMap);
        LeadAssignmentTriggerHandler.onBeforeUpdateEmails(NewLeadEmails, Trigger.oldMap);
    }
}