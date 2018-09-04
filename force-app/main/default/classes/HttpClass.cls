Public Class HttpClass{

Public HttpClass(){
        
        HTTPRequest requestparam=new HTTpRequest();
        
        requestparam.setEndpoint('https://api.androidhive.info/contacts/');
        requestparam.setMethod('GET');
        //HTTP response class
        HTTP httpparam=new HTTP();
        
        HTTPResponse response=httpparam.send(requestparam);
        string strresponse=response.getBody();
        system.debug('service request '+strresponse);
        

}
}