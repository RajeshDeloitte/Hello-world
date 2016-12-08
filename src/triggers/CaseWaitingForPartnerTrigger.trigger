trigger CaseWaitingForPartnerTrigger on Case (before insert, before update) {
    CaseWaitingForPartnerHandler obj = new CaseWaitingForPartnerHandler();
    
    if(Trigger.isInsert) {
        obj.forInsert(Trigger.new);
    }
    else if(Trigger.isUpdate) {
        obj.forUpdate(Trigger.old, Trigger.new);
    }
}