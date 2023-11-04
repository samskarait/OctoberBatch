public class HiringManagerHandler {
    public static void afterInsert(List<Hiring_Manager__c> hmList){
        List<Recruiter__c> recList= new List<Recruiter__c>();
        if(!hmList.isEmpty()){
            for(Hiring_Manager__c hm:hmList){
                //Create a Recruting Recod
                Recruiter__c rec= new Recruiter__c();
                rec.Name=hm.Name;
                rec.City_Name__c=hm.Location__c;
                rec.Email_Address__c=hm.Email_Address__c;
                rec.Designation__c=hm.Designation__c;
                rec.Hiring_Manager__c=hm.Id;
                recList.add(rec);
            }
        }
        if(!recList.isEmpty()){
            Database.insert(recList,false);
        }
    }

}