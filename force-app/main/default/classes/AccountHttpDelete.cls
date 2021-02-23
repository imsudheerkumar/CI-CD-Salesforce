@RestResource(urlMapping ='/api/AccountDelete/*')
global with sharing class AccountHttpDelete {
    
    @HttpDelete
    global static Map<String,String> deleteaccounts()
    {
        RestRequest request = RestContext.request;
        Map<String, String> responseMap = new Map<String, String>();
        //Map<String, String> lst = new Map<String, String>();
        
        String URI = request.requestURI;
        Map<String,String> mapstr = request.params;
        string DeletecontainingWord = mapstr.get('Word');
        
        //String DeletecontainingWord =String.valueOf(URI.substring(URI.lastIndexOf('/')+2));
        
     
        String searchstring = '' + DeletecontainingWord + '%';
        List<Account> del = [select Name from Account where Name Like :searchstring];
        
        try{
            responseMap.put('Size of List',String.valueOf(del.size()));
            Delete del;
            responseMap.put('Message','Successfully Deleted ' +del.size());
           
            responseMap.put('Success','1');
            
            //return responseMap.get('Message');
            
        }
        catch(DMLException ex)
        {
            responseMap.put('Error',ex.getMessage());
            
            //return responseMap.get('Error');
            
        }
        
        return responseMap;
        
        
        
        
        
        
    }

}