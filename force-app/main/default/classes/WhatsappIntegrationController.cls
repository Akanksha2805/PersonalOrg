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
        
        String apiKey='EABywUEYufDkBANAMnjHynaM377eHpELvyXoZB6INugrj06nkqc4SD24myYFyyuQnVtEpxUKZBisO86xrgw33bQN2sBYnPuuIdUDRKZA1XZC3xuUaGbR1VkOebYHlyXF4j9vgEG83kGmBZBd3EclkhrXfZBVh2aCxb4jowwZATM2IVRlbVgmJiBvrRCjh38EwLqEBtZCm4gddk6MSSXMgofmH';
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