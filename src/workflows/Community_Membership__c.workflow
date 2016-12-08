<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Partner_Community_Registration_Link</fullName>
        <description>Send Partner Community Registration Link</description>
        <protected>false</protected>
        <recipients>
            <field>Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>no-reply15@sage.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Community_Emails/Partner_Registration_Link_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Invite_Code</fullName>
        <field>Invite_Code__c</field>
        <formula>Id + &apos;-&apos; + SUBSTITUTE(SUBSTITUTE(SUBSTITUTE(TEXT(NOW()),&apos;-&apos;,&apos;&apos;),&apos;:&apos;,&apos;&apos;),&apos; &apos;,&apos;&apos;)</formula>
        <name>Update Invite Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Send Community Registration Email</fullName>
        <actions>
            <name>Send_Partner_Community_Registration_Link</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Invite_Code</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Community_Membership__c.Status__c</field>
            <operation>equals</operation>
            <value>Invited</value>
        </criteriaItems>
        <criteriaItems>
            <field>Community_Membership__c.Invite_Code__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>CommunityX__c.Name</field>
            <operation>equals</operation>
            <value>Sage Partner Community</value>
        </criteriaItems>
        <description>This workflow sends an email with the registration link for community users.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
