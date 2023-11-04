public class Child_Inheritance extends Parent_Inheritance{
    
    Public void Calculate(){
        integer y=50;
        system.debug( x*y);
        //system.debug('No Access Modifier: '+A);
        //system.debug('Private Access Modifier: '+C);
        system.debug('Protected Access Modifier: '+D);
        publicMethod('SwapnaIT');
        protectedMethod();
        //printName();        
    }
    public override void printName(){
        //super.printName();
        system.debug('This is child name '+ super.myFirstName());
    }

}