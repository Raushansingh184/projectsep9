@istest
Public class AccountProcessorTest{

public static testmethod void accountmethod(){
Account acc=new account();
acc.Name='Test';
insert acc;
List<id> acclst=new List<id>();
acclst.add(acc.id);
AccountProcessor accpro=new AccountProcessor();
accpro.func();
test.starttest();
AccountProcessor.countContacts(acclst);
test.stoptest();
}
}