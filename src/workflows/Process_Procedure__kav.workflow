<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Knowledge_Process_Approved</fullName>
        <description>Knowledge Process Approved</description>
        <protected>false</protected>
        <recipients>
            <field>Submitters_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Sage_CBC_Admin_Templates/Knowledge_Process_Approved</template>
    </alerts>
    <alerts>
        <fullName>Knowledge_Process_Rejected</fullName>
        <description>Knowledge Process Rejected</description>
        <protected>false</protected>
        <recipients>
            <field>Submitters_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Sage_CBC_Admin_Templates/Knowledge_Process_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Send_Process_approval_reminder_email</fullName>
        <description>Send Process approval reminder email</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sage_CBC_Knowledge_Process_Approvers</recipient>
            <type>group</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Sage_CBC_Admin_Templates/Knowledge_Process_Approval_Reminder</template>
    </alerts>
    <fieldUpdates>
        <fullName>Clear_Submission_Date</fullName>
        <description>Clear the submission date field to cancel any pending approval reminder emails from the time based workflow.</description>
        <field>Approval_Submission_Date__c</field>
        <name>Clear Submission Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Article_Reviewer</fullName>
        <description>Field Update to set this field to the name of the current user when the proccess &amp; procedure is approved or rejected. Used when sending approved and rejected notification emails to the submitter at the end of the approval process.</description>
        <field>Reviewer__c</field>
        <formula>IF( ISBLANK($User.FirstName), $User.LastName, $User.FirstName &amp; &apos; &apos; &amp; $User.LastName)</formula>
        <name>Set Article Reviewer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Effective_Submission_Date</fullName>
        <description>Takes the current date, and if the standard 3 day reminder interval will run into a weekend then adds an offset for the corresponding number of days.  This ensures that reminders take weekends into account.</description>
        <field>Effective_Approval_Submission_Date__c</field>
        <formula>DATETIMEVALUE( CASE( MOD( TODAY() - DATE(1900, 1, 7), 7),
0, TODAY()+1,
1, TODAY(),
2, TODAY(),
3, TODAY()+2,
4, TODAY()+2,
5, TODAY()+2,
6, TODAY()+2,
TODAY()+2 ) )</formula>
        <name>Set Effective Submission Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Submission_Date</fullName>
        <description>Set the Approval Submission Date to trigger the approval reminder workflow.</description>
        <field>Approval_Submission_Date__c</field>
        <formula>NOW()</formula>
        <name>Set Submission Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Submitters_Email</fullName>
        <description>Field Update to set this field to the email address of the current user when the process &amp; procedure is submitted for approval. Used when sending approved and rejected notification emails to the submitter at the end of the approval process.</description>
        <field>Submitters_Email__c</field>
        <formula>$User.Email</formula>
        <name>Set Submitters Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Submitters_Name</fullName>
        <description>Field Update to set this field to the email address of the current user when the process &amp; procedure is submitted for approval. Used when sending reminder emails for overdue approvals..</description>
        <field>Submitters_Name__c</field>
        <formula>IF( ISBLANK($User.FirstName), $User.LastName, $User.FirstName &amp; &apos; &apos; &amp; $User.LastName)</formula>
        <name>Set Submitters Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Visible_in_PKB_to_False</fullName>
        <description>Field Update to clear the Public Knowledge Base Channel flag.</description>
        <field>IsVisibleInPkb</field>
        <literalValue>0</literalValue>
        <name>Set Visible in PKB to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Visible_to_Customer_to_False</fullName>
        <description>Field Update to clear the Customer Channel flag.</description>
        <field>IsVisibleInCsp</field>
        <literalValue>0</literalValue>
        <name>Set Visible to Customer to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Visible_to_Partner_to_False</fullName>
        <description>Field Update to clear the Partner Channel flag.</description>
        <field>IsVisibleInPrm</field>
        <literalValue>0</literalValue>
        <name>Set Visible to Partner to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <knowledgePublishes>
        <fullName>Publish_Process_and_Procedure</fullName>
        <action>PublishAsNew</action>
        <label>Publish Process and Procedure</label>
        <language>en_US</language>
        <protected>false</protected>
    </knowledgePublishes>
    <rules>
        <fullName>Knowledge Process Approval Reminder</fullName>
        <actions>
            <name>Set_Effective_Submission_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Send a reminder for a Knowledge Process approval that has been outstanding for three days.</description>
        <formula>AND(NOT(ISBLANK( Approval_Submission_Date__c )), $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Process_approval_reminder_email</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Process_Procedure__kav.Effective_Approval_Submission_Date__c</offsetFromField>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
