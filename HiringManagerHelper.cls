/*
 * @description : This class used for Hiring Manager Helper
 *  @Author : SWAPNAIT
 * @Ceated Date : 31-07-2023
 * @Last Modified Date			Person			Comments
 */
public class HiringManagerHelper {
    
    /*
     * @description : This Method is used to create Hiring Manager Record.
     * @Author :
     * Scenario : 1 call method 2 from Method 1
     */
    public static void createHRRecord(string hname, string hEmail, string hlocation, string hnumber, integer hctc,string pname){
        Hiring_Manager__c hr=new Hiring_Manager__c();
        hr.Name=hname;
        hr.Email_Address__c=hEmail;
        hr.Location__c=hlocation;
        hr.Contact_Number__c=hnumber;
        hr.Current_CTC__c=hctc;
        insert hr;
        
        createPositionRecord(hr.Id,pname,hEmail);
    }
    
    //Scenario : return the value of Method 1 
    //Method 2 is called from outside of the Apex class .... while calling the Methd 2 pass the Method1 return value
    public static string createHRRecord1(string hname, string hEmail, string hlocation, string hnumber, integer hctc,string pname){
        Hiring_Manager__c hr=new Hiring_Manager__c();
        hr.Name=hname;
        hr.Email_Address__c=hEmail;
        hr.Location__c=hlocation;
        hr.Contact_Number__c=hnumber;
        hr.Current_CTC__c=hctc;
        insert hr;
        return hr.id;

    }
    
    public static void createPositionRecord(string hrId, string pname,string pEmail){
        
        Position__c pos=new Position__C();
        pos.Name=pname;
        pos.Hiring_Manager__c=hrId;
        pos.HR_Email_Id__c=pEmail;
        insert pos;
        
    }

}