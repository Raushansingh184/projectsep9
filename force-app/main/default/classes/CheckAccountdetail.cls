@restresource(URLmapping='/showAccountsdetail/*')
global class CheckAccountdetail{

@HttpGet//--It will return the result to the third party tool 
 Global Static Account getAccount()
 {
 RestResponse res=RestContext.response;
 restRequest req=RestContext.request;
 string accountid=req.requestURI.substring(req.requestURI.lastindexof('/')+1);
 system.debug('Account Id:' +accountId);
 Account Result=[select id,Name from account where Id=:accountId];
 return result;
 
 }
 
 @HttpPost
 global static string dopost(string name,string Phone,String AccountNumber) {
 Account acc=new Account();
 acc.Name=Name;
 acc.Phone=Phone;
 acc.AccountNumber=AccountNumber;
 insert acc;
 return acc.id;
 }
 }