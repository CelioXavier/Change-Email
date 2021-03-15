@isTest
public class CallTransferQueueCalloutTest {
    static TestMethod void TestOne(){      
        Test.startTest();     
        new CallTransferQueueCallout().execute(null);               
        Test.stopTest(); 
    }
    public static TestMethod void testTwo() {
        Test.startTest(); 
        CallTransferQueueCallout.executeCall(); 
        Test.stopTest(); 
    }
    
}