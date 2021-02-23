global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leadList = [select id,Name,LeadSource from Lead where LeadSource=null LIMIT 200];
        
        for(Lead ld : leadList)
        {
            ld.LeadSource ='Dreamforce';
        }
    }
    }