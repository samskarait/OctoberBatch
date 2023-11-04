Global class HMQueuable implements system.Queueable{
    
    Global void Execute(system.QueueableContext qContext){
        //Business Logic
         Hiring_Manager__c hrRecord= new Hiring_Manager__c();
        hrRecord.Name='Queueable123';
        hrRecord.Contact_Number__c='67688787';
        hrRecord.Email_Address__c='Samskarait@gmail.com';
        hrRecord.Location__c='Hyderabad';
        hrRecord.Current_CTC__c=300000;
        insert hrRecord;
        
        if(hrRecord.id!=null){
            system.debug('Hiring Manager Record Idis :'+hrRecord.id);
            system.enqueueJob(new PositionQueueable(hrRecord));
        }
        
    }

}