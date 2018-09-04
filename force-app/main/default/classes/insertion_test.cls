@isTest
Public class insertion_test
{
Static TestMethod Void f1()
{

Contact c= new contact(FirstName='Test',lastName='Contact');
insert c;
Shop__c Shp1= new Shop__c();
Shp1.Name='Suganya';
Shp1.Product__c='Babycare';
Shp1.Customer_Contact__c=c.ID;
Shp1.ShopID__C='Shop A';
Test.starttest();
insert Shp1;
Test.stoptest();
}
}