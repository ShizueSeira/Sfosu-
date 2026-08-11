@isTest
private class RecentChatFeedControllerTest {
    @isTest
    static void testGetRecentMessages() {
        // 1. Create test data
        Chat_Message__c msg = new Chat_Message__c(Message__c = 'Test Message');
        insert msg;

        // 2. Call the method
        Test.startTest();
        List<Chat_Message__c> results = RecentChatFeedController.getRecentMessages();
        Test.stopTest();

        // 3. Assert results
        System.assertEquals(1, results.size(), 'Should return 1 message');
        System.assertEquals('Test Message', results[0].Message__c, 'Message text should match');
    }
}