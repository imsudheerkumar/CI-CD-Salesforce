global class AccountProcessor {
    @future
    public static void countContacts(Set<Id> recordIds) 
        {
            List<Account> accounts = [Select Id, Name,Number_of_Contacts__c,(select id from contacts) from Account Where Id IN :recordIds];
       
            for(Account acc : accounts)
            {
                List<contact> lstcontact =acc.contacts;
                acc.Number_of_Contacts__c =lstcontact.size();
            }
            update accounts;
            
        }

}