/*
 * @description : this Class used for storing the SOQLresult in Map
 * @author
 * @Created Date
 */
public class SOQLInMap {
    
    public static void getallCases(){
        //Method 1
        Map<Id,Case> caseMap= new Map<Id,Case>(); //initializing Map
        for(Case cs: [SELECT Id,Status From Case]){ //Loop through the SOQL Query
            caseMap.put(cs.Id,cs); //Pushing the Data into the Map
        }
        
        system.debug('for loop output '+caseMap);
        
        //Method 2 
        Map<Id,Case> caseMap1=new Map<Id,Case>([SELECT Id,Status From Case LIMIT 2]);
        system.debug('caseMap1 '+caseMap1);
        for(Case cs: caseMap1.values()){
            system.debug('Case Record Details '+cs);
        }
    }
    
    public static void getBankingAccounts(string accIndustry){
        for(Account acc:[SELECT Id,Name,Industry FROM Account Where Industry=:accIndustry]){
            system.debug('Account record : '+acc.Id);
        }
        List<string> industries= new List<string>{'Banking','Energy','Consulting'};
        getIndustries(industries);
    }
    
    public static void getIndustries(List<string> industries){
        for(Account acc: [SELECT Id,Name,Industry From Account WHERE Industry IN:industries]){
            system.debug('Industry Records '+acc);
        }
    }
    
    public static void getCourses(){
        List<Course__c> coursesList=[SELECT Id, Name,IsDeleted FROM Course__c ALL Rows];
        system.debug('coursesList :'+coursesList);
    }  
    
    public static void getContacts(){
        List<Contact> conList=[SELECT Id,FirstName,LastName,Email FROM Contact ORDER BY LastName OFFSET 5];
        
        system.debug('contact List Size :'+conList.size());
        for(Contact con:conList){
            system.debug('contact Last Name :'+con.LastName);
        }
    }
    
    Public static void getRecordCount(){
        //static SOQL Query
        integer recordCount =[SELECT count() FROM Contact];
        system.debug('Static Record Count is : '+ recordCount);
            
        //Dynamic SOQL Query
        string contactCount='SELECT count() FROM Contact';
        integer cCount=Database.countQuery(contactCount);
        system.debug('Dynamic Record Count is : '+ recordCount);
    }

}