public VIRTUAL class Parent_Inheritance {
           integer A=10;
    public integer x=20;
   // Global integer B=30;
    Private integer c=40;
    Protected integer D=60;
    
    void noaccess(){
        system.debug('This is No access Parent Method');
    }
    public void publicMethod(string Name){
        system.debug('This is Public access Parent Method ' +Name);
    }
    private void privateMethod(){
        system.debug('This is Private access Parent Method');
    }
    Protected void protectedMethod(){
        system.debug('This is Protected access Parent Method');
    }
    
    Public Virtual void printName(){
        system.debug('This is Name from Parent Method');
    }
    
    Public Virtual string myFirstName(){
        return 'Mark';
    }
        

}