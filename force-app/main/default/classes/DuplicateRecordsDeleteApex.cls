public class DuplicateRecordsDeleteApex {
    public static void run()
    {
         List<property__c> fullList = [Select Id, Title__C From property__c ];
    	Set<String> existingValues = new Set<String>(); //Change this to your colname's type
    	List<property__c> dupList = new List<property__c>();
    
    
                     for (property__c o : fullList)
            {
                if(existingValues.contains(o.Title__C))
                        {
                            dupList.add(o);
                        }
                        else
                        {
                            existingValues.add(o.Title__C);
                        }
             }
        delete dupList;
        
    }    //
}