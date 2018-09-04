public class search {
   public string searchval{get;set;}
   public shop__c shop{get;set;}
   Public Boolean checkbox{get;set;}
   public list<shop__c> shoplst{get;set;}
   
   public search(){
   shop=New shop__c();
   }
    public list<shop__c> getshoplst() {

        return shoplst;
    }
    Public Pagereference startsearch(){
    if(checkbox==True){
    shoplst=[select id,name,shopid__c from Shop__c where Name=:searchval and shopid__c=:shop.shopid__c];
    }
    else{
    shoplst=[select id,Name,shopid__c  from Shop__c where Name=:searchval];
    }
    return null;
    }

}