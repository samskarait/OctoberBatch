/*
 * @description : This Class used for Helper Class for Contact
 * @Author  : Swapna IT
 * @Created : 08-08-2023
 * @LastModified Data
 */
public class ContactHelper {
    
    /*
     * @description : Get All Contact Records 
     * @Author : Swapna IT
     */
    public static void getAllContacts(){
        // Step1 :Pull the Records from Database
        List<Contact> conList=[SELECT Id, Name,Email,Phone,Preferred_Time__c,Account.Rating,Account.Name FROM Contact];
        // Step2 :loop throught the Records
        if(!conList.isEmpty()){
            for(Contact con:conList){
            // Print the Value
            system.debug('Name : '+con.Name);
            system.debug('Email : '+con.Email);
            system.debug('Phone : '+con.Phone);
            system.debug('****************** : ');
                //DML
        	}
        }
        
        
        
    }
    
    Public static void getAllContactsRec(){
        for(Contact con:[SELECT Id, Name,Email,Phone,Preferred_Time__c FROM Contact]){
             // Print the Value
            system.debug('Name : '+con.Name);
            system.debug('Email : '+con.Email);
            system.debug('Phone : '+con.Phone);
            system.debug('****************** : ');
        }
    }
    
    // Custom Object Book
    public static void getAllBooks(){
        // Step1 :Pull the Records from Database
        List<Books__c> bookList=[SELECT Id, Name FROM Books__c];
        // Step2 :loop throught the Records
        if(!bookList.isEmpty()){
            for(Books__c book:bookList){
            // Print the Value
            system.debug('Id : '+book.Id);
            system.debug('Name : '+book.Name);
            system.debug('****************** : ');
                //DML
        	}
        }
        
        
        
    }
    
    Public static void getAllBooksRec(){
        for(Books__c book:[SELECT Id, Name FROM Books__c]){
             // Print the Value
            system.debug('Id : '+book.Id);
            system.debug('Name : '+book.Name);
            system.debug('****************** : ');
        }
    }

}