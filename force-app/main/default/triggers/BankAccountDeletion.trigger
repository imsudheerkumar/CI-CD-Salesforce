trigger BankAccountDeletion on Bank__c (before delete) {
    
    for(Bank__c  contObj:trigger.old)
    {
        if(contObj.Total_number_of_Accounts__c>3)
        {
            contObj.addError('Bank has  '+ contObj.Total_number_of_Accounts__c +' Accounts So you cannot delete ! Please contact ADMIN');
        }
    }


}