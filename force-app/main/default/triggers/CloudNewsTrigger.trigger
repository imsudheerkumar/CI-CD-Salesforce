trigger CloudNewsTrigger on Cloud_News__e (after insert) {
    
    List<Case> cases = new List<Case>();
    
    Group queue = [SELECT Id FROM Group where Name='Regional Dispatch' and Type='Queue'];
    
    for(Cloud_News__e cl : Trigger.New)
    {
        if(cl.Urgent__c == true)
        {
            Case cs = new Case(
                Priority='High',
                Subject='News team Dispatch to ' + cl.Location__c,
                OwnerId = queue.Id
            );
            
            cases.add(cs);
   
        }
        
    }
    insert cases;


}