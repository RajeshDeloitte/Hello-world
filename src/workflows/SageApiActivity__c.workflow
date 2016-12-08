<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>AddCommunityUserApiActivityOBMToCbcApi</fullName>
        <apiVersion>37.0</apiVersion>
        <endpointUrl>https://api.cbc.sage.com/api/Activities/AddCommunityUser/StatusChangeNotification?apikey=BDAB48Z97P2AZ48S</endpointUrl>
        <fields>ActivityID__c</fields>
        <fields>ActivityStatus__c</fields>
        <fields>ActivitySteps__c</fields>
        <fields>ActivityType__c</fields>
        <fields>Artifacts__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>apiactivity.integration@sage.com</integrationUser>
        <name>AddCommunityUserApiActivityOBMToCbcApi</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>BuyNowApiActivityOutboundMessageToCbcApi</fullName>
        <apiVersion>37.0</apiVersion>
        <endpointUrl>https://api.cbc.sage.com/api/Activities/BuyNow/StatusChangeNotification?apikey=BDAB48Z97P2AZ48S</endpointUrl>
        <fields>ActivityID__c</fields>
        <fields>ActivityStatus__c</fields>
        <fields>ActivityType__c</fields>
        <fields>Artifacts__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>apiactivity.integration@sage.com</integrationUser>
        <name>BuyNowApiActivityOutboundMessageToCbcApi</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>LeadApiActivityOutboundMessageToCbcApi</fullName>
        <apiVersion>37.0</apiVersion>
        <endpointUrl>https://api.cbc.sage.com/api/Activities/TryNowLead/StatusChangeNotification?apikey=BDAB48Z97P2AZ48S</endpointUrl>
        <fields>ActivityID__c</fields>
        <fields>ActivityStatus__c</fields>
        <fields>ActivityType__c</fields>
        <fields>Artifacts__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>apiactivity.integration@sage.com</integrationUser>
        <name>LeadApiActivityOutboundMessageToCbcApi</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>TryNowApiActivityOutboundMessageToCbcApi</fullName>
        <apiVersion>37.0</apiVersion>
        <endpointUrl>https://api.cbc.sage.com/api/Activities/TryNow/StatusChangeNotification?apikey=BDAB48Z97P2AZ48S</endpointUrl>
        <fields>ActivityID__c</fields>
        <fields>ActivityStatus__c</fields>
        <fields>ActivityType__c</fields>
        <fields>Artifacts__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>apiactivity.integration@sage.com</integrationUser>
        <name>TryNowApiActivityOutboundMessageToCbcApi</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>AddCommunityUser Api Activity Status Change</fullName>
        <actions>
            <name>AddCommunityUserApiActivityOBMToCbcApi</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <description>Status change, such as Success, ExceptionRetryable, ExceptionNotRetryable</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c, OR(ISNEW(), ISCHANGED( ActivityStatus__c )), ISPICKVAL(ActivityType__c,&apos;AddCommunityUser&apos;), OR( ISPICKVAL(ActivityStatus__c, &apos;Success&apos;), ISPICKVAL(ActivityStatus__c, &apos;ExceptionRetryable&apos;), ISPICKVAL(ActivityStatus__c, &apos;ExceptionNotRetryable&apos;) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>BuyNow Api Activity Status Change</fullName>
        <actions>
            <name>BuyNowApiActivityOutboundMessageToCbcApi</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <description>Status change, such as Success, ExceptionRetryable, ExceptionNotRetryable</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c, OR(ISNEW(), ISCHANGED( ActivityStatus__c )), ISPICKVAL(ActivityType__c,&apos;BuyNow&apos;), OR( ISPICKVAL(ActivityStatus__c, &apos;Success&apos;), ISPICKVAL(ActivityStatus__c, &apos;ExceptionRetryable&apos;), ISPICKVAL(ActivityStatus__c, &apos;ExceptionNotRetryable&apos;) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead Api Activity Status Change</fullName>
        <actions>
            <name>LeadApiActivityOutboundMessageToCbcApi</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <description>Status change, such as Success, ExceptionRetryable, ExceptionNotRetryable</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c, OR(ISNEW(), ISCHANGED(  ActivityStatus__c )),  ISPICKVAL(ActivityType__c,&apos;TryNowLead&apos;), OR(  ISPICKVAL(ActivityStatus__c, &apos;Success&apos;), ISPICKVAL(ActivityStatus__c, &apos;ExceptionRetryable&apos;), ISPICKVAL(ActivityStatus__c, &apos;ExceptionNotRetryable&apos;) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TryNow Api Activity Status Change</fullName>
        <actions>
            <name>TryNowApiActivityOutboundMessageToCbcApi</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <description>Status change, such as Success, ExceptionRetryable, ExceptionNotRetryable</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c, OR(ISNEW(), ISCHANGED(  ActivityStatus__c )), ISPICKVAL(ActivityType__c,&apos;TryNow&apos;), OR(  ISPICKVAL(ActivityStatus__c, &apos;Success&apos;), ISPICKVAL(ActivityStatus__c, &apos;ExceptionRetryable&apos;), ISPICKVAL(ActivityStatus__c, &apos;ExceptionNotRetryable&apos;) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
