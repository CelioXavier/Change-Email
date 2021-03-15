/*
* Name    : EmailUtils
* Purpose : Class responsible for triggering the email
* Author  : Célio Xavier.
* Date    : 27 December 2020. 
*/

global class EmailUtils {
    global static void sendMessage(AsyncApexJob job, Integer recordsProcessed){
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{'Celio.Santos@brasilprev.com.br'};
            mail.setToAddresses(toAddresses);
        mail.setSubject('Serviço: Alteração de E-mail - Status: ' + job.Status);        
        mail.setPlainTextBody('Mensagem para administradores: ' + 
                              + '\n \n' +            
                              + 'Processo: Fluxo de reprocessamento de alteração de e-mail em lote. \n' + 
                              + 'Motivo: Falha nas requisições via API. \n' +
                              + 'Serviço: DadosCadastraisManutencaoWs. \n' +
                              + 'Método: alterarEmail. \n' +
                              + 'Registros processados:  ' + recordsProcessed + '\n' +
                              + '\n Observações: Cada registro processado equivale de 0 a 80 processamentos.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});        
    }
}