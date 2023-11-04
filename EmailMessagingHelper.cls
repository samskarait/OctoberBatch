public class EmailMessagingHelper {
	//Create 3 leads 
    public static void createLeads(){
        List<lead> leadList= new List<Lead>();
        for(integer count=1; count<4; count++){
            Lead ld=new Lead();
            ld.FirstName='EmailLead -'+count;
            ld.LastName='LocalFile -'+count;
            ld.Email='samskarait@gmail.com';
            ld.Rating='Hot';
            ld.Industry='Technology';
            ld.Company='Dell';
            ld.AnnualRevenue=8000000;
            leadList.add(ld);
        }
        if(!leadList.isEmpty()){
            Database.insert(leadList,false);
            SendNotificationlocalFile(leadList);
        }
    } 
	//Send Email Notification (Toaddress, Subject, Description, Attachment)
    Public static void SendNotification(List<Lead> ldlist){
        if(!ldlist.isEmpty()){
            List<Messaging.SingleEmailMessage> emailList=new List<Messaging.SingleEmailMessage>();
            for(Lead ldRecord:ldlist){//3 -> 1
                //Prepare Email Notification 
                Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
                //toAddress List<string> /string[]
                string[] toAdress =new string[]{ldRecord.Email};
                email.setToAddresses(toAdress);
                //Replay To Name
                email.setReplyTo('Support@maruthi123.com');    
                //Display Name
                email.setSenderDisplayName('Support Team');
                 //EmailTemplate el=[SELECT Subject, Description, HtmlValue, Body, Name, Id, DeveloperName FROM EmailTemplate where Name='Notify Lead Person'];
                //Subject
                string emailSubject='Thank you For Interest  ' +ldRecord.FirstName;
               email.setSubject(emailSubject);
                //email.setSubject(el.Subject);
               
                //content
                string emailContent='Dear '+ldRecord.FirstName+ +ldRecord.LastName+', <br/><br/>'+
                    'Thank you for your Interest! <br/><br/>'+
                    'We are working on youe data. My team will contact you soon! <br/><br/>'+
                    'Your Information : <br/><br/>'+
                    'Lead Person Name:'+ldRecord.FirstName+ +ldRecord.LastName+
					'<br/>Lead Annual Revenue :'+ldRecord.AnnualRevenue+
                    '<br/>Lead Email:'+ldRecord.Email+
                    
                    '<br/><br/> Please go through the Attached Vehicle Information'+
                    '<br/><br/> This is System-genreated Email.'+
                    'Thank you,<br/>'+
                    'Maruthi, <br/>'+
                    'CEO.';
                  email.setHtmlBody(emailContent);
                
                //prepare Attachment 
                Messaging.EmailFileAttachment attach=new Messaging.EmailFileAttachment();
                attach.setFileName(ldRecord.FirstName+'_'+ldRecord.LastName+'.pdf');
                attach.setContentType('Application/Pdf'); //image,png,text,plain, pdf, application. video, mp4,mp3
                attach.body=Blob.toPdf(emailContent);
                List<Messaging.EmailFileAttachment> attachlist= new List<Messaging.EmailFileAttachment>();
                attachList.add(attach);
                email.setFileAttachments(attachList);
                emailList.add(email);
                    
            }
            if(!emailList.isEmpty()){
                Messaging.SendEmailResult[] result=Messaging.sendEmail(emailList);
            }
        }
        
    } 
    //local File 
    ////Send Email Notification (Toaddress, Subject, Description, Attachment)
    Public static void SendNotificationlocalFile(List<Lead> ldlist){
        if(!ldlist.isEmpty()){
            List<Messaging.SingleEmailMessage> emailList=new List<Messaging.SingleEmailMessage>();
            for(Lead ldRecord:ldlist){//3 -> 1
                //Prepare Email Notification 
                Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
                //toAddress List<string> /string[]
                string[] toAdress =new string[]{ldRecord.Email};
                email.setToAddresses(toAdress);
                //Replay To Name
                email.setReplyTo('Support@maruthi123.com');    
                //Display Name
                email.setSenderDisplayName('Support Team');
               Document doc=[SELECT Id, Name, ContentType, Type, IsPublic, BodyLength, Body, Url, Description, Keywords, DeveloperName FROM Document where DeveloperName='AdminCourse'];
                 
                //Subject
                string emailSubject='Thank you For Interest  ' +ldRecord.FirstName;
               email.setSubject(emailSubject);
               
                //content
                string emailContent='Dear '+ldRecord.FirstName+ +ldRecord.LastName+', <br/><br/>'+
                    'Thank you for your Interest! <br/><br/>'+
                    'We are working on youe data. My team will contact you soon! <br/><br/>'+
                    'Your Information : <br/><br/>'+
                    'Lead Person Name:'+ldRecord.FirstName+ +ldRecord.LastName+
					'<br/>Lead Annual Revenue :'+ldRecord.AnnualRevenue+
                    '<br/>Lead Email:'+ldRecord.Email+
                    
                    '<br/><br/> Please go through the Attached Vehicle Information'+
                    '<br/><br/> This is System-genreated Email.'+
                    'Thank you,<br/>'+
                    'Maruthi, <br/>'+
                    'CEO.';
                  email.setHtmlBody(emailContent);
                
                //prepare Attachment 
                Messaging.EmailFileAttachment attach=new Messaging.EmailFileAttachment();
                attach.setFileName(doc.Name);
                attach.setContentType(doc.ContentType); //image,png,text,plain, pdf, application. video, mp4,mp3
                attach.body=doc.Body;
                List<Messaging.EmailFileAttachment> attachlist= new List<Messaging.EmailFileAttachment>();
                attachList.add(attach);
                email.setFileAttachments(attachList);
                emailList.add(email);
                    
            }
            if(!emailList.isEmpty()){
                Messaging.SendEmailResult[] result=Messaging.sendEmail(emailList);
            }
        }
        
    } 
}