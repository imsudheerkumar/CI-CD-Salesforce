@isTest
private class AccountTriggerTest {
    @isTest static void TestAccountValidationInBulk(){
        
        // test setup data + create 200 new accounts
        List<Account> accts = new List<Account>();
        for(Integer i = 0; i < 200; i++){
            Account acct = new Account();
            acct.Name = 'Test Account' + i;
            acct.BillingState = 'CA';
            accts.add(acct);
        }
        
        // perform test
        Test.startTest();
        insert accts;
        Test.stopTest();
        
        // verify 200 accts inserted + check ShippingState = CA
        List<Account> verifyAccts = [SELECT Id FROM Account];
        System.assertEquals(200, verifyAccts.size());
        System.assertEquals(200, [SELECT Count() FROM Account
                                  WHERE ShippingState = 'CA']);
        
    }
}