/*
* Name    : GetEmailAPI
* Purpose : Get the id of the accounts that had an email change.
* Author  : Célio Xavier.
* Date    : 03 December 2020. 
*/

public class GetEmailAPI {
    
    @InvocableMethod(label='GetAccountParameters' description='Returns the parameters corresponding to the specified account ID.' category='Account')
    public static void getAccountParameters(List<Account> ids){
        set<Id> accountsId = new set<Id>(); 
        for(Account ac: ids){
            accountsId.add(ac.Id); 
        }
        for(ServiceContract ac: [
            SELECT Account.Id, Account.PersonEmail, Inscription_Number__c
            FROM ServiceContract WHERE Plan_Status__c = 'ATIVO' AND AccountId in: accountsId ORDER BY Inscription_Number__c ASC LIMIT 1]){
                docSingCallout(ac.Account.Id, ac.Account.PersonEmail, ac.Inscription_Number__c);
            }
    }    
    @future(callout=true)
    public static void docSingCallout(Id AccountId, String Email, String Inscription_Number){
        ChangeEmailAPI.CallChangeEmailAPI(AccountId, Email, Inscription_Number); 
    }
}