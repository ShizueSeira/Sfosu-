public with sharing class ChatController {

    @AuraEnabled(cacheable=true)
    public static List<Chat_Message__c> getRecentMessages() {
        return [
            SELECT Id, Message__c, Sender_Name__c, CreatedDate 
            FROM Chat_Message__c 
            ORDER BY CreatedDate ASC 
            LIMIT 50
        ];
    }

    @AuraEnabled
    public static void sendMessage(String messageText) {
        Chat_Message__c msg = new Chat_Message__c(
            Message__c = messageText,
            Sender_Name__c = UserInfo.getName()
        );
        insert msg;
    }
}