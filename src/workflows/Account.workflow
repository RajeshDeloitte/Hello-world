<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Partner_Approved_Email_to_Account_Owner</fullName>
        <description>Partner Tier Approved Email to Account Owner</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Secondary_PAM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Community_Emails/Partner_Approved_Partner_Tier_Email</template>
    </alerts>
    <alerts>
        <fullName>Partner_Tier_Not_Approved_Email_to_Account_Owner</fullName>
        <description>Partner Tier Not Approved Email to Account Owner</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Secondary_PAM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Community_Emails/Partner_Rejected_Partner_Tier_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Unlock_the_record</fullName>
        <description>This field update sets the flag to check in the Tier Approval Process for the Partner</description>
        <field>Record_Is_Locked__c</field>
        <literalValue>0</literalValue>
        <name>Set Account Record_Is_Locked to FALSE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Account_Record_Type</fullName>
        <description>Update Account Record Type to Partner Account</description>
        <field>RecordTypeId</field>
        <lookupValue>Partner_Account</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Account Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Partner_Account_Type</fullName>
        <field>Type</field>
        <literalValue>Partner</literalValue>
        <name>Update Partner Account Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>record_is_locked</fullName>
        <description>This field update sets the flag to check in the Tier Approval Process for the Partner</description>
        <field>Record_Is_Locked__c</field>
        <literalValue>1</literalValue>
        <name>Set Account Record_Is_Locked to TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Partner Account Record Type</fullName>
        <actions>
            <name>Update_Account_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Partner_Account_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow Rule to update Account Record Type as Partner Account</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,    CONTAINS( Lead_RecordType__c, &apos;Partner&apos;) )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
