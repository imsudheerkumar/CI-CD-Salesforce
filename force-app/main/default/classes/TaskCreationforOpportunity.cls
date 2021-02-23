public class TaskCreationforOpportunity {
    public static void remindOwners(List<Opportunity> OpportunityList)
    {
        List<Task> CreateTask = new List<Task>();
        
    
        //mapfunction
        Map<Integer,String> monthNameMap=new Map<Integer, String>{1 =>'January', 2=>'February', 3=>'March', 4=>'April', 5=>'May',
                                                                    6=>'June', 7=>'July', 8=>'August', 9=>'September',10=>'October',
                                                                    11=>'November', 12=>'December'};


        for(Opportunity opp:OpportunityList)
        {
            Task opportunityTask = new Task(
                WhatId = opp.Id,
                OwnerId = opp.OwnerId,
                ActivityDate = Date.today()+5,
                Subject ='Crossed the Opportunity Close Date ',
                Description = 'Please follow-up with the Opportunity owner and Close the Opportunity by ' + 
                				Date.today().addDays(5).day()+getdatethortr(Date.today().addDays(5).day()) + ' of ' + monthNameMap.get(Date.today().addDays(5).month()));
                
            CreateTask.add(opportunityTask);
        }
        
        if(CreateTask.size()>0)
        {
            insert CreateTask;
            system.debug('Inserted Tasks' +CreateTask);
        }
        
        
        
    }
    public static string getdatethortr(Integer day)
    {
        if(day == 1 || day == 21)
        {
            return 'st';
        }
        else if (day == 2 || day ==22)
        {
            return 'nd';
        }
        else if (day == 3 || day == 23)
        {
            return 'rd';
        }
        else
        {
            return 'th';
        }
    }

}