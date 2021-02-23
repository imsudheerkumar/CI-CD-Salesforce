public class ContactSearch {
    
    public static List<Contact> searchForContacts(string param1, string param2)
    {
        List<Contact> t =[select id,Name from contact where lastname=:param1 and Email=:param2];
        system.debug(t[0].Name);
        return t;
        
        
 
    }

}