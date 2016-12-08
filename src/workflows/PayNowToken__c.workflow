<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>PayNow No Payment Received</fullName>
        <active>true</active>
        <formula>AND(  $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,  Status__c  &lt;&gt; &quot;Payment Provided&quot; )</formula>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Payment_Information_Not_Received</name>
                <type>Task</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Payment_Information_Not_Received</fullName>
        <assignedToType>owner</assignedToType>
        <description>Add activity to the creator of the purchase request token to make them aware when a payment has not been received.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>PayNowToken__c.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Waiting on someone else</status>
        <subject>Payment Information Not Received</subject>
    </tasks>
</Workflow>
