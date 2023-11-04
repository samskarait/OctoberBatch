/*
 * @description : This class used for Lead DMLOperations
 *  @Author : SWAPNAIT
 * @Ceated Date : 31-07-2023
 * @Last Modified Date			Person			Comments
 */
public class LeadHelper {
    
    /*
     * @description : Create New Lead 
     * @Author :
     */
     
    Public void createNewLeadRecord()
    {
        Lead ld=new Lead();
        ld.FirstName='Himaja123';
        ld.LastName='Salesforce12';
        ld.Email='hs12@gmail.com';
        ld.Company='Wipro';
        ld.LeadSource='Web';
        insert ld;
        
    }

}