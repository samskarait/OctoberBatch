Global class deletePositionRecordsBatch implements Database.Batchable<sObject>{
    Global List<Position__c> start(Database.BatchableContext bc){
        List<Position__c> pos=[SELECT Id,Name FROM Position__c Where Milestone_Date__c <Today Limit 1];
        return pos;
    }
    Global void Execute(Database.BatchableContext bc, List<Position__c> rec){
        if(rec.size()>0){
            Database.Delete(rec,false);
        }
    }
    Global void Finish(Database.BatchableContext bc){}

}