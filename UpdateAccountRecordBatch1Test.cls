@isTest
public class UpdateAccountRecordBatch1Test {
    static testmethod void testBatch(){
        Triggersetting__c cs=new Triggersetting__c();
        cs.ActiveCheckbox__c=false;
        cs.Name='AccountTrigger';
        insert cs;
        
        createAccountRecord();
        UpdateAccountRecordBatch bt= new UpdateAccountRecordBatch();
        Database.executeBatch(bt);
    }
    //Method for Account Creation 
    public static void createAccountRecord(){
        List<Account> acclist= new List<Account>();
        for(integer counter=1; counter<=10; counter++){
             Account accRecord=new Account();
            accRecord.Name='Testing Account';
            accRecord.Active__c='Yes';
            accRecord.Industry='Banking';
            accRecord.Rating='Hot';
            accRecord.Fax='3434534534';
            accRecord.Website='http://www.salesforce.com';
            accRecord.Email__c='dfgdfgdf@gmail.com';
            accList.add(accRecord);
        }
        Database.insert(accList,false);
    }

}