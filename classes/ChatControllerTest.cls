@isTest
private class ChatControllerTest {

    @isTest
    static void testGetRecentMessagesWithData() {
        // 1. Create and insert test records
        List<Chat_Message__c> testMessages = new List<Chat_Message__c>();
        for (Integer i = 0; i < 5; i++) {
            testMessages.add(new Chat_Message__c(
                Message__c = 'Test Message ' + i
            ));
        }
        insert testMessages;

        // 2. Execute the method inside startTest/stopTest block
        Test.startTest();
        List<Chat_Message__c> result = ChatController.getRecentMessages();
        Test.stopTest();

        // 3. Verify results
        System.assertNotEquals(null, result, 'Result list should not be null');
        System.assertEquals(5, result.size(), 'Should return all 5 inserted test messages');
        System.assertNotEquals(null, result[0].CreatedBy.Name, 'CreatedBy relation should be populated');
    }

    @isTest
    static void testGetRecentMessagesEmpty() {
        // Test behavior when no records exist in the org
        Test.startTest();
        List<Chat_Message__c> result = ChatController.getRecentMessages();
        Test.stopTest();

        System.assertNotEquals(null, result, 'Result list should not be null');
        System.assertEquals(0, result.size(), 'Should return an empty list when no records exist');
    }
}