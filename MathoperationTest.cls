@isTest
public class MathoperationTest {
    static testmethod void testMathOperation(){
        test.startTest();
        //invoke class
        Mathoperation.addMethod(100,400,700);
        
        Mathoperation.DivMethod(10, 30);
        
        Mathoperation.mulMethod(78,88);
        
        Mathoperation.subMethod(99,77);
        
        system.assertNotEquals(5500, Mathoperation.Multiply(10,45,10)) ;
        test.stopTest();
    }

}