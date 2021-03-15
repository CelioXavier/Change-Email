@isTest
private class GetEmailAPITest {
    
    @testSetup
    static void setup(){
        Account ct = new Account(
            FirstName = 'Célio', 
            LastName = 'Xavier', 
            PersonEmail = 'test@test.com.br',
            Inscription_Number__pc = '35'

        ); 
        insert ct;  
        
        ServiceContract sc = new ServiceContract(
            AccountId = ct.Id, 
            Name = 'Test Contract', 
            Inscription_Number__c = '35',
            Plan_Status__c = 'ATIVO'
        );
        
        insert sc; 
    }
    
    
    @isTest
    static void getContactParametersTest() {
        Test.setMock(HttpCalloutMock.Class, new MockWebserviceCallsTest.GetEmailSuccess());        
        Test.startTest();
        List<Account> ct = [
            SELECT Id, PersonEmail, (SELECT Inscription_Number__c FROM ServiceContracts)
            FROM Account
        ];
        GetEmailAPI.getAccountParameters(ct);
        Test.stopTest();
    }
}