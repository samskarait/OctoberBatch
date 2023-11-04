global class IterableBtch Implements Database.Batchable<Account>{
    
    global iterable<Account> start(Database.BatchableContext bc){
        return new customIterable();
        
    }
    global void Execute(Database.BatchableContext bc, List<Account> acclist){
        List<Account> accounts= new List<Account>();
        if(!acclist.isEmpty()){
            for(Account acc:acclist){
                acc.Name='Iterable Batch';
                acc.NumberofEmployees=69;
                accounts.add(acc);
            }
            if(!accounts.isEmpty()){
                Database.update(accounts,false);
            }
        }        
        
    }
    global void Finish(Database.BatchableContext bc){
        
    }

}