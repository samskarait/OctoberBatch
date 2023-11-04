Global class UpdateAccountRecordBatch implements Database.Batchable<sObject>{
    
    Global Database.QueryLocator start(Database.BatchableContext bContext){
        string query='SELECT Id,Name,Rating,Industry,Active__C FROM Account';
        return Database.getQueryLocator(query);
    }
    Global void Execute(Database.BatchableContext bContext, List<sObject> recList){
        if(!recList.isEmpty()){
            System.debug('recList--->'+recList);
            List<Account> accList=new List<Account>();
            for(sObject sobj:recList){
                Account accRecord=(Account)sobj;
                accRecord.Active__c='No';
                accRecord.Industry='Finance';
                accRecord.Rating='Warm';
                accRecord.Website='http://www.salesforce.com';
                accRecord.Email__c='samskarait@gmail.com';
                accList.add(accRecord);
            }
            
            if(!accList.isEmpty()){
                Database.update(accList,false);
            }
                
            
        }
    }
    Global void Finish(Database.BatchableContext bContext){
        AsyncApexJob jobDetails=[SELECT Id, JobType, ApexClassId, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors, CompletedDate, MethodName,CreatedBy.Email
                                 FROM AsyncApexJob where id=:bContext.getJobId()];
        system.debug('jobDetails-->'+jobDetails);
        List<Messaging.SingleEmailMessage> emailList= new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage email= new Messaging.SingleEmailMessage();
        List<String> toAddress= new List<String>{'samskarait@gmail.com',jobDetails.CreatedBy.Email};
        email.setToAddresses(toAddress);
        email.setSenderDisplayName('Batch job');
        email.setSubject('Weekly Batch Job Support');
         string emailContent='Dear , <br/><br/>'+
                    'Thank you for your Interest! <br/><br/>'+
                    'We are working on youe data. My team will contact you soon! <br/><br/>'+
                    'Your Information : <br/><br/>'+
                    'Job Record Id '+jobDetails.Id+
					'<br/>Total Number of Batches Available '+jobDetails.TotalJobItems+
                    '<br/>Error Records :'+jobDetails.NumberOfErrors+
                    '<br/><br/> Please go through the Attached Vehicle Information'+
                    '<br/><br/> This is System-genreated Email.'+
                    'Thank you,<br/>'+
                    'Maruthi, <br/>'+
                    'CEO.';
        email.setHtmlBody(emailContent);
        emailList.add(email);
        if(!emailList.isEmpty()){
           messaging.SendEmailResult[] reult  =messaging.sendEmail(emailList);
        }
       
        
    }

}