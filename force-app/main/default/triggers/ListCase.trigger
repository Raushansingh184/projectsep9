trigger ListCase on Shop__c (Before Insert) {

Set<String> useremail=new Set<string>();

For(Shop__c shp :trigger.new){
useremail.add(shp.Shop_Email__c);
}
List<user> ulst=[Select id,name,Email from User where email=:useremail];
// ulst=[Select id,name,Email from User where email=:useremail];
Map<String,User> usermap=new Map<String,User>();
For(User u : ulst){
usermap.put(u.email,u);
}
For(Shop__c shp: trigger.new){
User u=usermap.get(shp.Shop_Email__c);
shp.name=u.name;
}

/*For(Shop__c shp:trigger.new){
For(User u :ulst){
If(shp.Shop_Email__c.equals(u.email)){
shp.name=u.Name;
}
}
}*/

}