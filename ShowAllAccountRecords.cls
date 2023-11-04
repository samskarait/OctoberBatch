public with sharing class ShowAllAccountRecords {
    Public List<Account> accList{get;set;}
    Public ShowAllAccountRecords(){
        accList=[SELECT Id, Name, Industry, AnnualRevenue,Rating,Type, Active__c FROM Account Order By Name];
    }

}