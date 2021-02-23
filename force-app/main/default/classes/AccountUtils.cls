public class AccountUtils {
    public static List<Account> accountsByState(string stateabbrev){
        
        return [Select Id,Name from Account where BillingState=:stateabbrev];   
    }
}