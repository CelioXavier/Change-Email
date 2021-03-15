/*
* Name    : ChangeEmailAPI
* Purpose : Class responsible for the request in the API (AWS) to change email.
* Author  : Célio Xavier.
* Date    : 03 December 2020. 
*/

public class ChangeEmailAPI_Rep {
    public static HttpResponse CallChangeEmailAPI_Rep(Id AccountId, String Email, String Inscription_Number) {
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
        HttpResponse response = http.send(request); 
        request.setTimeout(100);
        System.debug('Alteração de e-mail processada no legado com sucesso.'); 
        System.debug(response.getStatusCode());                                 
        return response; 
    }
}