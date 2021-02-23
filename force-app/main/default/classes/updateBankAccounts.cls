public class updateBankAccounts {
    public void upddate(){
        
        List<Account__c> accList = [select id,name,balance__c from account__c where balance__c<100000];
        
        for(Account__c acc: accList)
        {
            acc.balance__c = acc.balance__c+5000;
        }
        
        update accList;
    }

}