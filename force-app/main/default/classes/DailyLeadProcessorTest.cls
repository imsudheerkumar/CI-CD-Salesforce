@isTest
public class DailyLeadProcessorTest {
    @isTest public static void dailylead()
    {
        String cron ='0 0 22 18,19 * ? *';
        List<Lead> leadlst = new List<Lead>();
        for(Integer i =0 ;i<198;i++)
        {
            Lead ld = new Lead(LastName ='LeadTestDLP ' + i, FirstName ='LeadTestDLPFirst ' + i , company ='LeadTestCompany ' +i);
            leadlst.add(ld);
        }
        if(leadlst.size()>0)
        {
            insert leadlst;
        }
        
        Map<id,Lead> leadmap = new Map<id,Lead>(leadlst);
        List<id> leadids = new List<id>(leadmap.keySet());
        
        Test.startTest();
        String jobID = System.schedule('LeadProcessorTest', cron, new DailyLeadProcessor());
        Test.stopTest();
       	
        List<Lead> lt = [select id,Name from lead where LeadSource='Dreamforce'];
        system.assertEquals(leadids.size()+2, lt.size(), 'All Updated');
        
    }

}