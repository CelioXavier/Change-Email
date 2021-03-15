@isTest
public class TransferQueueCalloutTest {
    
    @testSetup
    static void setup(){
        Account cts = new Account(            
            FirstName = 'Célio', 
            LastName = 'Xavier'           
        ); 
        insert cts;  
        
        Repository__c ct = new Repository__c(  
            Email__c = 'test@test.com.br', 
            Inscription_Number__c = '35', 
            Type__c = 'Email'
        ); 
        insert ct;
        
        Repository__c ct1 = new Repository__c(
            Email__c = 'celio@test.com.br', 
            Inscription_Number__c = '37', 
            Type__c = 'Email'
        ); 
        insert ct1;
    }
    
    @isTest
    static void test(){
        Test.setMock(HttpCalloutMock.Class, new MockWebserviceCallsTest.GetEmailSuccess());    
        Test.startTest();
        TransferQueueCallout tqc = new TransferQueueCallout(); 
        Id batchId = Database.executeBatch(tqc);
        Test.stopTest();        
    }
}