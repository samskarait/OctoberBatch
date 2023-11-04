Global class PositionSchedulable implements system.Schedulable{
    
    Global void Execute(system.SchedulableContext sc){
        //Invoke Batch Class
        deletePositionRecordsBatch bt= new deletePositionRecordsBatch();
        Database.executeBatch(bt);
    }

}