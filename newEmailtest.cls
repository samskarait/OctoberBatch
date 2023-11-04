public class newEmailtest {
	//Create 3 leads 
    public static void createLeads(){
        List<lead> leadList= new List<Lead>();
        for(integer count=1; count<4; count++){
            Lead ld=new Lead();
            ld.FirstName='NEmail2 -'+count;
            ld.LastName='NMsg2 -'+count;
            ld.Email='samskarait@gmail.com';
            ld.Rating='Hot';
            ld.Industry='Technology';
            ld.Company='Dell';
            ld.AnnualRevenue=8000000;
            leadList.add(ld);
        }
        if(!leadList.isEmpty()){
            Database.insert(leadList,false);
            SendNotification(leadList);
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
                
                Document doc=[SELECT IsPublic, Id, FolderId, Name, DeveloperName, ContentType, Type, BodyLength, Body, Url, Description, Keywords, AuthorId FROM Document where DeveloperName='newpdf'];
                //prepare Attachment 
                Messaging.EmailFileAttachment attach=new Messaging.EmailFileAttachment();
                attach.setFileName(doc.Name);
                attach.setContentType(doc.ContentType);
                attach.setBody(doc.Body);
                //attach.setFileName(ldRecord.FirstName+'_'+ldRecord.LastName+'.pdf');
                //attach.setContentType('Application/Pdf'); //image,png,text,plain, pdf, application. video, mp4,mp3
                //attach.body=Blob.toPdf(emailContent);
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