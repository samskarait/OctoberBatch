/*
 * @description : This class is used to handle multiple SOQL Queries
 * @Created Date : 10/08/2023
 * @Author : SWAPNAIT
 */
public class DatabaseClass {
    
    Public Static Void getAllAccounts(){
        List<Account> accList=[SELECT Id,Name,Rating FROM Account WHERE Name Like 'Con%'];
        
        for(Account acc:accList){
            System.debug('account Records '+acc);
        }
    }
        
    Public Static Void getAllAccts(string startingChar){//startingChar=New
       // List<Account> accList=[SELECT Id,Name,Rating FROM Account WHERE Name Like: startingChar];//SELECT Id,Name,Rating FROM Account WHERE Name Like New==> Like 'New%'

        List<Account> accList=[SELECT Id, Name FROM Account WHERE Name LIKE :startingChar + '%'];
        
        for(Account acc:accList){
            System.debug('account Records '+acc);
        }
    }

}