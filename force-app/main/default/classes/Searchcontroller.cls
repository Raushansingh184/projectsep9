public class Searchcontroller {

Public String Name{get;set;}
Public List<Account> acclst{get;set;}
Public boolean checkbox{get;set;}
Public String Accountnumber{get;set;}
Public Searchcontroller (){
}
Public pagereference SearchMethod(){
if(checkbox==true){
acclst=[Select id,name,Accountnumber from Account where Name=:Name and Accountnumber=:Accountnumber];

}else{
acclst=[Select id,name,Accountnumber from Account where Name=:Name];
}
Return Null;
}

}