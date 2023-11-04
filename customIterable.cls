public class customIterable implements iterable<Account>{
    
    public Iterator<Account> Iterator(){
        List<Account> accounts=[SELECT Id,Name,NumberofEmployees From Account Limit 10];
        return new CustomIterator(accounts);
        
    }

}