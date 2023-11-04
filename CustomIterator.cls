public class CustomIterator implements Iterator<Account>{
    List<Account> accs;
    private integer currentIndex;
    
    //constructor
    public CustomIterator(List<Account> accList){
        accs=accList;
        currentIndex=0;
    }
    
    public boolean hasnext(){
        return currentIndex<accs.size();//true/false
    }
    
    public Account next(){
        if(hasnext()){
            return accs[currentIndex++];
        }
        else{
            system.debug('Iterator has no more elements');
            return null;
        }
        
    }

}