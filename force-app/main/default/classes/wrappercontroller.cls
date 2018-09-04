public class wrappercontroller {

public list<wrapperclass> getoperation(){
wrap2 = new list<wrapperclass>();
for(Account wrap1: [select id,name,active__C from account]){
wrap2.add(new wrapperclass(wrap1));
}
return wrap2;
}
public pagereference selectedcon(){
List<wrapperclass> wraplist=new list<wrapperclass>();
list<account> acclist=new list<account>();
for(wrapperclass wclass: wrap2){
if(wclass.checkbox==True)
wclass.acc.name='Raushanwrapper';
acclist.add(wclass.acc);
}
update acclist;

return null;
}
Public list<wrapperclass> wrap2{get;set;}
Public class wrapperclass{
public account acc{get;set;}
public boolean checkbox{get;set;}
public wrapperclass(Account a){
acc=a;
checkbox=false;
}
}
}