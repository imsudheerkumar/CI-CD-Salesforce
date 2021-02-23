@IsTest
public class TestRestrictContactByName {

    @isTest static void positivecheck1()
    {
        
        List<Contact> conlist = new List<Contact>();
        
        Contact c1 = new contact(FirstName='Rao gari', LastName='abbai');
        conlist.add(c1);
        
        
        Test.startTest();
        try{
             insert conlist;
             system.assertEquals(c1.LastName, 'abbai');
            
        }
        catch(DMLException DML)
        {
            string ExpectedMSG=c1.LastName;
            system.assertEquals(ExpectedMSG, 'abbai');
        }
        
        Test.stopTest();
      
    }
    @isTest static void negativecheck1()

    {
        
        List<Contact> conlist = new List<Contact>();
         Contact c2 = new contact(FirstName='Rao gari', LastName='INVALIDNAME'); 
       	conlist.add(c2);
        
         Test.startTest();
        try{
             insert conlist;
            
        }
        catch(DMLException DML)
        {
            string ExpectedMSG='The Last Name "INVALIDNAME" is not allowed for DML';
            system.assertEquals(ExpectedMSG, DML.getDmlMessage(0));
        }
        Test.stopTest();
        
        
    }


}