public class AccountHandler {

    public static void printPersonAccountIdsTraditional() {
        // Query to get all accounts
        List<Account> allAccounts = [
            SELECT Id, IsPersonAccount
            FROM Account
        ];

        // Using traditional for-loop
        for (Integer i = 0; i < allAccounts.size(); i++) {
            Account acc = allAccounts[i];
            if (acc.IsPersonAccount) {
                System.debug('Person Account ID: ' + acc.Id);
            }
        }
        //using Advance for-loop
        for (Account acc :allAccounts ){
            if(acc.IsPersonAccount){
                System.debug('Person Account ID: ' + acc.Id);
            }
        }
    }
}