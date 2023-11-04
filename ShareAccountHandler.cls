/*
 * @description : Handler class is used for account sharig based Share_To__c Fields and Annual Revenue Field
 */ 
public class ShareAccountHandler {
    Public static void AfterInsert(List<Account> accList){
        List<Accountshare> accShareList= new List<Accountshare>();
        for(Account acc: accList){
            if(acc.Share_To__c!=null){
                Accountshare accShare= new Accountshare();
                accShare.AccountId=acc.Id;
                accShare.UserOrGroupId=acc.Share_To__c;
                accShare.RowCause='Manual';
                accShare.OpportunityAccessLevel='READ';
                accShare.CaseAccessLevel='READ';
                if(acc.AnnualRevenue>=5000000){
                    accShare.AccountAccessLevel='Edit';
                }
                else{
                     accShare.AccountAccessLevel='READ';
                }
                accShareList.add(accShare); 
            }
        }
        
        if(!accShareList.isEmpty()){
            Database.insert(accShareList,false);
        }
    }
}