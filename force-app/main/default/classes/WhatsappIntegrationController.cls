public class WhatsappIntegrationController {
    
    @AuraEnabled
    public static void sendWAMessage( String message){
        //String contactNumber='917310012248';
        requestController(message);
        
    }
    public static void requestController(String messageBody){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://graph.facebook.com/v13.0/108369555369844/messages');
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        
        String apiKey='Enter your Api Key';
        String body='{"messaging_product":"whatsapp","to":"917310012248","text":{"body":"'+messageBody+'"}}';
        
        req.setHeader('Authorization', 'Bearer '+apiKey);
        //req.setHeader('Content-Type', 'multipart/form-data; boundary=' + boundary);
        req.setBody(body);
        HttpResponse response= new HttpResponse();
        response=h.send(req);
        system.debug('response>>'+response);
        system.debug('response>>'+response.getBody());
    }

}