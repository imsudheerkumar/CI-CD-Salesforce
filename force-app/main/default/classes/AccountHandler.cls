public class AccountHandler {
    public static void insertAccount(Integer noofacc)
    {
        Integer n =1;
        List<Account> addAccounts = new List<Account>();
        while(n<=noofacc)
        {
                Account acct = new Account();
                acct.Name ='Acme Inc' +n;
                acct.AccountNumber = 'A000'+n;
                addAccounts.add(acct);
            	n+=1;
        }
        
        insert addAccounts;
       
    }
}