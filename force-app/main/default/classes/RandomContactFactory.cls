public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer noofContacts, String lastnameofContact)
    {
        List<Contact> conlst = new List<Contact>();
        
        for(Integer i=1;i<=noofContacts;i++)
        {
            Contact con = new Contact(FirstName='Test'+i,LastName=lastnameofContact);
            conlst.add(con);
        }
        
        
        
        insert conlst;
        
        return conlst;
        
       
    }
    

}