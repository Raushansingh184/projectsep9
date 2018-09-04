Public class renderclass{

public string name{get;set;}
public string pcklst{get;set;}
public boolean checkbox{get;set;}
public shop__c shop{get;set;}
Public List<shop__c> shplst{get;set;}

public renderclass(){
shop=new shop__c();
checkbox=False;
name='Raushan';
}

public pagereference action(){

if(checkbox==true){
shplst=[select id,name,shopid__c from shop__c where name=:name and shopid__c=:shop.shopid__c];
}
else{
shplst=[select id,name,shopid__c from shop__c where name=:name];
}
return null;
}
}