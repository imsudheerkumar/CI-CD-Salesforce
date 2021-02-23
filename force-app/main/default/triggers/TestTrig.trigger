trigger TestTrig on Account (before insert,after insert) 
{
    public static TriggerOperation operation() {
    if (Trigger.isBefore) {
        if (Trigger.isUpdate) return TriggerOperation.BEFORE_UPDATE;
        else if (Trigger.isInsert) return TriggerOperation.BEFORE_INSERT;
        else if (Trigger.isDelete) return TriggerOperation.BEFORE_DELETE;
    } else if (Trigger.isAfter) {
        if (Trigger.isUpdate) return TriggerOperation.AFTER_UPDATE;
        else if (Trigger.isInsert) return TriggerOperation.AFTER_INSERT;
        else if (Trigger.isDelete) return TriggerOperation.AFTER_DELETE;
        else if (Trigger.isUndelete) return TriggerOperation.AFTER_UNDELETE;
    }
    return null;
}
}