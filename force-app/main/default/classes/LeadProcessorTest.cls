@isTest
private class LeadProcessorTest {
    @testSetup 
    static void setup() {
        
        List<Lead> ldlst = new List<Lead>();
        
        for(Integer i=0;i<200;i++)
        {
            ldlst.add(new Lead(LastName='Lead '+i , FirstName = 'Lead First ' +i , Company ='Lead company ' +i));
        }
        insert ldlst;
        
    }
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
    
}