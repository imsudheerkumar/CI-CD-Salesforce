public class accounts_list {
    public static void acc(){
        
        List<Contact> myAccounts = [select LastName from Contact where LastName like 'Reddy%'];
        system.debug(myAccounts.size());
        delete myAccounts;
        
}
}