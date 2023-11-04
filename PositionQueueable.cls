Global class PositionQueueable implements system.Queueable{
    Hiring_Manager__c hrRecord;
    public PositionQueueable(Hiring_Manager__c hr){
        hrRecord=hr;
    }
    global void execute(system.QueueableContext qContext){
        Position__c pos=new Position__c();
        pos.Name='Apex Queueable';
        pos.Location__c='Hyderabad';
        pos.Number_of_Vacancies__c=2;
        pos.Position_Status__c='New';
        pos.Hiring_Manager__c=hrRecord.Id;
        pos.HR_Email_Id__c=hrRecord.Email_Address__c;
        Pos.HR_Contact_Number__c=hrRecord.Contact_Number__c;
        insert Pos;
        
        
    }

}