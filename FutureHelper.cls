public class FutureHelper {
    Public static void mixedDMLOpertaion(){
        //Setup Object
        User userToDetivate=[SELECT Id,UserName,isActive FROM User where UserName='samskarait@gmail.com.chaterr'];
        
        if(userToDetivate.Id!=null){
            userToDetivate.isActive=False;
        }
        update userToDetivate;
     	
        Contact con=new Contact();
        con.LastName='Future Method';
        con.Email='samskarait@gmail.com';
        
        string conRecord=system.JSON.serialize(con);
        createHRRecord(conRecord);
        
    }
    @Future(callout=true)
    public static void createHRRecord(String conRecord){
        Contact cont=(Contact)JSON.deserialize(conRecord, Contact.class);
        system.debug(cont);
        //Non-Setup Object
        Hiring_Manager__c hrRecord= new Hiring_Manager__c();
        hrRecord.Name='Mixed DML';
        hrRecord.Contact_Number__c='67688787';
        hrRecord.Email_Address__c='Samskarait@gmail.com';
        hrRecord.Location__c='Hyderabad';
        hrRecord.Current_CTC__c=300000;
        insert hrRecord;
    } 

}