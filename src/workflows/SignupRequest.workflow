<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Signup_Request_Email_Alert_when_Status_equal_Error</fullName>
        <description>Signup Request - Email Alert when Status equal Error</description>
        <protected>false</protected>
        <recipients>
            <recipient>Signup_Request_Error_Notification_Group</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sage_CBC_Admin_Templates/Signup_Request_Status_Error_Template</template>
    </alerts>
    <rules>
        <fullName>Signup Request - Email Alert on Status Error</fullName>
        <actions>
            <name>Signup_Request_Email_Alert_when_Status_equal_Error</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SignupRequest.Status</field>
            <operation>equals</operation>
            <value>Error</value>
        </criteriaItems>
        <description>Send an email alert when the Signup Request Status is set to Error by the Trialforce API response.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
