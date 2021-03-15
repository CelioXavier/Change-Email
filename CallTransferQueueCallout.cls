/*
* Name    : CallTransferQueueCallout
* Purpose : Email change batch class call
* Author  : Célio Xavier.
* Date    : 24 December 2020. 
*/

global class CallTransferQueueCallout implements Schedulable {
    
    global void execute(SchedulableContext ctx) { 
        TransferQueueCallout myBatchObject = new TransferQueueCallout();
        Id batchId = Database.executeBatch((myBatchObject), 80); 
    }	
    
    @invocableMethod
    public static void executeCall() {         
        TransferQueueCallout myBatchObject = new TransferQueueCallout();
        Id batchId = Database.executeBatch((myBatchObject), 80); 
    }
}