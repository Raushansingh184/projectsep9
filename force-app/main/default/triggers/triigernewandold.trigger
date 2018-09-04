trigger triigernewandold on Shop__c (before insert,before update) {

for(Shop__c shop :Trigger.new){
system.debug('New Name'+shop.name);
}

for(Shop__c Shopold :Trigger.old){
system.debug('Old Name'+Shopold.name);
}
}