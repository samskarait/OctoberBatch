/*
 * @description : This class used for Static and Dynamic SOQL
 * @Author : SWAPNA IT
 * @Created : 08/08/2023
 * @Last Modified
 */
public class StaticDynmicSOQL {
    /*
     * @description : this Method is used to holds the Data in Map Collection
     * @Author : SWAPNA IT
     * @Created Date
     */
    public static void staticMap(){
        Map<Id,Case> caseMap=new Map<Id,Case>();// 
        //Static SOQL
        List<Case> caseList=[SELECT Id,Status FROM Case];
        for(Case cs:caseList){
            caseMap.put(cs.Id, cs);
            system.debug('in Lookp caseMap-->'+caseMap);
        }
        system.debug('caseMap-->'+caseMap);
            
        
        //Result Map 
        
        
    }

}