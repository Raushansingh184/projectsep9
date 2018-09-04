Global class UpdateContactAddresses implements 
    Database.Batchable<sObject> {
    
    // instance member to retain state across transactions
    //global Integer recordsProcessed = 0;
    Global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID,Name, ' +
            ' (SELECT ID,Name, MailingStreet, MailingCity, ' +
            'MailingState, MailingPostalCode FROM Contacts) FROM Account '  
            
        );
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        // process each batch of records
        List<Contact> contacts = new List<Contact>();
        
        for (Account account : scope) {
            for (Contact contact : account.contacts) {
                contact.Firstname= account.Name;
               
                // add contact to list to be updated
                contacts.add(contact);
                // increment the instance member counter
               
            }
        }
        update contacts;
    }    
    global void finish(Database.BatchableContext bc){
       
    }    
}