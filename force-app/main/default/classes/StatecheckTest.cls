@isTest
public class StatecheckTest {
    
    @isTest static void check1()
    {
        String pri=Statecheck.getTaskPriority('CA');
        system.assertEquals('High', pri);
    }
    
    @isTest static void check2()
    {
        String pri=Statecheck.getTaskPriority('CAER');
        system.assertEquals(null,pri);
    }
    @isTest static void check3()
    {
        String pri=Statecheck.getTaskPriority('NY');
        system.assertEquals('Normal', pri);
    }

}