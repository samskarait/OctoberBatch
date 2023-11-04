public class DatabaseHelper {
    /*@description : Insert 5 new Hiring Manager Records
     */
    public static void createHRRecords(){
        List<Hiring_Manager__c> hrList=new List<Hiring_Manager__c>();
        for(integer counter=1; counter<=5; counter++){
            Hiring_Manager__c hr= new Hiring_Manager__c();
            hr.Name='APEX HR -'+counter;
            hr.Contact_Number__c='9987654348';
            hr.Location__c='Hyderabad';
            hr.Designation__c='HR Manager';
            hr.Current_CTC__c=10000;
            if(counter!=3){
                hr.Email_Address__c='Samskarait@gmail.com';
            }
            
            hrList.add(hr);
    	}
        //insert hrList;
        //Database
        if(hrList.size()>0){
            Database.saveResult[] saveResult=Database.insert(hrList,false);
            for(Database.saveResult result:saveResult ){
                if(result.isSuccess()){
                    system.debug('Successfully Inserted Records ....'+result.getId());
                }
                else{
                    for(Database.Error error: result.getErrors()){
                        system.debug('Error Status...'+error.getStatusCode()+'Error Field ....'+error.getFields());
                    }
                }
            }
        }
        
        
    }
 

}