public class Fitness {
    
    public static Decimal calculateBMI(Decimal Body_Weight, Decimal Body_Height)
    {
        if(Body_Weight<0 || Body_Height<0) {
            return -1;
        }else if(Body_Weight == 0 || Body_Height == 0){
            return 0;
        }
        else{
            Decimal result = Body_Weight / (Body_Height*Body_Height);
        	return result;
        }
        
    }
    
    public static Decimal calculatePace(Decimal Kilometers, Decimal distance)
    {
        Decimal hr = Kilometers/60;
        Decimal pace = distance/hr;
        return pace;
    }

}