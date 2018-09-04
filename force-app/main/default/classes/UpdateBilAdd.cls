public class UpdateBilAdd Implements Database.Batchable <SObject>
{
Public Database.Querylocator start(Database.Batchablecontext BC)
{
return database.getquerylocator('Select id,name,BillingAddress,(select id,name,MailingAddress,HomePhone from Contacts where AccountID!=NULL)from Account');

    }
public void execute(database.batchablecontext BC, list<account> acc)
{
list<contact> conlst= new list<contact>();
    for(Account acc1:acc)
    {
    for(Contact con :acc1.contacts)
    {
    con.Mailingstreet=acc1.BillingStreet;
    conlst.add(con);
    }
    }
    update conlst;
}
public void finish(database.batchablecontext BC)
{

}
}