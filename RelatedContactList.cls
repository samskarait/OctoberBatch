public class RelatedContactList {
    public List<AccountWrapper> accwrapList{get; set;}
    Public List<Contact> selectedAccountList {get; set;}
    
    Public RelatedContactList(){
        accwrapList= new List<AccountWrapper>();
        List<Account> accList=[SELECT Id,Name,Type,Industry,Phone,(SELECT Name,Phone,Email,Account.Name FROM Contacts) FROM Account LIMIT 10];
        for(Account a:accList){
            accwrapList.add(new AccountWrapper(a));
        }
    }
    
    public void getSelectedAcounts(){
        selectedAccountList= new List<Contact>();
        selectedAccountList.clear();
        system.debug('accwrapList-->'+accwrapList);
        for(AccountWrapper obj: accwrapList){
            system.debug('obj.isSelected===>'+obj.isSelected);
            if(obj.isSelected==true){
                for(contact c:obj.acc.contacts){
                    selectedAccountList.add(c);
                }
            }   
        } 
    }
    
    //Account Wrapper Class
    Public class AccountWrapper{
        Public Account acc {get; set;}
        //public Contact con{get; set;}
        //Public List<Account> accList {get; set;}
        public Boolean isSelected {get; set;}
        
        public AccountWrapper(Account a){
            acc=a;
            isSelected=false;
            //con=c;
            
        }
    }
}