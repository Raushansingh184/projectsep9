public class Getset {
public string name;

public string getname(){
return 'John';
}
public string setname(string s){
name=s;
return name;
}
public List<account> acc{get;set;}
public Pagereference action(){
 acc=[select id,name,type from Account where name=: name];
return NULL;
}
}