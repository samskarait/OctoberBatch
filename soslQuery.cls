public class soslQuery {
    public static void searchInSObject(string searchText){
        //List<List<sObject>> searchList =[FIND 'Infosys' IN ALL FIELDS Returning Account(Name),Contact(LastName,FirstName)];
        List<List<sObject>> searchList =[FIND :searchText IN ALL FIELDS Returning Account(Name),Contact(LastName,FirstName)];
        system.debug('SOSL Details '+searchList);
        
        //List<Account> searchAccount=(List<Account>)searchList[0];//Converting List<list<sObject>> to List<Account>
        Account[] searchAccounts=(Account[])searchList[0];
        Contact[] searchContacts =(Contact[])searchList[1];
        system.debug('Account Details '+searchAccounts);
        system.debug('Contact Details '+searchContacts);
        //Loop through 3 Accounts and 4 Contacts
        for(Account a:searchAccounts) {
            system.debug('Account Name : '+a.Name);
            
        }
        
        for(Contact con:searchContacts){
            system.debug('Contact First Name : '+con.FirstName);
            system.debug('Contact Last Name : '+con.LastName);
        }
        
    }

}