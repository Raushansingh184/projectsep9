public with sharing class Account_opp {
    public list<wrapperclass> opp1=new list<wrapperclass>();
    public list<account> acc=new list<Account>();
    public string selectedvalue{get;set;}
    public Account_opp(ApexPages.StandardController controller) {
     for(account acc1:[select id,name from account ]){
     acc.add(acc1);
     insert acc;
     }
    }
    public pagereference refresh(){
    
    for(account acc2:[select name ,(select name from opportunities) from account where Name=:selectedvalue]){
   for(opportunity opp : acc2.opportunities){
    opp1.add(new wrapperclass(opp,false));
    
    }
    
    
    }
    return null;
    }
    
     Public class wrapperclass{
     public opportunity opp{get;set;}
     public boolean selected {get;set;}
     public wrapperclass(opportunity opp,boolean s){}
     }    
}