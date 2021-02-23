public with sharing class TEST {
    public TEST() {

        List<Account__c> getAccounts = [SELECT Account_Type__c, Account_Closed_Date__c, AccountApproved__c, Average_Transaction_deposit__c, Average_Transaction_Withdraw__c, Balance__c, Bank__c, Branch__c, City__c FROM Account__c];
        for(Account__c acc:getAccounts)
        {
            System.debug('acc.Account_Type__c');
        }

    }
}