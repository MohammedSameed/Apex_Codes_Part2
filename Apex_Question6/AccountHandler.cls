public class AccountHandler {

    public static Map<Date, List<Account>> getAccountsByCreationDate() {
        // Query to get all account with created date
        List<Account> allAccounts = [
            SELECT Id, CreatedDate 
            FROM Account
        ];

        // Initialize the map
        Map<Date, List<Account>> dateAccountMap = new Map<Date, List<Account>>();

        // Process the queried accounts
        for (Account acc : allAccounts) {
            // Extract the date part from the CreatedDate
            Date creationDate = acc.CreatedDate.date();

            if (!dateAccountMap.containsKey(creationDate)) {
                dateAccountMap.put(creationDate, new List<Account>());
            }
            dateAccountMap.get(creationDate).add(acc);
        }

        return dateAccountMap;
    }
}