/*******************************************************************************
* @author           AIS Digital (www.aisdigital.com.br/)
* Project:          Brasilprev
* Description:      Class responsible for controlling the actions between callouts and controllers.
*
*            No.    Date            Author                  Description     
*            ----   ----------      --------------------    ---------------   
* @version   1.0    2020 Fev 05     Ronnie Jr               class created 
********************************************************************************/

@isTest
global class MockWebserviceCallsTest {
    
    global class MCAuthSuccess implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"access_token":"token123","token_type":"Bearer","expires_in":1079,"scope":"read","soap_instance_url":"https://mc-id.soap.marketingcloudapis.com/","rest_instance_url":"https://mc-id.rest.marketingcloudapis.com/"}';
            res.setHeader('Content-Type', 'application/json;charset=UTF-8');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class MCAuthFail implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"error":"error type","error_description":"error description.","error_uri":"https://developer.salesforce.com/docs"}';
            res.setHeader('Content-Type', 'application/json;charset=UTF-8');
            res.setBody(jsonresponse);
            res.setStatusCode(401);
            return res;
        }
    }
    
    global class MCEmailSuccess implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            // string jsonresponse = '{"access_token":"token123","token_type":"Bearer","expires_in":1079,"scope":"read","soap_instance_url":"https://mc-id.soap.marketingcloudapis.com/","rest_instance_url":"https://mc-id.rest.marketingcloudapis.com/"}';
            
            String json = '{"requestId":"0ed024fe-1334-4752-8ab5-3e6d92eae354","responses":[{"recipientSendId":"0ed024fe-1334-4752-8ab5-3e6d92eae354","hasErrors":false,"messages":["Queued"]}]}';
            
            res.setHeader('Content-Type', 'application/json;charset=UTF-8');
            res.setBody(json);
            res.setStatusCode(202);
            return res;
        }
    }
    
    global class MCEmailFail implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"requestId":"123","responses":[{"recipientSendId":"","hasErrors":true,"messages":["error"]}]}';
            res.setHeader('Content-Type', 'application/json;charset=UTF-8');
            res.setHeader('Authorization', 'Bearer 123');
            res.setBody(jsonresponse);
            res.setStatusCode(401);
            return res;
        }
    }
    
    global class GetTriggeredSendSucess implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"deliveryTime":"2020-03-11T22:24:37.877","id":"eb583da1","messageId":"c7e5e1d9","status":"Sent","to":{"address":"teste@email.com.br","id":39542,"key":"4075"}}';
            res.setHeader('Content-Type', 'application/json;charset=UTF-8');
            res.setHeader('Authorization', 'Bearer' + 'token123');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class GetTriggeredSendFail implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json;charset=UTF-8');
            res.setHeader('Authorization', 'Bearer 123');
            res.setStatusCode(404);
            return res;
        }
    }
    
    global class MCSMSSuccess implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"tokenId":"123"}';
            res.setHeader('Content-Type', 'application/json;charset=UTF-8');
            res.setHeader('Authorization', 'Bearer' + 'token123');
            res.setBody(jsonresponse);
            res.setStatusCode(202);
            return res;
        }
    }
    
    global class MCSMSFail implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"errors":["Erro"]}';
            res.setHeader('Content-Type', 'application/json;charset=UTF-8');
            res.setHeader('Authorization', 'Bearer 123');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class AllFundsFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '{"erro":[{"codigoErro":400,"nomeErro":"CPF INVÁLIDO","descricaoErro":"Favor inserir um CPF válido"}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class AllFundsSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '{"rpstConsultar":[{"matricula":"3762358","dataInscricao":"14/05/2018","tipoPlano":"VGBL","nomePlano":"APOSENTADORIA","idTipoContratacao":2},{"matricula":"3762271","dataInscricao":"14/05/2018","tipoPlano":"PGBL","nomePlano":"APOSENTADORIA FELIZ","idTipoContratacao":2},{"matricula":"3728871","dataInscricao":"01/03/2017","tipoPlano":"VGBL","nomePlano":"ARTHUR RODRIGUES MOLNAR CASSEB","idTipoContratacao":2}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class FundsSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rpstConsultar":{"totalLancamentos":1,"totalLancamentosParticipante":2,"totalLancamentosEmpresa":3,"tafMedia":4,"listaInvestimentos":[{"id":5,"nome":"","descricao":"","taf":0.0,"cnpj":"","cotasParticipante":"0.00","cotasEmpresa":"0.00","lancamentoParticipante":0.0,"lancamentoEmpresa":0.0}]}}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class FundsFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"message":"Authorization fail}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(403);
            return res;
        }
    }
    
    global class ContractedFundsSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rpstConsultar":[{"id":123,"nome":"","descricao":"","taf":0.0,"cnpj":"","percentualAcumuladoAno":"0.00","percentualAcumulado12":"0.00","percentualAcumulado36":"0.00","percentualAcumulado60":"0.00","riscoGrau":0}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class ContractedFundsFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro":[{"codigoErro":400,"nomeErro":error","descricaoErro":"descricao"}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class OthersFundsSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rpstConsultar":[{"id":123,"nome":"","descricao":"","taf":0.0,"cnpj":"","percentualAcumuladoAno":"0.00","percentualAcumulado12":"0.00","percentualAcumulado36":"0.00","percentualAcumulado60":"0.00","riscoGrau":0}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class OthersFundsFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro":[{"codigoErro":400,"nomeErro":error","descricaoErro":"descricao"}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class ProjecaoRendaSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rpstConsultar":{"beneficioAtual":0.0,"beneficioSimulado":0.0,"beneficioIdeal":0.0,"percentualContinuidade":0.0,"fatorAtuarialConcessao":0.0,"contribuicaoParticipante":0.0}}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class ProjecaoRendaFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro":[{"codigoErro":400,"nomeErro":error","descricaoErro":"descricao"}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class ProjecaoReservaSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rpstConsultar":{"reservaParticipante":0.0,"rendimentosReservaParticipante":0.0,"contribuicoesReservaParticipante":0.0,"contribuicaoParticipante":0.0}}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class ProjecaoReservaFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro":[{"codigoErro":400,"nomeErro":error","descricaoErro":"descricao"}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class RendimentosSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rpstConsultar":{"reservaParticipante":0.0,"rendimentosReservaParticipante":0.0,"contribuicoesReservaParticipante":0.0,"contribuicaoParticipante":0.0}}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class RendimentosFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro":[{"codigoErro":400,"nomeErro":error","descricaoErro":"descricao"}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class TransactionsSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            //string jsonresponse = '{"rpstConsultar":{"reservaParticipante":0.0,"rendimentosReservaParticipante":0.0,"contribuicoesReservaParticipante":0.0,"contribuicaoParticipante":0.0}}';
            string jsonresponse = '{"rpstConsultar": [{"id": 0,"nome": "Resgate","data": "","total": 0.0,"totalParticipante": 0.0,"totalEmpresa": 0.0,"totalEncargos": 0.0,"listaInvestimentos": [{"id": 0,"nome": "","valorParticipante": 0.0,"valorEmpresa": 0.0,"valorTotal": 0.0}],"listaEncargos": [{"id": 0,"nome": "","valorTotal": 0.0}]}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class TransactionsSuccessNoWithdraw implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            //string jsonresponse = '{"rpstConsultar":{"reservaParticipante":0.0,"rendimentosReservaParticipante":0.0,"contribuicoesReservaParticipante":0.0,"contribuicaoParticipante":0.0}}';
            string jsonresponse = '{"rpstConsultar": [{"id": 0,"nome": "","data": "","total": 0.0,"totalParticipante": 0.0,"totalEmpresa": 0.0,"totalEncargos": 0.0,"listaInvestimentos": [{"id": 0,"nome": "","valorParticipante": 0.0,"valorEmpresa": 0.0,"valorTotal": 0.0}],"listaEncargos": [{"id": 0,"nome": "","valorTotal": 0.0}]}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class TransactionsFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro":[{"codigoErro":400,"nomeErro":error","descricaoErro":"descricao"}]}';
            res.setHeader('Authorization', 'bearer 123');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'api123');
            res.setHeader('canalOperacao', '2');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class FundBalanceSucess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rsptConsultar":[{"nome":"CICLO DE VIDA 2030 I","valorTotalDisponivel":65451.25,"valorNominal":77543.8,"valorRendimentos":-12092.55},{"nome":"PREMIUM III","valorTotalDisponivel":110266.63,"valorNominal":79216.81,"valorRendimentos":11336.69}]}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class FundAvailableBalanceSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rsptConsultar": {"status": "PROCESSING","matricula": "1234567","saldoDisponivel": 0 }}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class FundAvailableBalanceFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro": [{"codigoErro": 48,"nomeErro": "CPF_INVALIDO","descricaoErro": "Número CPF inválido"}]}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class FundsLackSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rsptConsultar": {"matricula": "1234567","emCarencia": 0,"detalheCarencia": "SOLICITAÇÃO EM PROCESSAMENTO","dataCarencia": "string"}}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class FundsBalanceLackSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rsptConsultar": [{"nome": "string","susep": "string","valorTotal": 0,"valorTotalNominal": 0,"valorTotalRendimentos": 0,"emCarencia": 0,"detalheCarencia": "CARÊNCIA INICIAL","dataCarencia": "string"}]}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class SimulationByFundSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rsptSimular": {"numeroSimulacao": 0,"matricula": "string","tipoTributacao": 0,"tipoPlano": 0,"valorSaldoDisponivel": 0,"valorSolicitado": 0,"taxaMediaImpostoDeRenda": 0,"valorImpostoDeRenda": 0,"valorLiquido": 0,"valorSaldoPosResgate": 0,"resgateTotal": 0,"detalhe": [{"nome": "string","direcionamento": "string","valorTotalDisponivel": 0,"valorTotalNominal": 0,"valorTotalRendimentos": 0,"valorResgatado": 0,"valorNominalResgatado": 0,"valorRendimentoResgatado": 0,"taxaImpostoDeRendaDetalhe": 0,"valorImpostoDeRendaDetalhe": 0,"valorLiquidoDetalhe": 0,"valorSaldoPosResgateDetalhe": 0}]}}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class SimulationByFundFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro": [{"codigoErro": 63,"nomeErro": "SIMULACAO_NAO_ENCONTRADA","descricaoErro": "Não foi encontrada simulação de resgate associada ao número solicitado."}]}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class SimulationByFundFail2 implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro": [{"codigoErro": 63,"nomeErro": "SIMULACAO_NAO_ENCONTRADA","descricaoErro": "Não foi encontrada simulação de resgate associada ao número solicitado."}]}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(404);
            return res;
        }
    }
    
    global class SendDataRescueSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rsptSolicitar": {"idSolicitacao": 0,"status": "string","dataPrevisaoCredito": "string"}}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class CancelWithdrawalSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rsptCancelar": {"idSolicitacao": 0,"mensagem": "string"}}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class WithdrawHistorySuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"rsptConsultar": [{"idSolicitacao": 0,"numeroSimulacao": 0,"matricula": "string","dataSolicitacao": "string","valorSolicitado": 0,"valorLiquido": 0}]}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class WithdrawHistoryFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = 'Not found';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(404);
            return res;
        }
    }
    
    global class AngPESuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class ApiQuantumSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '{"headers":[{"formatacao":"DATA","moeda":"BRL","casasDecimais":null}],"valores":[["Nome","Nome"]],"colunas":66,"locale":"pt_BR","ativos":null,"linhas":733}';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class ApiQuantumFail implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = 'Unauthorized';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(401);
            return res;
        }
    }
    
    // Quantum API altamir 
    global class QuantumApiSuccess implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"headers": [{"formatacao": "TEXTO","moeda": "BRL","casasDecimais": null}],"valores": [["Nome","CNPJ", "Início do Fundo","Administrador","Gestão","Patrimônio Líquido no dia - diária (01/10/2020)","Classificação Anbima","Taxa de Administração","Retorno  - diária (Out/2019)","Retorno  - diária (Nov/2019)","Retorno  - diária (Dez/2019)","Retorno  - diária (Jan/2020)","Retorno  - diária (Fev/2020)","Retorno  - diária (Mar/2020)","Retorno  - diária (Abr/2020)","Retorno  - diária (Mai/2020)","Retorno  - diária (Jun/2020)","Retorno  - diária (Jul/2020)","Retorno  - diária (Ago/2020)","Retorno  - diária (Set/2020)","Número de Vezes com Retorno Negativo nos últimos 12 meses - diária (02/10/2019 até 01/10/2020)","Número de Vezes com Retorno Negativo nos últimos 24 meses - diária (01/10/2018 até 01/10/2020)","Número de Vezes com Retorno Negativo nos últimos 36 meses - diária (27/09/2017 até 01/10/2020)","Captação Líquida no ano - diária (02/01/2020 até 01/10/2020)","Captação Líquida nos últimos 12 meses - diária (02/10/2019 até 01/10/2020)","Captação Líquida nos últimos 24 meses - diária (01/10/2018 até 01/10/2020)","Volatilidade  - diária (Out/2019)","Volatilidade  - diária (Nov/2019)","Volatilidade  - diária (Dez/2019)","Volatilidade  - diária (Jan/2020)","Volatilidade  - diária (Fev/2020)","Volatilidade  - diária (Mar/2020)","Volatilidade  - diária (Abr/2020)","Volatilidade  - diária (Mai/2020)","Volatilidade  - diária (Jun/2020)","Volatilidade  - diária (Jul/2020)","Volatilidade  - diária (Ago/2020)","Volatilidade  - diária (Set/2020)","Sharpe - CDI  - diária (Out/2019)","Sharpe - CDI  - diária (Nov/2019)","Sharpe - CDI  - diária (Dez/2019)","Sharpe - CDI  - diária (Jan/2020)","Sharpe - CDI  - diária (Fev/2020)","Sharpe - CDI  - diária (Mar/2020)","Sharpe - CDI  - diária (Abr/2020)","Sharpe - CDI  - diária (Mai/2020)","Sharpe - CDI  - diária (Jun/2020)","Sharpe - CDI  - diária (Jul/2020)","Sharpe - CDI  - diária (Ago/2020)","Sharpe - CDI  - diária (Set/2020)","Custodiante","Código ISIN","Classificação CVM","Código de Referência","Retorno nos últimos 12 meses corridos - diária (02/10/2019 até 01/10/2020)","Retorno nos últimos 24 meses corridos - diária (02/10/2018 até 01/10/2020)","Retorno nos últimos 36 meses corridos - diária (02/10/2017 até 01/10/2020)","Retorno nos últimos 48 meses corridos - diária (03/10/2016 até 01/10/2020)","Retorno nos últimos 60 meses corridos - diária (02/10/2015 até 01/10/2020)","Volatilidade nos últimos 12 meses corridos - diária (02/10/2019 até 01/10/2020)","Sharpe - CDI nos últimos 12 meses corridos - diária (02/10/2019 até 01/10/2020)","Retorno Mínimo nos últimos 12 meses corridos - diária (02/10/2019 até 01/10/2020)","Data do Retorno Mínimo nos últimos 12 meses corridos - diária (02/10/2019 até 01/10/2020)","Retorno Médio nos últimos 12 meses corridos - diária (02/10/2019 até 01/10/2020)","Retorno Máximo nos últimos 12 meses corridos - diária (02/10/2019 até 01/10/2020)","Data do Retorno Máximo nos últimos 12 meses corridos - diária (02/10/2019 até 01/10/2020)"],["1960 PREVIDÊNCIA FI MULTIMERCADO CRÉDITO PRIVOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO","27974854000125","20171124","BEM DTVM","UBS Consenso Investimentos","1.527890071E7","Previdência Multimercado Livre","0,5000000000 %","0.018075233565028492","-0.011283382635453032","0.007324994472590829","0.005146548134959961","0.0034313684099258612","-0.03640072981911979","0.0036853035250978827","0.009743725996567365","0.010758547618012315","0.0237375084855469","-0.008721505158211462","-0.008837519676290428","110","194","","0.0","0.0","0.0","0.019468506480885356","0.01872104166862034","0.025705849482549323","0.01710871038161844","0.024280925853619083","0.1579708669671867","0.09961837680085386","0.046402233442345654","0.029707865157663993","0.02666772981738718","0.0303766834702631","0.037862739608511296","7.403729860236234","-10.181780476150319","1.673786749208706","0.9283911981080655","0.29549927308015517","-2.8559308845261575","0.153032892936012", "2.01606576409371", "3.4809679387370216","8.858625889275775","-4.0764382797250205","-3.2918259103074585","Banco Bradesco","BRMNS4CTF005","Multimercado","453961","0.015128091133770338","0.22953051221849408","","","", "0.0602068100287444", "-0.2966548959883508","-0.020973411926872965", "20200312", "6.676625692826071E-5","0.024694851771157156", "20200313"] ], "colunas": 66, "locale": "pt_BR", "ativos": null,"linhas": 733}';
            res.setHeader('Authorization', 'Basic');
            res.setHeader('User-Agent', 'PostmanRuntime/7.26.5');
            res.setHeader('Accept', '*/*');
            res.setHeader('Accept-Encoding', 'gzip, deflate, br');
            res.setHeader('Connection', 'keep-alive');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    // Quantum API altamir 
    global class QuantumApiFail implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro":[{"codigoErro":400,"nomeErro":error","descricaoErro":"descricao"}]}';
            res.setHeader('Authorization', 'Basic');
            res.setHeader('User-Agent', 'PostmanRuntime/7.26.5');
            res.setHeader('Accept', '*/*');
            res.setHeader('Accept-Encoding', 'gzip, deflate, br');
            res.setHeader('Connection', 'keep-alive');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class bankList implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '{"rsptConsultar": [{"idBanco": 0,"numeroBanco": "string","nomeBanco": "string"}]}';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class bankListFail implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '{"erro": [{"codigoErro": 48,"nomeErro": "CPF_INVALIDO","descricaoErro": "Número CPF inválido"}]}';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class bankListFail2 implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            string jsonresponse = '';
            res.setHeader('Authorization', 'value');
            res.setHeader('Content-Type', 'application/json');
            res.setHeader('x-api-key', 'eb.API_Key__c');
            res.setHeader('canalOperacao', 'eb.Channel__c');
            res.setBody(jsonresponse);
            res.setStatusCode(404);
            return res;
        }
    }
    
    global class bankListController implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '{"rsptConsultar": [{"idBanco": 0,"numeroBanco": "string","nomeBanco": "string"}]}';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class regressiveDetailRequestSuccess implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '{"rsptDetalhar": {"numeroSimulacao": 0,"matricula": "string","tipoPlano": "string","tipoTributacao": "string","valorSolicitado": 0,"detalhes": [{"aliquota": "string","valorResgatadoAliquota": 0,"investimentosResgatados": [{"nome": "string","valorBruto": 0,"valorNominal": 0,"valorRendimentos": 0,"valorImpostoDeRenda": 0,"valorLiquido": 0}]}]}}';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }
    
    global class regressiveDetailRequestFail implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '{"erro": [{"codigoErro": 63,"nomeErro": "SIMULACAO_NAO_ENCONTRADA","descricaoErro": "Não foi encontrada simulação de resgate associada ao número solicitado."}]}';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }
    
    global class regressiveDetailRequestFail2 implements HttpCalloutMock{
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '{"erro": [{"codigoErro": 63,"nomeErro": "SIMULACAO_NAO_ENCONTRADA","descricaoErro": "Não foi encontrada simulação de resgate associada ao número solicitado."}]}';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(404);
            return res;
        }
    }
    global class GetEmailSuccess implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(200);
            return res;
        }
    }  
    
    global class GetEmailErro implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(502);
            return res;
        }
    }  
    
    
    global class GetEmailErro400 implements HttpCalloutMock {
        global HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            String jsonresponse = '';
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonresponse);
            res.setStatusCode(400);
            return res;
        }
    }      
    public class MarketingAuth{
        public String client_id {get;set;}
        public String client_secret {get;set;}
        public String grant_type {get;set;}
    }
    
    public class ReturnLogin{
        public String access_token {get;set;}
    }
    
    public class ReturnSMS{
        public String tokenId {get; set;}
    }
    
    public class ReturnEmail{
        public String requestId {get; set;}
    }
}