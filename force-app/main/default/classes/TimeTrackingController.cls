/** @Description
*   Static UI API for time tracking functionality */
public with sharing class TimeTrackingController {

    /** @Description
    *   Retrieves List of non-ended / unfinished time entries (Ids only) for the current user.
    *   The Time Entries are ordered by created date (most recent first)
    *
    *   @return             List of unfinished Time Entries.
    */
    @AuraEnabled(cacheable=false)
    public static List<cm_bm__TimeEntry__c> getUnfinishedTimeEntries(){
        return [SELECT Id
                FROM cm_bm__TimeEntry__c WHERE OwnerId = :UserInfo.getUserId() AND cm_bm__End__c = null
                ORDER BY CreatedDate DESC];
    }
    
@AuraEnabled(cacheable=true)
    public static List<cm_bm__Project_Team_Member__c> getProjectTeamMember(String projectId) {
        return [SELECT Id, Name,cm_bm__Project__r.Name from cm_bm__Project_Team_Member__c where cm_bm__Project__r.id = :projectId];
    }
    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact() {
        return [
            SELECT Id, Name, Title, Phone, Email
            FROM Contact
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }
}