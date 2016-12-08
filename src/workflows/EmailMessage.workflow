<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Case_Status_to_be</fullName>
        <description>Field update triggered to set Case Status to be Updated by Customer when an email is received into an existing Case</description>
        <field>Status</field>
        <literalValue>Updated by Customer</literalValue>
        <name>Update Case Status to Updated by Cust</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Update Case with Email received</fullName>
        <actions>
            <name>Update_Case_Status_to_be</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>EmailMessage.Incoming</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>notEqual</operation>
            <value>Archived Cases from Emails</value>
        </criteriaItems>
        <description>Rule to Update Case Status with Updated by Customer when an email has been received.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
