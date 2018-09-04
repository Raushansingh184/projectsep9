trigger Imp on Shop__c (before insert,before update,before delete) {
if(trigger.isinsert){
list<shop__c> shplst =New List<Shop__c>();
for(shop__C shp:Trigger.New){
if(Shp.shopID__c=='Shop B'&& Shp.Product__c=='BabyCare')
Shp.Status__C='Highly Recommended'; 
shplst.add(shp);
}
system.debug('Suganya Value' +shplst);
}if(trigger.isdelete){
for(Shop__C Shp1:Trigger.Old){
if(Shp1.ShopID__C=='Shop C' && Shp1.Product__C=='Cosmetic')
Trigger.Old[0].Product__C.adderror('You are not authorized to delete');
}
}
}