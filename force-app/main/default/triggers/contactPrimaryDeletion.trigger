trigger contactPrimaryDeletion on Contact (before delete) {
    
    for(Contact contObj:trigger.old)
    {
        if(contObj.IsPrimary__c)
        {
            contObj.addError('Primary Contact Cannot be Deleted you can disable it if you want');
        }
    }

}