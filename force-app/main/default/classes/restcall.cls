@restresource (URLMapping='/restcalltoexternal')
Global class restcall{
@HttpGet
Global Static list<account> accountlist(){
list<account> lstacc=new List<account>();
lstacc=[select id,name from Account];

return lstacc;
}
@HTTPPost
Global static id createaccount(String Name,string phone, string Accountnumber){
Account acc= New Account();
acc.name=Name;
acc.Phone=Phone;
acc.AccountNumber=Accountnumber;
insert acc;
return acc.id;
}
}