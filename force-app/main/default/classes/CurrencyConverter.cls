public class CurrencyConverter {
    
    public static decimal covertToEuro(decimal euro)
    {
        Decimal inr = 0.0;
        
        HTTP h = new HTTP();
        
        HTTPRequest request = new HTTPRequest();
        
        request.setEndpoint('https://api.exchangeratesapi.io/latest');
        
        request.setMethod('GET');
        
        HTTPResponse res = h.send(request);
        
        Map<String, Object> jsonBody = (Map<String,Object>)Json.deserializeUntyped(res.getBody());
        
        system.debug(jsonBody);
        
        Map<String,Object> mMap = (Map<String,Object>)jsonBody.get('rates');
        
        Decimal convorate = (Decimal) mMap.get('INR');
        
        inr = euro * convorate;
        
        
       
        
        return inr;
    }

}