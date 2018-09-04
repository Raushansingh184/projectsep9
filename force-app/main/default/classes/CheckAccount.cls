@restresource (URLMapping='/ShowAccounts/*')

Global Class CheckAccount{

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