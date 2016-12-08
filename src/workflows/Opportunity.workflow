<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Clear_Confirm_Correct_License</fullName>
        <field>Confirm_Correct_License__c</field>
        <literalValue>0</literalValue>
        <name>Clear Confirm Correct License</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_License_Populated_By</fullName>
        <field>License_Populated_By__c</field>
        <name>Clear License Populated By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Field_is_03</fullName>
        <description>Updates the field to Now()</description>
        <field>Stage_is_03__c</field>
        <formula>NOW()</formula>
        <name>Update Field is 03</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_License_Updated_By</fullName>
        <field>License_Populated_By__c</field>
        <literalValue>Manual Update</literalValue>
        <name>Update License Updated By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opportunity_Close_Date</fullName>
        <field>CloseDate</field>
        <formula>Today() + 45</formula>
        <name>Update Opportunity Close Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opportunity_Type_Add_On_Business</fullName>
        <field>Type</field>
        <literalValue>Add-on Business</literalValue>
        <name>Update Opportunity Type Add On Business</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opportunity_Type_New_Business</fullName>
        <field>Type</field>
        <literalValue>New Business</literalValue>
        <name>Update Opportunity Type New Business</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Clear License Updated By</fullName>
        <actions>
            <name>Clear_Confirm_Correct_License</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_License_Populated_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(  ISBLANK(License__c) , $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stage is 03</fullName>
        <actions>
            <name>Update_Field_is_03</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When stage selected is 03</description>
        <formula>AND( ISPICKVAL( StageName , &quot;03 Evaluating&quot;),NOT(ISBLANK( earliest_demo_create_date__c )) )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update License Updated By</fullName>
        <actions>
            <name>Update_License_Updated_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Rule to set the License Updated By field to &quot;Manually Update&quot; when the License is changed through the UI rather than by the Signup Request Trigger.</description>
        <formula>AND(  NOT(ISBLANK(License__c)), ISCHANGED( License__c),NOT(ISCHANGED(License_Populated_By__c)) , $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Opportunity Close Date</fullName>
        <actions>
            <name>Update_Opportunity_Close_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set Opportunity Close Date to be Today + 45 on Lead Conversion</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c, Is_Converted__c )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Opportunity Type to Add On Business</fullName>
        <actions>
            <name>Update_Opportunity_Type_Add_On_Business</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Rule to set the Opportunity Type picklist field to New Business on Opportunity creation if the custom Opportunity Type field is set to &quot;Add On Business&quot;.  This is required because it is not possible to set a picklist field during Lead Conversion Mapping.</description>
        <formula>AND( Text(Opportunity_Type__c) == &apos;Add-on Business&apos;, $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Opportunity Type to New Business</fullName>
        <actions>
            <name>Update_Opportunity_Type_New_Business</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Rule to set the Opportunity Type picklist field to New Business on Opportunity creation if the custom Opportunity Type field is set to &quot;New Business&quot;.  This is required because it is not possible to set a picklist field during Lead Conversion Mapping.</description>
        <formula>AND( Text(Opportunity_Type__c) == &apos;New Business&apos;, $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
