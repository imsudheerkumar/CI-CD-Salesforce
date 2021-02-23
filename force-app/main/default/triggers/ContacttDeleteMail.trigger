trigger ContacttDeleteMail on Contact (after delete) {
    if(trigger.isDelete)
    {
         system.debug('Triggered due to delete activity in Contact object');
         
    }
}