<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Disable_Escalated_Checkbox</fullName>
        <field>IsEscalated</field>
        <literalValue>0</literalValue>
        <name>Disable Escalated Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Enable_Escalated_Checkbox</fullName>
        <field>IsEscalated</field>
        <literalValue>1</literalValue>
        <name>Enable Escalated Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Owner_to_Atlanta_Case_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Atlanta_Case_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Case Owner to Atlanta Case Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_RecType_to_Standard_Case</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Standard_Case</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Case RecType to Standard Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Status_to_Closed_by_Customer</fullName>
        <field>Status</field>
        <literalValue>Closed - By Customer</literalValue>
        <name>Update Case Status to Closed by Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_to_Closed_Email_Archive</fullName>
        <description>Automatically update Case Status to be Closed - Email Archive if a New Case is received from an email.</description>
        <field>Status</field>
        <literalValue>Auto Closed - Origin Email</literalValue>
        <name>Update Case to Closed - Email Archive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Owner_to_GPP_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>GPP_REP_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Owner to GPP Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Time_Case_Accepted</fullName>
        <description>Updated the Time Case Accepted with current Date/Time Stam[</description>
        <field>Time_Case_Accepted__c</field>
        <formula>Now()</formula>
        <name>Update Time Case Accepted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updated_Case_Closure_Reason_to_Resolved</fullName>
        <field>Reason</field>
        <literalValue>Knowledge Article</literalValue>
        <name>Updated Case Closure Reason to Resolved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Assign Case to GPP Queue  for Partners</fullName>
        <actions>
            <name>Update_Owner_to_GPP_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner Community Cases</value>
        </criteriaItems>
        <description>This workflow assign cases of Partner Community Case Record Type to GPP Rep Queue</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case Closed by Customer</fullName>
        <actions>
            <name>Update_Case_Status_to_Closed_by_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Updated_Case_Closure_Reason_to_Resolved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow Rule to Update Case Information if the Case has been closed by the Customer using Suggested Knowledge</description>
        <formula>IsSelfServiceClosed &amp;&amp; NOT($Permission.Sage_Customer_Community_User)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Closed by Sage Customer Community User</fullName>
        <actions>
            <name>Update_Case_Status_to_Closed_by_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow Rule to Update Case Information if the Case has been closed by the Sage Customer Community User</description>
        <formula>IsSelfServiceClosed &amp;&amp; $Permission.Sage_Customer_Community_User</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Disable Escalated Checkbox</fullName>
        <actions>
            <name>Disable_Escalated_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( ISBLANK(Text(Escalation_Type__c)), $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Enable Escalation Checkbox</fullName>
        <actions>
            <name>Enable_Escalated_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( NOT(ISBLANK(Text(Escalation_Type__c))), $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Community Case</fullName>
        <actions>
            <name>Update_Case_Owner_to_Atlanta_Case_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_RecType_to_Standard_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Assign New Case created from Community to the Atlanta Case Queue for Action</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,   TEXT(Type) &lt;&gt; &apos;Subscription Management&apos;, Case_Originator__c  = &apos;Case Customer Community&apos; )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Test case</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>High</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Case Status to Closed</fullName>
        <actions>
            <name>Update_Case_to_Closed_Email_Archive</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Email</value>
        </criteriaItems>
        <description>Updated Case Status for emails received into Salesforce that have no existing case attached</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Time Case Accepted</fullName>
        <actions>
            <name>Update_Time_Case_Accepted</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow Rule to update the Time Case Accepted field when the status of the case is changed from New</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,  AND(ISCHANGED(Status), ISPICKVAL(PRIORVALUE( Status ), &apos;New&apos; )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
