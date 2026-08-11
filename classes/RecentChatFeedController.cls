public with sharing class RecentChatFeedController {
    @AuraEnabled(cacheable=true)
    public static List<Chat_Message__c> getRecentMessages() {
        return [
            SELECT Id, CreatedBy.Name, Message__c, CreatedDate 
            FROM Chat_Message__c 
            ORDER BY CreatedDate DESC 
            LIMIT 5
        ];
    }
}