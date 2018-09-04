/*
Description:- This class is used to Call an end point URL to get the list of contact from there.
This Class Parses Json Response to required Format.
*/

public class HTTPcontactcontroller {

    public PageReference dosave() {
        List<Contact> conlist=new list <Contact>();
        
        for(wrappercontacts obj1 :lstw2){
            if(obj1.ischecked==true){
            contact con=new contact();
            con.LastName=obj1.Name;
            con.Gender__c=obj1.gender;
            con.Email=obj1.email;
            con.Cid__c=obj1.id;
            conlist.add(con);
            insert con;
        }
        }
       // if(conlist.size()>0)
        //insert conlist;
        //(new pagereference('/apex/HTTPcallout').setRedirect(true))
        return Null;
    } 


    


    

    public HTTPcontactcontroller(){
        set<string> conidset=new set<string>();
        for(contact con:[select id,name,cid__C from contact where cid__c!=Null limit 50000]){
            conidset.add(con.Cid__c);
        }
        //HTTP request class
        HTTPRequest requestparam=new HTTpRequest();
        requestparam.setEndpoint('https://api.androidhive.info/contacts/');
        requestparam.setMethod('GET');
        //HTTP response class
        HTTP httpparam=new HTTP();
        HTTPResponse response=httpparam.send(requestparam);
        string strresponse=response.getBody();
        system.debug('service request '+strresponse);
        
        //jsonParsing
        JSONparser parser1=JSON.createParser(strresponse);
        List<string> contactsid=new list<string>();
        while(parser1.nextToken()!=NULL){
            if((parser1.getCurrentToken()==JSONToken.FIELD_NAME)&&(parser1.getText()=='id')){
                parser1.nextToken();
                contactsid.add(parser1.getText());
            }
        }
        JSONparser parser2=JSON.createParser(strresponse);
        List<string> contactsname=new list<string>();
        while(parser2.nextToken()!=NULL){
            if((parser2.getCurrentToken()==JSONToken.FIELD_NAME)&&(parser2.getText()=='Name')){
                parser2.nextToken();
                contactsname.add(parser2.getText());
            }
        }
        JSONparser parser3=JSON.createParser(strresponse);
        List<string> contactsemail=new list<string>();
        while(parser3.nextToken()!=NULL){
            if((parser3.getCurrentToken()==JSONToken.FIELD_NAME)&&(parser3.getText()=='email')){
                parser3.nextToken();
                contactsemail.add(parser3.getText());
            }
        }
         JSONparser parser4=JSON.createParser(strresponse);
        List<string> contactsgender=new list<string>();
        while(parser4.nextToken()!=NULL){
            if((parser4.getCurrentToken()==JSONToken.FIELD_NAME)&&(parser4.getText()=='gender')){
                parser4.nextToken();
                contactsgender.add(parser4.getText());
            }
        }
        lstw2=new List<wrappercontacts>();
        for(integer i=0;i<contactsgender.size();i++){
            objw1=new wrappercontacts();
            objw1.id=contactsid[i];
            objw1.name=contactsname[i];
            objw1.gender=contactsgender[i];
            objw1.email=contactsemail[i];
            if(!conidset.contains(objw1.id))
            lstw2.add(objw1);
        }
        
    }
    public wrappercontacts objw1{get;set;}
    public List<wrappercontacts> lstw2{get;set;}
    Public class wrappercontacts{
        public boolean ischecked{get;set;}
        public string id{get;set;}
        public string name{get;set;}
        public string address{get;set;}
        public string gender{get;set;}
        public string Email{get;set;}
        public string mobile{get;set;}
    }
}