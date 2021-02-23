trigger Test on Bill__c (before insert,after insert,before update ,after update) 

{
    Map<id,Bill__c> am = new Map<id,Bill__c>();
    
    system.debug(am);
    
    
    
}