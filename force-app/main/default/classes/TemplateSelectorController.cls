public class TemplateSelectorController {

    public TemplateSelectorController() {

    }

    Public id Flist1{get;set;}
     Public List<Folder> Flist{get;set;}
   
     public TemplateSelectorController (ApexPages.StandardController controller) 
     {    
     Flist1 = controller.getRecord().Id; 
    
     //Flist1 = (Folder)controller.getRecord(); 
     system.debug('####'+Flist1);
     map<id,string> emaillist1=new Map<id,string>();
     list<emailTemplate> emailist=new list<emailTemplate>();
     emailist=[select folderid,id,name from EmailTemplate];
     for(emailtemplate emp:emailist){
     emaillist1.put(emp.folderid,emp.name);
       }
     } 
   Public boolean Boolean1{get;set;}
    public String selectedTemplateId { public get; public set; }
    

    Public Pagereference Actionsupport(){
    showsection();
    Return Null;
    }
    public boolean Showsection(){
    Boolean1=False;
    if(Boolean1==False)
    Boolean1=True;
    Return Boolean1;
    }
   public pagereference assignfoldervalue(){
   
   return null;
   }
     
   //  public Folder assignfoldervalue1(){
    // system.debug('####Folder Value'+Flist1);
    // return Flist1;
     //}
     
    Public  List<selectoption> getFodlerName(){
    Flist=new List<Folder>();
    Flist=[select id,name from Folder where (type='Email'OR ID=:UserInfo.getOrganizationId() OR ID=:UserInfo.getUserId())];
    
    List<selectoption> option1 =new List<selectoption>();
    option1.add(new selectoption('','---NONE---'));
    for(Folder f:Flist){
    option1.add(new selectoption(f.id,f.name));
    }
    system.debug('Folder@@@'+option1);
    Return option1;
    }
    public List<SelectOption> getMyPersonalTemplateOptions() {
        List<SelectOption> options = new List<SelectOption>();
        
           options.add(new selectoption('None','Select'));
           
        for (EmailTemplate t : [ select Id,Name from EmailTemplate where folderid=:Flist1 ]) {
           
           
            options.add(new SelectOption(t.Id,t.Name));
            
        }
        system.debug('@@@@options'+options);
        return options;
    }
   
    
    //Private Map<Id,Folder> FolderMap {get;set;}
    //FolderMap = new Map<id,Folder>([select id,name from Folder where type='Email']);
    //FolderMap = new Map<Id, Folder>([Select id , Name from Folder ]);
    //Public list<selectoption> Emailfoldername(){
    //List<selectOption>options1=new List<selectoption>();
    
    //}
}