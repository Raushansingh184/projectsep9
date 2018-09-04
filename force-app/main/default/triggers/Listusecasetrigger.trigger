trigger Listusecasetrigger on Shop__c (Before Insert) {
Set<string> allemail=new Set<String>();
for(Shop__c shop :trigger.new){
if(shop.Shop_Email__c!=Null){
allemail.add(shop.Shop_Email__c);
}
}
List<Account> acclst=[select id,name,Account_Email__c from Account where Account_Email__c=:allemail ];

for(Shop__c shop1: trigger.new){
for(Account acc: acclst){
if(shop1.Shop_Email__c.equals(acc.Account_Email__c )){
shop1.Product__c=acc.Name;
}
}
}
}