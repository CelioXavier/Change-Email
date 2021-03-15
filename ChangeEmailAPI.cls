/*
* Name    : ChangeEmailAPI
* Purpose : Class responsible for the request in the API (AWS) to change email.
* Author  : Célio Xavier.
* Date    : 03 December 2020. 
*/

public class ChangeEmailAPI {
    public static HttpResponse CallChangeEmailAPI(Id AccountId, String Email, String Inscription_Number) {
        API_Profile__mdt eb = APIProfileHelper.retriveAPIProfile('AlterarEmail');
        Integer Inscription_Number_Int = integer.valueOf(Inscription_Number);
        if(Email == null){Email = '';}
        System.debug('E-mail: ' + Email + ' / ' + 'Matrícula: ' + Inscription_Number_Int); 
        Http http = new Http(); 
        HttpRequest request = new HttpRequest(); 
        request.setEndpoint(eb.Path__c); 
        request.setMethod('PUT'); 
        request.setHeader('Content-Type', 'application/json'); 
        request.setHeader('x-api-key', eb.API_Key__c); 
        request.setHeader('canalOperacao', eb.Channel__c); 
        
        JSONGenerator gen = JSON.createGenerator(true); 
        gen.writeStartObject(); 
        gen.writeNumberField('idCanalSolicitacao', 14); // Channel 14 - Salesforce
        gen.writeNumberField('idUsuario', 103); //User Salesforce
        gen.writeNumberField('numeroMatricula', Inscription_Number_Int); 
        gen.writeStringField('email', Email); 
        gen.writeNumberField('idUsoEmail', 3); //3 - E-mail for sending communications and services *Mock Brasilprev // 4 - E-mail for Billing
        gen.writeEndObject(); 
        
        String Jsons = gen.getAsString(); 
        System.debug(Jsons);         
        request.setBody(Jsons);         
        try{ 
            HttpResponse response = http.send(request); 
            request.setTimeout(100);
            if(response.getStatusCode() == 200) {
                System.debug('Alteração de e-mail processada no legado com sucesso.'); 
                System.debug(response.getStatusCode());                                 
                return response; 
            }else{      
                System.debug('Erro - Serviço de Ateração de e-mail.'); 
                System.debug('Response: ' + response); 
                System.debug(response.getStatusCode()); 
                Repository__c errorRecord = new Repository__c(); 
                errorRecord.AccountId__c = AccountId; 
                errorRecord.Type__c = 'Email'; 
                errorRecord.Inscription_Number__c = Inscription_Number; 
                errorRecord.Email__c = Email;
                database.insert(errorRecord); 
            }
        }catch(System.CalloutException e){            
            Repository__c errorRecord = new Repository__c(); 
            errorRecord.AccountId__c = AccountId; 
            errorRecord.Type__c = 'Email'; 
            errorRecord.Inscription_Number__c = Inscription_Number; 
            errorRecord.Email__c = Email;
            database.insert(errorRecord); 
            System.debug('Erro - Serviço de Ateração de e-mail: ' + e);
            System.debug('Registro encaminhado para a fila de transferência em lote.');
        }  
        return null; 
    }
}