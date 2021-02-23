public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(string param1)
    {
        List<List<sObject>> searchList = [FIND :param1 IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        Contact[] lst = (Contact[])searchList[0];
        Lead[] ld = (Lead[])searchList[1];
        for(Contact a : lst)
        {
            system.debug(a.LastName);
        }
        for(Lead b : ld)
        {
            system.debug(b.LastName);
        }
        return searchList;
    }

}