@isTest
public class TestVerifyDate {
    
    @isTest static void CheckDates1()
    {
        Date d1 = VerifyDate.CheckDates(Date.parse('10/03/2015'),Date.parse('18/03/2015'));
        system.assertEquals(Date.parse('18/03/2015'), d1);
    }
    
    @isTest static void CheckDates2()
    {
        Date d2= VerifyDate.CheckDates(Date.parse('10/02/2015'), date.parse('15/03/2015'));
        boolean d3 = VerifyDate.DateWithin30Days(Date.parse('10/02/2015'), date.parse('15/03/2015'));
        if(d3){
            system.debug('Date is within 30 days');
        }
        else
        {
            system.debug('Not within 30 days');
        }
        system.assertEquals(date.parse('28/02/2015'), d2);
    }
    
    //@isTest static void datewithin30days1()
    //{
     //  Boolean d3=VerifyDate.DateWithin30Days(Date.parse('15/02/2015'), date.parse('13/03/2015'));
   //    system.assertEquals(false, d3);
    //}
    
}