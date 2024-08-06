public class GenericFieldUpdater {
    // Generic method to update a field of a given object with a specified value
    public static void updateField(String objectName, String fieldName, String recordId, Object fieldValue) {
        try {
            // Construct the sObject dynamically
            sObject recordToUpdate = Database.query('SELECT Id, ' + fieldName + ' FROM ' + objectName + ' WHERE Id = :recordId LIMIT 1');

            // Use Schema to get the field describe result
            Schema.SObjectType sObjectType = Schema.getGlobalDescribe().get(objectName);
            Schema.DescribeSObjectResult sObjectDescribe = sObjectType.getDescribe();
            Map<String, Schema.SObjectField> fieldMap = sObjectDescribe.fields.getMap();

            // Check if the field exists on the object
            if (!fieldMap.containsKey(fieldName)) {
                throw new IllegalArgumentException('Field ' + fieldName + ' does not exist on object ' + objectName);
            }

            // Set the field value
            recordToUpdate.put(fieldName, fieldValue);

            // Update the record
            update recordToUpdate;
        } catch (Exception e) {
            // Handle exceptions
            System.debug('An error occurred: ' + e.getMessage());
            throw e; // rethrowing the exception after logging
        }
    }
}