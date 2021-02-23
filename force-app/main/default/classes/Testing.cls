public class Testing {
    public static void Banking(Integer numofaccs, Integer numberof_cons)
    {
        List<Account> acc = new List<Account>();
        //create accts
        for(Integer i=0; i<numofaccs;i++)
        {
            Account a = new Account(Name='teer' + i);
            acc.add(a);
        }
        insert acc;
        
        
    }

}