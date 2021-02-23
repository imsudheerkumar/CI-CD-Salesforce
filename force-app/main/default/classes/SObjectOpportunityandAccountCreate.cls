public class SObjectOpportunityandAccountCreate {
    public static void insertoppacc(){
        SObject accountrec = (SObject)Type.forName('Account').newInstance();
        accountrec.put('Name','WingNut Films 3');
        accountrec.put('Rating','Phone');
        insert accountrec;
        String opportunityid = (String)accountrec.get('Id');
        system.debug(opportunityid);
        // insert opportunity
        
        SObject insertoppor = (SObject)Type.forName('Opportunity').newInstance();
        insertoppor.put('Name' ,'TESTING001');
        insertoppor.put('StageName','Qualification');
        insertoppor.put('CloseDate',date.today());
        insertoppor.put('AccountId',opportunityid);
        insert insertoppor;
        
    }
    
        

}