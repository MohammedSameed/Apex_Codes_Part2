public class ReturnJson {

    public static String getAccountsAsJson() {
        // Query to get all accounts
        List<Account> allAccounts = [
            SELECT Id, Name, CreatedDate
            FROM Account
        ];

        // Convert the list of accounts to JSON format
        String jsonString = JSON.serialize(allAccounts);

        return jsonString;
    }
}