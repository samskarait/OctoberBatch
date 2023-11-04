global class SchedulableBatch implements Database.Batchable<sobject>,schedulable{
    global Database.QueryLocator start(Database.BatchableContext bc){
        string query='SELECT Id,LeadSource FROM Lead Where LeadSource=null Limit 5';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext  bc, List<sobject> scope){
		List<Lead> leadList=(List<Lead>)scope; 
        if(leadList.size()>0){
            for(Lead ld:leadList){
                ld.LeadSource='Other';
            }
            Database.update(leadList,false);
        }
    }
    global void finish(Database.BatchableContext bc){}
    global void execute(schedulableContext sc){
        //Invoke Batch Class
        //Database.executeBatch(new SchedulableBatch());
        //SchedulableBatch bt= new SchedulableBatch();
        //Database.executeBatch(bt);
        string cronExp1='0 55 * * * ?'; //2 AM 30 min
		system.schedule('Scheulable 2 AM Job', cronExp1, new SchedulableBatch());
    }
}