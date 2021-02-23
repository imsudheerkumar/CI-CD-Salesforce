public class NewCaseListController {
    public List<Case> getNewCases()
    {
        List<Case>  cases = [select id, CaseNumber,subject,ownerId from Case where status='New'];
        return cases;
        
    }
    
    public List<Account__c> getNewCases1()
    {
        List<Account__c>  Acc = [SELECT Name,AccountApproved__c,Account_Type__c,Average_Transaction_deposit__c,Average_Transaction_Withdraw__c,
                             Balance__c,Bank__c,Branch__c,City__c FROM Account__c ];
        return Acc;
        
    }

}