/*
* Name    : TransferQueueCallout
* Purpose : Call of the batch of the transfer queue regarding the e-mail alteration requests that had an error or unavailability from the external service.
* Author  : Célio Xavier.
* Date    : 23 December 2020. 
*/

public class TransferQueueCallout implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful {
    // instance member to retain state across transactions
    public set<ID> finalaccounts = new set<Id>();
    public Integer recordsProcessed = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        String typeEmail = 'Email'; 
        return Database.getQueryLocator('SELECT Id, AccountId__c,  Email__c, Inscription_Number__c FROM Repository__c WHERE Type__c =: typeEmail AND CreatedDate = Today');  
    }    

    public void execute(Database.BatchableContext bc, List<Repository__c> scope){  
        for(Repository__c cc:scope){
            finalaccounts.add(cc.Id);
            ChangeEmailAPI_Rep.CallChangeEmailAPI_Rep(cc.AccountId__c, cc.Email__c, cc.Inscription_Number__c);            
        } 
        recordsProcessed = recordsProcessed + 1;
    }
    
    
    public void finish(Database.BatchableContext bc){      
        System.debug('Registro(s) processado(s): ' + recordsProcessed + '.');        
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
                            JobItemsProcessed,
                            TotalJobItems, CreatedBy.Email
                            FROM AsyncApexJob
                            WHERE Id = :bc.getJobId()];
        // call some utility to send email
        EmailUtils.sendMessage(job, recordsProcessed);
    }
}