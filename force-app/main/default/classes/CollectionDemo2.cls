public class CollectionDemo2 {
    public static void demo()
    {
        Map<Id,account__C> BankAccountIDMap = new Map<ID,account__c>
            ([select name,customer_name__c,bank__c,branch__c,balance__C from account__C]);
        
        for(String Id : BankAccountIDMap.keyset())
        {
          system.debug(BankAccountIDMap.get(Id).customer_name__c);
          
        }
        
    }
}