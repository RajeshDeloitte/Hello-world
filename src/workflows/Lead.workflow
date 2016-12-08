<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Lead_Transfer_Email_Notifictaion</fullName>
        <description>Lead Transfer Email Notifictaion</description>
        <protected>false</protected>
        <recipients>
            <field>Regional_Product_Sales_Team_Email_Text__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sage_CBC_Admin_Templates/Lead_Transfer_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Lead_OwnerShip_Change</fullName>
        <description>Change the Lead Owner to Dublin CBC if the country is not in US or CA</description>
        <field>OwnerId</field>
        <lookupValue>Dublin_CBC</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Lead OwnerShip Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateLeadOwnertoAtlantaCBCQueue</fullName>
        <description>Update the Lead owner to Atlanta CBC Queue</description>
        <field>OwnerId</field>
        <lookupValue>Atlanta_CBC</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>UpdateLeadOwnertoAtlantaCBCQueue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Email_Value_From_Picklist</fullName>
        <description>This is populated to send email notification to this value as workflow rule cannot pick value from picklist fields.</description>
        <field>Regional_Product_Sales_Team_Email_Text__c</field>
        <formula>Regional_Product_Sales_Team_Email_Formul__c</formula>
        <name>Update Email Value From Picklist</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Funnel_Stage_to_Inquiry</fullName>
        <description>This Field Update updates the Funnel Stage to Inquiry.</description>
        <field>Funnel_Stage__c</field>
        <literalValue>Inquiry</literalValue>
        <name>Update Funnel Stage to Inquiry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Funnel_Stage_to_MQL</fullName>
        <description>This Field Update updates the Funnel Stage to MQL.</description>
        <field>Funnel_Stage__c</field>
        <literalValue>MQL</literalValue>
        <name>Update Funnel Stage to MQL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Funnel_Stage_to_Suspect</fullName>
        <description>This Field Update updates the Funnel Stage to Suspect.</description>
        <field>Funnel_Stage__c</field>
        <literalValue>Suspect</literalValue>
        <name>Update Funnel Stage to Suspect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Change_Date</fullName>
        <description>This Field Update the Last Change Date field.</description>
        <field>Last_Change_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update Last Change Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Change_Date_Time</fullName>
        <description>This Field Update the Last Change Date Time field.</description>
        <field>Last_Change_Date_Time__c</field>
        <formula>NOW()</formula>
        <name>Update Last Change Date Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_First_Touch_Time_hidden</fullName>
        <field>Lead_First_Touch_Time_hidden__c</field>
        <formula>NOW()</formula>
        <name>Update Lead First Touch Time(hidden)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Owner_to_Partner_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>PartnerLeads</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Lead Owner to Partner Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Record_Type</fullName>
        <description>Field update to set Lead Record Type to Partner Lead</description>
        <field>RecordTypeId</field>
        <lookupValue>Partner_Lead</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Lead Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Source_Most_Recent_to_Refer</fullName>
        <description>Update Lead Source Most Recent to Referral Program</description>
        <field>Lead_Source_Most_Recent__c</field>
        <literalValue>Referral Program</literalValue>
        <name>Update Lead Source Most Recent to Refer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Tactic_ID_Opp</fullName>
        <description>Workflow field update to keep Tactic_id_Opp aligned with Tactic ID. 
This is to allow mapping to Opportunity Tactic_Id as well as Contact on Lead Conversion</description>
        <field>Tactic_ID_Opp__c</field>
        <formula>Tactic_ID__c</formula>
        <name>Update Tactic ID Opp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Highest Lead Score equals A1%2C A2%2C A3%2C B1%2C B2%2C C1</fullName>
        <actions>
            <name>Update_Funnel_Stage_to_MQL</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Lead_Score__c</field>
            <operation>equals</operation>
            <value>A1,A2,A3,B1,B2,C1</value>
        </criteriaItems>
        <description>Highest Lead Score equals A1, A2, A3, B1, B2, C1</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Highest Lead Score equals A4%2C B4%2C C4%2C D4</fullName>
        <actions>
            <name>Update_Funnel_Stage_to_Suspect</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Lead_Score__c</field>
            <operation>equals</operation>
            <value>A4,B4,C4,D4</value>
        </criteriaItems>
        <description>Highest Lead Score equals A4, B4, C4, D4</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Highest Lead Score not equal to A1%2C A2%2C A3%2C B1%2C B2%2C C1%2C A4%2C B4%2C C4%2C D4</fullName>
        <actions>
            <name>Update_Funnel_Stage_to_Inquiry</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Lead_Score__c</field>
            <operation>notEqual</operation>
            <value>A1,A2,A3,B1,B2,C1,A4,B4,C4,D4</value>
        </criteriaItems>
        <description>Highest Lead Score not equal to A1, A2, A3, B1, B2, C1, A4, B4, C4, D4</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Transfer Email Notification</fullName>
        <actions>
            <name>Lead_Transfer_Email_Notifictaion</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Email_Value_From_Picklist</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Transferred</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Send an email to Lead queue when the Lead status is set to Lead Transfer.</description>
        <formula>AND( Text(Status) == &apos;Archived - Transfer&apos;, $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Last Change Date</fullName>
        <actions>
            <name>Update_Last_Change_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Last_Change_Date_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This rule is evaluated when a record is created and every time it&apos;s edited.</description>
        <formula>(ISNEW() &amp;&amp; text(Status) = &apos;New&apos;)||(ISCHANGED(Status ) &amp;&amp; text(PRIORVALUE(Status) ) &lt;&gt; &apos;New&apos; &amp;&amp; text(Status) = &apos;New&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Lead First Touch Time%28hidden%29</fullName>
        <actions>
            <name>Update_Lead_First_Touch_Time_hidden</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This rule is evaluated when a record is created and every time it&apos;s edited.</description>
        <formula>(ISNEW() &amp;&amp; text(Status) &lt;&gt; &apos;New&apos;)||(ISCHANGED(Status) &amp;&amp; text(PRIORVALUE(Status)) = &apos;New&apos; &amp;&amp; text(Status) &lt;&gt; &apos;New&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Lead Record Type to Partner</fullName>
        <actions>
            <name>Update_Lead_Owner_to_Partner_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Lead_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow to update Lead Record Type to Partner when a Partner Eloqua Form is used. This is driven by the checkbox &apos;IsPartner&quot;.
Installed as part of the Amplifinity Project.</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c,   IsPartner__c )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Tactic ID</fullName>
        <actions>
            <name>Update_Tactic_ID_Opp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow rule to keep Tactic_id_Opp aligned with Tactic ID.
This is to allow mapping to Opportunity Tactic_Id as well as Contact on Lead Conversion</description>
        <formula>AND( $Setup.Application_Control__c.Run_Workflow_Rules__c, $Setup.CBC_Application_Control__c.Run_Workflow_Rules__c, OR(ISNEW(), ISCHANGED( Tactic_ID__c )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UpdateOwnertoAtlantaCBCQueue</fullName>
        <actions>
            <name>UpdateLeadOwnertoAtlantaCBCQueue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Foundation_Customer__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.CountryCode</field>
            <operation>contains</operation>
            <value>US,CA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Product__c</field>
            <operation>contains</operation>
            <value>GL - Sage One,GL - Sage Live</value>
        </criteriaItems>
        <description>Assign the Lead to the Atlanta CBC Queue based on Country if Sage Foundation Customer Status is set to &apos;Approved&apos;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>UpdateOwnertoDublinCBCQueue</fullName>
        <actions>
            <name>Lead_OwnerShip_Change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Foundation_Customer__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.CountryCode</field>
            <operation>notContain</operation>
            <value>US,CA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Product__c</field>
            <operation>contains</operation>
            <value>GL - Sage One,GL - Sage Live</value>
        </criteriaItems>
        <description>Assign the Lead to the Dublin CBC Queue based on Country(other than US and CA) if Sage Foundation Customer Status is set to &apos;Approved&apos;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Lead_Transferred</fullName>
        <assignedToType>owner</assignedToType>
        <description>Lead transferred to regional product sales team.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Lead Transferred</subject>
    </tasks>
</Workflow>
