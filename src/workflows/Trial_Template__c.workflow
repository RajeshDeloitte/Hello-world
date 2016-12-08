<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Business_Type_Text</fullName>
        <field>Type_of_Business_Text__c</field>
        <formula>Text( Type_of_Business__c )</formula>
        <name>Update Business Type Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Product_Type_Text</fullName>
        <field>Product_Type_Text__c</field>
        <formula>Text(Product__c)</formula>
        <name>Update Product Type Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Product Type and Business Type</fullName>
        <actions>
            <name>Update_Business_Type_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Product_Type_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Product Type Text Field and Business Type Text on update of Product or Business picklist field.</description>
        <formula>AND(OR(ISCHANGED( Product__c ), ISCHANGED( Type_of_Business__c ), ISNEW()), $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
