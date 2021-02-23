public class GetAllTransactions {
    public void GettingRecords()
    {
        //List<Transaction__c> Transactions_1 = [Select Account_Number__c,Amount__c from Transaction__c where Amount__C>100000];
        //for(Transaction__c Tran:Transactions_1)
        //{
        //    system.debug(Tran.Account_Number__c + ' '+Tran.Amount__c);
        //}
        List<account__C> acc = [select id,Name,Bank__r.Name,Bank__r.bank_sector__c ,(select name from loans__r ) from account__c where id in (select loan__c.bank_account__c from loan__c)];
                
            for(Account__C aa : acc)
            {
                for(loan__c la :aa.loans__r)
                {
                    system.debug(aa.Name +' '+la.Name +'' + aa.Bank__r.Name);
                }
                system.debug(acc.size());
            }
        system.assertEquals(11, acc.size());
    }

}