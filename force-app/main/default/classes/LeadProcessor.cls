global class LeadProcessor implements Database.Batchable<sObject> , Database.Stateful {
    
    global Integer LeadListSize =0;
    global Integer SuccessLeadUpdateCount=0;
    global Integer FailureLeadCount=0;
    
     global Database.QueryLocator start(Database.BatchableContext bc) 
    {
        return Database.getQueryLocator([Select LeadSource From Lead ]);
    }

    
    global void execute(Database.BatchableContext bc , List<Lead> LeadList)
    {
        LeadListSize = LeadList.size();
        for(Lead ld : LeadList)
        {
            ld.LeadSource = 'Dreamforce';
               
         
            
        }
      
        update LeadList;
        
        
        /* Database.SaveResult[] Databaseupdate = Database.update(LeadList, false);
        Integer updatecount = Databaseupdate.size();
        
        for(Integer i=0; i<updatecount;i++)
        {
            Database.SaveResult sr = Databaseupdate.get(i);
            //getting Count of Success/Failure
            if(sr.isSuccess()) SuccessLeadUpdateCount+=1;
            else FailureLeadCount+=1;
        } 
        */
        
        
        
    }
    
    global void finish(Database.BatchableContext bc)
    {
        List<String> SenderEmailList = new List<String>();
        SenderEmailList.add('dheer.gsk@gmail.com');
        SenderEmailList.add('sudheerkumar.g@infosys.com');
        
        Messaging.SingleEmailMessage email1 = new Messaging.SingleEmailMessage();
        email1.setSubject('Lead Records updated with BatchApex Update ' + Datetime.now());
        email1.setSenderDisplayName('Lead BatchApex Processer');
        email1.setHtmlBody('Hi User , '
                          + ' <br/> Total Lead Record Count : ' +LeadListSize
                          + '<br/>  Success Lead Record Count : ' +SuccessLeadUpdateCount
                          + '<br/>  Failure Lead Record Count : ' +FailureLeadCount
                         );
        email1.setToAddresses(SenderEmailList);
        
        
        
        List<Messaging.SingleEmailMessage> completelist = new List<Messaging.SingleEmailMessage>();
        completelist.add(email1);
        
          //SendEmail
       	Messaging.sendEmail(completelist, false); 
        
        system.debug('Total Lead Record Count : ' + LeadListSize
                          + 'Success Lead Record Count : ' +SuccessLeadUpdateCount
                          + 'Failure Lead Record Count : ' +FailureLeadCount);
        
        
    }

}