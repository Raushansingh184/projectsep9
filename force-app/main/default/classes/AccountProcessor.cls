public class AccountProcessor{


public void func(){
    
Public List<account> lstaccdx=new list<account>();
list<account> acclst=[select id ,name from Account];
list<id> accid=new list<id>();
for(account acc : acclst){
accid.add(acc.id);
}
countcontacts(accid);
}
@future
public static void countContacts(List<id> lst){
list<contact> con=new List<contact>();
List<account> acclst2=new List<account>();
for(integer i=0;i<lst.size();i++){
List<account> acclst1=[select id,name,(select id,name from contacts) from account where id=:lst[i]];
for(integer j=0;j<acclst1.size();j++){
con=[select id,name from contact where accountid=:acclst1[j].id];
for(account acc: acclst1){
acc.Number_of_contacts__c=con.size();
acclst2.add(acc);
}
}
}
update acclst2;

}

}