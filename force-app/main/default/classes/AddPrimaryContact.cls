public class AddPrimaryContact implements Queueable  {
    
    private Contact c ;
    public string stateabb;
    
    public AddPrimaryContact(Contact c, String StateAbbrev)
    {
        this.c = c;
        this.stateabb = StateAbbrev;
        
    }
    
    public void execute(QueueableContext context)
    {
       List<Account> ListAccount = [SELECT ID, Name ,(Select id,FirstName,LastName from contacts ) FROM ACCOUNT WHERE BillingState = :stateabb LIMIT 200];
         List<Contact> lstContact = new List<Contact>();
         for (Account acc:ListAccount)
         {
                 Contact cont = c.clone(false,false,false,false);
                 cont.AccountId =  acc.id;
                 lstContact.add( cont );
         }
         
         if(lstContact.size() >0 )
         {
             insert lstContact;
         }
             
    }

}