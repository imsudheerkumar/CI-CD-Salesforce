@isTest
public with sharing class Covid19Test {

    @isTest
    public static void treatPatientTest() {

        //create the Instance of the class
        Covid19 Hyderabad = new Covid19(10);

        //check if count is 10
        system.assertEquals(10,Hyderabad.getTreated(),'Treated Count Does not Match');

        Covid19 Jaipur = new Covid19(120);

        //
        system.assertEquals(120,Jaipur.getTreated(),'Treated Count Does not Match');
        //check recoveredinCountry
        system.assertEquals(130, Covid19.recoveredInCountry, 'Value Mismatach');

        //calling treatpatient method
        Jaipur.treatPatient();

        system.assertEquals(131, Covid19.recoveredInCountry, 'ERROR');
        system.assertEquals(121, Jaipur.getTreated(), 'ERROR');
    }
}