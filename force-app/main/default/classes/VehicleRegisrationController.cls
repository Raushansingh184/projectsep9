public class VehicleRegisrationController {

public Vehicle__c V1 { get; set; }
public VehicleRegisrationController()
{
V1 = new Vehicle__c();
}

public void saveMethod() {
if(V1.IsInsured__c==true)
{
insert V1;
}
}
}