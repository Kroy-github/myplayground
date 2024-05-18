public with sharing class DataWeaveUsage {
    public static void dataWeaver() {
        // CSV data for Contacts
        String inputCsv = 'first_name,last_name,email\nCodey,"The Bear",codey@salesforce.com'; 
        DataWeave.Script dwscript = new DataWeaveScriptResource.csvToContacts();
        DataWeave.Result dwresult = dwscript.execute(new Map<String, Object>{'records' => inputCsv});
        List<Contact> results = (List<Contact>)dwresult.getValue();

        Assert.areEqual(1, results.size());
        Contact codeyContact = results[0];
        system.debug('codeyContact :: '+codeyContact);
        Assert.areEqual('Codey',codeyContact.FirstName);
        Assert.areEqual('The Bear',codeyContact.LastName);
    }
}