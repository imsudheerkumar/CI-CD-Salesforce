@isTest
public class FitnessTest {
    
    @isTest
    static void calculateBMITest_001(){
        Decimal Body_Weight = 60;
        Decimal Body_Height= 1.2;
        Decimal result = Fitness.calculateBMI(Body_Weight,Body_Height);
        system.assertEquals(41.67, result.setScale(2),'BMI is 41.7 for Height 1.2cms and Weight 60Kgs');
    }
    @isTest
    static void calculateBMITest_002(){
        Decimal Body_Weight = 0;
        Decimal Body_Height= 1.2;
        Decimal result = Fitness.calculateBMI(Body_Weight,Body_Height);
        system.assertEquals(0, result,'Value Cannot be 0');
    }
    @isTest
    static void calculateBMITest_003(){
        Decimal Body_Weight = 60;
        Decimal Body_Height= 0;
        Decimal result = Fitness.calculateBMI(Body_Weight,Body_Height);
        system.assertEquals(0, result,'Value Cannot be 0');
    }
    @isTest
    static void calculateBMITest_004(){
        Decimal Body_Weight = -60;
        Decimal Body_Height= 1.2;
        Decimal result = Fitness.calculateBMI(Body_Weight,Body_Height);
        system.assertEquals(-1, result,'Value Cannot be in -ve');
    }

}