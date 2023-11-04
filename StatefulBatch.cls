Global class StatefulBatch implements Database.Batchable<sObject>,Database.stateful{
    global integer DirectCustomerCount=0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        string query ='SELECT Id, Type, AnnualRevenue FROM Account';
        return Database.getQueryLocator(query);
    }
    global void Execute(Database.BatchableContext bc,List<sObject> sobj){
        List<Account> accList=(List<Account>)sobj;
        for(Account ac:accList){
            if(ac.Type=='Customer - Direct'){
                DirectCustomerCount++;
            }
        }
        
    }
    global void finish(Database.BatchableContext bc){
        system.debug('Total Count of Direct Customers '+DirectCustomerCount);
    }

}