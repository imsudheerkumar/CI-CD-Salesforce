/* BatchApex on Contact Object -- Update Fax of Contact if it is null update it with related Account Fax */
global class ContactFaxUpdateBatch implements Database.Batchable<sObject>, Database.Stateful {
    global Integer ContactListSize=0;
    global Integer SuccessContactListSize = 0;
    global Integer FailureContactListSize = 0;
    
    global List<Contact> start(Database.BatchableContext bc)
    {
        //global Database.QueryLocater  || List<sobject>
        //String Query = 'SELECT Name, Fax, Phone, Email, Account.Name , Account.Fax,Account.Phone from Contact where Account.id!=null and Account.fax!=null and Fax=null and email=null';
        //return Database.getQueryLocator(Query);
        List<Contact> Con = [SELECT Name, Fax, Phone, Email, Account.Name , Account.Fax,Account.Phone from Contact where Account.id!=null and Account.fax!=null and Fax=null and email=null];
        
        
        /* Batchable context bc  
         * 
         * getjobId
         * getchildjobId -- >ID for execute method
         * tracking is done via AsyncApexJob object
         * --> database.batchable is an interface.
         * database.batchableContext is a context variable which store the runtime information (jobId etc...)
        
		*/
        AsyncApexJob [] startmethodjob = [Select Id, ApexClassId, ApexClass.Name, NumberOfErrors, JobItemsProcessed , 
                                 TotalJobItems ,Status from AsyncApexJob where ID=: bc.getJobId()];
        
        System.debug('Batch Apex Start Method Called : ' + startmethodjob);
        return con;
    }
    
    global void execute(Database.BatchableContext bc, List<Contact> contactList)
    {
        /*AsyncApexJob [] executemethodjob1 = [Select Id, ApexClassId, ApexClass.Name, NumberOfErrors, JobItemsProcessed , 
                                 TotalJobItems ,Status from AsyncApexJob where ID=: bc.getJobId()];
        
        System.debug('Batch Apex Execute Method Called : ' + executemethodjob1);
        
        
        AsyncApexJob [] executemethodjob = [Select Id, ApexClassId, ApexClass.Name, NumberOfErrors, JobItemsProcessed , 
                                 TotalJobItems ,Status from AsyncApexJob where ID=: bc.getChildJobId()];
        
        System.debug('Batch Apex Execute Method Called : ' + executemethodjob);*/
        
        Integer sizeOfContactList = contactList.size();
        ContactListSize+=sizeOfContactList;
        
        for(Integer i =0; i<sizeOfContactList;i++)
        {
            Contact con = contactList.get(i);
            
            if(con.Fax == null || con.Fax=='')
            {
                con.Fax = con.Account.Fax;
            }  
            else if(con.Phone == null || con.Phone=='')
            {
                con.Phone = con.Account.Phone ;
            }
            //Update Description with Batch Date
            con.Description = 'Contacts have been updated on a BatchApex Run on Date (GMT Format) '  +Datetime.now() ; 
            con.Email= (con.Name).replaceAll( '\\s+', '')+'@gmail.com';
        }
        
        //update contactList;
        //using Database.update method
        Database.SaveResult[] Databaseupdate =  Database.update(contactList,false);
        Integer sizeofDatabaseresult = Databaseupdate.size();
        for(Integer i =0; i<sizeofDatabaseresult; i++)
        {
            Database.SaveResult sr = Databaseupdate.get(i);
            //getting Count of Success/Failure
            if(sr.isSuccess()) SuccessContactListSize+=1;
            else FailureContactListSize+=1;
           
        }
        
    }
    
    global void finish(Database.BatchableContext bc)
    {
         AsyncApexJob [] finishmethodjob = [Select Id, ApexClassId, ApexClass.Name, NumberOfErrors, JobItemsProcessed , 
                                 TotalJobItems ,Status from AsyncApexJob where ID=: bc.getChildJobId()];
        
        System.debug('Batch Apex Finish Method Called : ' + finishmethodjob);
        
        List<String> emaillist = new List<String>();
        emaillist.add('dheer.gsk@gmail.com');
        emaillist.add('sudheerkumar.g@infosys.com');
        //Sending a message to Contact about the update
        Messaging.SingleEmailMessage SendEmail = new Messaging.SingleEmailMessage();
        SendEmail.setSenderDisplayName('ALBFoods Batch Responser');
        SendEmail.setSubject('Batch Processed');
        SendEmail.setHtmlBody('Hi Contacts have been updated on a BatchApex Run on Date (GMT Format) '  +Datetime.now()
                               + '<br/> Total ContactList size :  ' + ContactListSize
                               + '<br/> Succesfully Updated Contact Count : ' + SuccessContactListSize
                               + '<br/> Failure Contact Count : ' + FailureContactListSize
                             );
        
        SendEmail.setToAddresses(emaillist);
       
        
       // SendEmail list
       Messaging.SingleEmailMessage[] lst = new List<Messaging.SingleEmailMessage>();
        lst.add(SendEmail);
        
       //SendEmail
       Messaging.sendEmail(lst, false);
        
    }
    
    

}