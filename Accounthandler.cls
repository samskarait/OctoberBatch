/**
 * @author            : SWAPNAIT
 * @last modified on  : 11-04-2023
 * @last modified by  : SWAPNAIT 
 * Ver   Date         Author     Modification
 * 1.0   11-04-2023   SWAPNAIT   Initial Version
**/
public with sharing class Accounthandler {
   @AuraEnabled
   public static string insertAcc(Account acc){
    if(acc!=null)
    {
        insert acc;
   }
    return acc.Id;
   }
   @AuraEnabled
   public static List<Account> getAccounts(string accId){
    List<Account> accList=[SELECT Id,Name,phone,Rating,Industry FROM Account Where Id=:accId];
    return accList;
   }
}
