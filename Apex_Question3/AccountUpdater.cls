public class AccountUpdater {
    public Static  void updateAccountNames() {
        // Query to find all Account names starting with 'a'
        List<Account> accountsToUpdate = [
            SELECT Id, Name
            FROM Account
            WHERE Name LIKE 'a%'
        ];
        
        // Print the count of accounts which is found
        Integer count = accountsToUpdate.size();
        System.debug('Number of accounts which names  started with   "a": ' + count);
        
        // Update all the account names to 'Updated'
        for (Account acc : accountsToUpdate) {
            acc.Name = 'Updated';
        }
        
        // Perform the update DML operation
        if (!accountsToUpdate.isEmpty()) {
            try {
                update accountsToUpdate;
                System.debug('Accounts updated successfully.');
            } catch (DmlException e) {
                System.debug('Error updating accounts: ' + e.getMessage());
            }
        }
    }
}