trigger Discout on Shop__c (before insert,before update,before delete) {
if(Trigger.Isinsert)
{
//insertion ins=New insertion();
Insertion.M1(Trigger.New);
for(Shop__C Shp:Trigger.New)
{
if(Shp.ShopID__c=='Shop A')
{
shp.Discount__c= 4;
}
//insert Shp;
}
}

}