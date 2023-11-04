@isTest
public class BulkLeadConvertTest {
    static testmethod void TestAutoLeadConversion(){
        //Creat a Lead Record
        Lead ldRecord = new Lead();
        ldRecord.FirstName='Class';
        ldRecord.LastName='Test Record';
        ldRecord.Company='Testing';
        ldRecord.Phone='4534343434334';
        ldRecord.Fax='43343434343';
        ldRecord.Rating='Hot';
        ldRecord.Industry='Banking';
        ldRecord.AnnualRevenue=45300000;
        ldRecord.status='Open-Not Contacted';
        insert ldRecord;
        
        ldRecord.Status='Closed - Converted';
        update ldRecord;
       
    }
        

}