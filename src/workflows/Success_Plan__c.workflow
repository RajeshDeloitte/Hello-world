<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_New_Customer_Org_Country_to_GB</fullName>
        <description>Field Update to set the New Customer Org Country field to GB.</description>
        <field>Trial_Country__c</field>
        <literalValue>GB</literalValue>
        <name>Set New Customer Org Country to GB</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_New_Customer_Org_Country_to_IE</fullName>
        <description>Field Update to set the New Customer Org Country field to IE.</description>
        <field>Trial_Country__c</field>
        <literalValue>IE</literalValue>
        <name>Set New Customer Org Country to IE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_New_Customer_Org_Country_to_US</fullName>
        <description>Field Update to set the New Customer Org Country field to US.</description>
        <field>Trial_Country__c</field>
        <literalValue>US</literalValue>
        <name>Set New Customer Org Country to US</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Type_to_Onboarding</fullName>
        <description>Field Update to set the Type of the Success Plan to Onboarding</description>
        <field>Type__c</field>
        <literalValue>Onboarding</literalValue>
        <name>Set Type to Onboarding</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Type_to_Trial</fullName>
        <description>Field Update to set the Type of the Success Plan to Trial</description>
        <field>Type__c</field>
        <literalValue>Trial</literalValue>
        <name>Set Type to Trial</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Success_Plan_Type_Text</fullName>
        <description>Update Type Text on Success Plan to allow this field to be searched on and also to allow it to be used in Publisher Action Predefined Field Values.</description>
        <field>Type_Text__c</field>
        <formula>TEXT( Type__c )</formula>
        <name>Update Success Plan Type Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Trial_Country_Text</fullName>
        <field>Trial_Country_Text__c</field>
        <formula>Text( Trial_Country__c )</formula>
        <name>Update Trial Country Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Default New Customer Org Country to GB</fullName>
        <actions>
            <name>Set_New_Customer_Org_Country_to_GB</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Trial_Country_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow Rule to default the New Customer Org Country of the Success Plan to GB when the Customer Org Admin Contact&apos;s Mailing Address Country Code is GB</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,  OR( ISCHANGED( Trial_Contact__c ), ISNEW() ), TEXT( Trial_Contact__r.MailingCountryCode ) = &quot;GB&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Default New Customer Org Country to IE</fullName>
        <actions>
            <name>Set_New_Customer_Org_Country_to_IE</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Trial_Country_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow Rule to default the New Customer Org Country of the Success Plan to IE when the Customer Org Admin Contact&apos;s Mailing Address Country Code is IE</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,  OR( ISCHANGED( Trial_Contact__c ), ISNEW() ), TEXT( Trial_Contact__r.MailingCountryCode ) = &quot;IE&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Default New Customer Org Country to US</fullName>
        <actions>
            <name>Set_New_Customer_Org_Country_to_US</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Trial_Country_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow Rule to default the New Customer Org Country of the Success Plan to US when the Customer Org Admin Contact&apos;s Mailing Address Country Code is US</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,  OR( ISCHANGED( Trial_Contact__c ), ISNEW() ), TEXT( Trial_Contact__r.MailingCountryCode ) = &quot;US&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Default Type to Onboarding</fullName>
        <actions>
            <name>Set_Type_to_Onboarding</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Success_Plan_Type_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow Rule to default the Type of the Success Plan to Onboarding when the Probability of the Opportunity that the Success Plan is related to is equal to 100%</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,  NOT( ISBLANK( Opportunity__c )), Opportunity__r.Probability = 1 )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Default Type to Trial</fullName>
        <actions>
            <name>Set_Type_to_Trial</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Success_Plan_Type_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow Rule to default the Type of the Success Plan to Trial when the Probability of the Opportunity that the Success Plan is related to is less than 100%</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,  NOT( ISBLANK( Opportunity__c )), Opportunity__r.Probability &lt; 1 )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Success Plan Type Text</fullName>
        <actions>
            <name>Update_Success_Plan_Type_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Type Text field on change of Type Picklist field. This will allow this field to be searched on and also to allow it to be used in Publisher Actions.</description>
        <formula>AND(OR(ISCHANGED( Type__c ), ISNEW()),$Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Trial Country Text</fullName>
        <actions>
            <name>Update_Trial_Country_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Country Text field on change of Country Picklist field. This will allow this field to be searched on and also to allow it to be used in Publisher Actions.</description>
        <formula>AND(OR(ISCHANGED( Trial_Country__c ), ISNEW()),$Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
