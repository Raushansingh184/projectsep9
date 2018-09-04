public class accupdate1{
public Static void f1()
{
list<account> acclst = [select id,Name,Email__c,(select Name from Contacts where AccountID!=NULL) from Account];
list<contact> conlst = new list <contact>();
for(account acc2: acclst)
{
for(contact con: acc2.contacts)
{
con.Email=acc2.Email__c;
conlst.add(con);
}
}
update(conlst);
}
}