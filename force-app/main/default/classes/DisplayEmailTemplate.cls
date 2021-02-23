public class DisplayEmailTemplate {

Public List<Transaction__c> tempList{get;set;}

public DisplayEmailTemplate(){

tempList=new List<Transaction__c>();

 tempList=[ SELECT Name FROM Transaction__c];

  }

}