/*
* @description : Account Controller
* @author : SWAPNAIT
* @createdDate : 12-10-2023
* @lastmodifiedDate : 
*/
public with sharing class AccController {
    /*
    * @descrption : Get All Acount Id and Name.
    * @Return : returning All Account List
    */
    @AuraEnabled
    public static List<Account> getAllAccounts(){
        List<Account> accList=[SELECT Id,Name FROM Account Order by Name];
        return accList;
    }
    /*
    * @descrption : Creating Accounts.
    * @Return : returning New Account
    */
    @AuraEnabled
    public static string createAccount(string lname, string lPhone, string lRating,string lEmail){
        Account acc=new Account();
        acc.Name=lname;
        acc.Phone=lPhone;
        acc.Rating=lRating;
        acc.Email__c=lEmail;
        insert acc;
        return acc.Name;
    }
    
}