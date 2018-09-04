public class HTTPcontactcontroller_Demo {

Public HTTPcontactcontroller_Demo (){
HttpRequest requestparam=New HttpRequest();
  requestparam.setEndpoint('https://api.androidhive.info/contacts/');
        requestparam.setMethod('GET');
        //HTTP response class
        HTTP httpparam=new HTTP();
        HTTPResponse response=httpparam.send(requestparam);
        string strresponse=response.getBody();
        system.debug('service request '+strresponse);

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

wraplst=new list<wrapperclass>();
for(Integer i=0;i<contactsemail.size();i++){
wrap=new wrapperclass();
wrap.name=contactsname[i];
wrap.id=contactsid[i];
wrap.email=contactsemail[i];

wraplst.add(wrap);
}
}

Public List<wrapperclass> wraplst{get;set;}
wrapperclass wrap{get;set;}
Public class Wrapperclass{
public string name{get;set;}
Public string Id{get;set;}
Public string Email{get;set;}
Public boolean checkbox{get;set;}
}

}