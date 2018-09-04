@restresource (URLmapping='/Restcall_for_account/*')

Global Class restclass{
@HttpGet //it will basically return the result to the Third Party system.

Global static List<account> accountdetails(){
List<Account> acc =[Select id,name,Accountnumber from Account];
Return acc;
}
@HTTPPOST
Global static id createaccount(string Accountname, string Accountnumber){
Account acc =new Account();
acc.Name=Accountname;
acc.Accountnumber=Accountnumber;
insert acc;
return acc.id;
}
}