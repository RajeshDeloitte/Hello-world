<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Active_Date</fullName>
        <description>Update the Last Updated Date to Today&apos;s value for reference on the Community T&amp;Cs</description>
        <field>Last_Updated__c</field>
        <formula>Today()</formula>
        <name>Update Active Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Last Updated Date Community T%26Cs</fullName>
        <actions>
            <name>Update_Active_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow Rule to set Last Updated Date for Community T&amp;Cs</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,   Active__c)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
