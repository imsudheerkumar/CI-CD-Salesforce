public class StringArrayTest {
    
    //public static method : generateStringArray
    public static List<string> generateStringArray(integer param1){
        
        List<string> tests = new List<string>();
        for (integer i=0; i<param1;i++)
        {
            string number1=string.valueOf(i);
            tests.add('Test '+number1);
        }
        return tests;  
      }
}