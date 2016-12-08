<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Welcome_to_Sage_Chatter_email</fullName>
        <description>Send Welcome to Sage Chatter email</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>sagechatter@sage.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sage/Welcome_to_Chatter</template>
    </alerts>
    <rules>
        <fullName>New Sage User Creation</fullName>
        <actions>
            <name>Send_Welcome_to_Sage_Chatter_email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.IsActive</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.T_C_Agreed__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastLoginDate</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>notEqual</operation>
            <value>Sage: CBC Customer Community User,Sage: Customer Community User</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
