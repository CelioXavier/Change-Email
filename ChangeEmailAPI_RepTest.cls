@isTest
public class ChangeEmailAPI_RepTest {
    
    @testSetup
    static void setup(){
        Account ct = new Account(
            FirstName = 'Célio', 
            LastName = 'Xavier', 
            PersonEmail = 'test@test.com.br'         
        ); 
        insert ct;  
        
        ServiceContract sc = new ServiceContract(
            AccountId = ct.Id, 
            Name = 'Test Contract', 
            Inscription_Number__c = '35'
        );
        
        insert sc; 
    }
    
    @isTest
    static void CallChangeEmailAPITest(){
        Test.setMock(HttpCalloutMock.Class, new MockWebserviceCallsTest.GetEmailSuccess());        
        Test.startTest();
        Id recordtype = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('CRC_Actions').getRecordTypeId();
        ServiceContract ct = [
            SELECT Account.Id, Account.PersonEmail, Inscription_Number__c
            FROM ServiceContract];
        HttpResponse hpt = ChangeEmailAPI_Rep.CallChangeEmailAPI_Rep(ct.Account.Id, ct.Account.PersonEmail, ct.Inscription_Number__c);
        Test.stopTest();
    }
    
    @isTest
    static void CallChangeEmailAPIErrorTest(){
        Test.setMock(HttpCalloutMock.Class, new MockWebserviceCallsTest.GetEmailErro());        
        Test.startTest();
        ServiceContract ct = [
			SELECT Account.Id, Account.PersonEmail, Inscription_Number__c
            FROM ServiceContract];
        HttpResponse hpt = ChangeEmailAPI_Rep.CallChangeEmailAPI_Rep(ct.Account.Id, ct.Account.PersonEmail, ct.Inscription_Number__c);
        Test.stopTest();
    }
    
    @isTest
    static void CallChangeEmailAPIErrorException(){
        Test.setMock(HttpCalloutMock.Class, new MockWebserviceCallsTest.GetEmailErro400());        
        Test.startTest();
        ServiceContract ct = [
			SELECT Account.Id, Account.PersonEmail, Inscription_Number__c
            FROM ServiceContract];
        HttpResponse hpt = ChangeEmailAPI_Rep.CallChangeEmailAPI_Rep(ct.Account.Id, ct.Account.PersonEmail, ct.Inscription_Number__c);
        Test.stopTest();
    }
}