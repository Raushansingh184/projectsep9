trigger MapusecaseTrigger on Shop__c (Before Insert) {
Set<String> allemail=new Set<String>();
for(Shop__c shop : trigger.New){
if(Shop__c.Shop_Email__c!=Null){
allemail.add(shop.Shop_Email__c);
}
}
Map<String,Account> AccMap=New Map<String,Account>();
List<Account> lstacc=[Select id,name,Account_email__c from Account where Account_Email__c=:allemail];
for(Account acc:lstacc){
AccMap.put(acc.Account_Email__c,acc);
}
for(Shop__c shop1:trigger.new){
Account acc=AccMap.get(shop1.Shop_Email__c);
shop1.Product__c=acc.Name;
}
}