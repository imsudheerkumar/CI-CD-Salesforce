public class GetAllBankAccounts {
    
    public static void getAllTransactions(){
        List<SObject> Trans = [select Name, Account_Type__c, Balance__c, (Select Id,Transaction_Type__c, Amount__c from Transactions__r where Amount__c > 10000 and Transaction_Type__c = 'Deposit') from Account__c where Balance__c>100000];
        
        for(SObject sobj : Trans)
        {
            system.debug('Account Number : ' +(String)sobj.get('Name') +'Balance : '+ (Decimal)sobj.get('Balance__c')
                         + 'Transaction Type : ' +sobj.getSObject('Transactions__r').getSObjects('Transaction_Type__c')
                        
                        
                        );
        }
    }

}