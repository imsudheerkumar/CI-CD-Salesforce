public class CollectionDemo {
    public static void SetDemo(String text)
    {
        Set<String> once = new Set<String>();
        Integer no = 10;
        while(no>0)
        {
            once.add(text +string.valueOf(no) +'@gmail.com');
            no = no - 1;
        }
        
        system.debug('UNSORTED Current List : '  + once);
        
        System.debug('#### ');
        
        System.debug(once.contains('TOF1'));
        
        system.debug(once.size());
        
        
    }
    public static void mapdemo()
    {
        Map<String,String> acc = new Map<String,String>();
        
        Integer no = 10;
        while(no>0)
        {
            acc.put('Test' +string.valueOf(no) , '@gmail.com');
            no = no - 1;
        }
        
        system.debug(acc.keyset());
        
        
        Map<String,String> acc1 = new Map<String,String>();
        
        Integer no1 = 10;
        while(no1>0)
        {
            acc1.put('CO' +string.valueOf(no1) , '@gmail.com');
            no1 = no1 - 1;
        }
        
        acc.putAll(acc1);
        
        system.debug(logginglevel.DEBUG, acc.equals(acc1));
        
        
    }
    
    public static void demo()
    {
        list<account>myAccounts = new list<account>();
        myAccounts = [Select ID, Name from Account limit 10]; 
        map<id,string>myAMap = new map<id,string>();
        for ( Account a : myAccounts )
        {
            myAMap.put(a.ID, a.Name);
        } 
        for ( ID aID : myAMap.keySet() )
        {
           // system.debug(loggingLevel.debug, myAMap.get(aID));
        }   
        
        Map<ID,Transaction__c > Trans= new Map<ID,Transaction__c>([select name,amount__c from transaction__C]);
        for( string val : Trans.keyset())
        {
            //system.debug(Trans.get(val));
        }
    }
    
}