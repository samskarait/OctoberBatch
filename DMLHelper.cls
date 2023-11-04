public class DMLHelper {
    /* @description : insert Lead Record
     */
    public static void createBulkRecords(){
        //insert 10 new Lead Records 
        List<Lead> leadList= new List<Lead>();
        for(integer counter=1; counter<=10; counter++) {
            Lead ld=new Lead();
            ld.FirstName='Salesforce';
            ld.LastName='Apex -'+counter;
            ld.Company='Salesforce Inc';
            ld.Status='Open - Not Contacted';
            ld.Rating='Warm';
            ld.Email='la'+counter+'@gmail.com';
            ld.LeadSource='Web';
           // insert ld; 
           leadList.add(ld);
        }
        if(!leadList.isEmpty())
        {
            insert leadList;
        }
        
        system.debug('Number of DML statements used :'+Limits.getDmlStatements());
        system.debug('Number of DML statements Limits :'+Limits.getLimitDmlStatements());
        system.debug('Number of DML Rows Process :'+ Limits.getDmlRows());
        system.debug('Number of DML Rows Limit :'+ Limits.getLimitDmlRows());
       
    }
	/* @desription : Delete Leade Records
	 */
    Public static void deleteLeadRecords(string stringChars){
        /*system.debug('stringChars :'+stringChars);
        if(stringChars!=null){//stringChars!=null
            stringChars+='%';
            List<Lead> leadList=[SELECT Id FROM Lead Where LastName Like:stringChars];
            system.debug(leadList);
            if(!leadList.isEmpty()){
                Delete leadList;
            }
                
        }*/
        Delete [SELECT Id FROM Lead Where LastName Like:stringChars+'%'];
        system.debug('Number of Records Deleted : '+Limits.getDmlRows());
        
    }
    
    /*@description :undelete/Restore Lead Records
     * 
     */
    public static void restoreLeadRecords(string lastname){
        Undelete [SELECT Id FROm Lead Where LastName like:lastname+'%' and isDeleted =true ALL ROWS];
        system.debug('Number of Records restored : '+Limits.getDmlRows());
        system.debug('Number of DML Statements are used : '+Limits.getDmlStatements());
    }
    
    /*@description : Update Account Records for Banking Accounts
     */
    Public static void updateBankingAccount(){
        //step1
        List<Account> accList=[SELECT Id,Name,Rating FROM Account Where Industry='Banking' and Rating!='Hot'];
        //step2 :
        if(!accList.isEmpty())
        {
            for(Account acc:accList){
                acc.Rating='Hot';
            }
            update accList;
        }
    }
    
    /* @description : Upsert Account Records on Case Object
     */
    Public static void upsertCaseRecords(){
        List<Case> caseToUpsert= new List<Case>();
        //Step1 : Update on Case
        List<Case> caseList=[SELECT Id,Status,Priority FROM Case Where Status='New' and Priority!='Medium'];
        if(caseList.size()>0){
            for(Case cs:caseList){
                cs.Priority='Medium';
                caseToUpsert.add(cs);
            }
           // update caseList;
        }
        //Step2 : Insert new ecords
        Case cs1= new Case();
        cs1.Status='New';
        cs1.Priority='High';
        cs1.Type='Electrical';
        cs1.Origin='Web';
        cs1.Subject='Not able to login Salesforce';
        caseToUpsert.add(cs1);
        //Insert cs;
        //
        //UPSERT 
        If(!caseToUpsert.isEmpty()){
            UPSERT caseToUpsert;
        }
    }
    Public Static void mergeAccounts(){
        Account targetAccount=[Select Id,Name From Account Where Id='0015i00000uwOSc'];
        Account sourceAccount=[Select Id,Name From Account Where Id='0015i00000uwOSt'];
        if(targetAccount!=null && sourceAccount!=null){
            Merge targetAccount sourceAccount;
        }
    }
}