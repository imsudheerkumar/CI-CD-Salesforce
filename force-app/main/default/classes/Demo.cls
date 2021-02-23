public class Demo {
    
    public static List<Account__c> acs()
    {
        List<Account__c> accs = Database.query('select Name,Balance__C,city__C,customer_name__C from account__C');
        system.debug(accs);
        return accs;
                                 
                                
    }

}