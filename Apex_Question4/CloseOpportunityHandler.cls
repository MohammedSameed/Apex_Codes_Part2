public class ClosedOpportunitiesHandler {
    public static void processClosedOpportunities() {
        // Query to get all closed opportunities with AccountId populated
        List<Opportunity> closedOpportunities = [
            SELECT Id, AccountId, Name
            FROM Opportunity
            WHERE IsClosed = TRUE AND AccountId != NULL
        ];

        // Initialize the map
        Map<Id, List<Opportunity>> accountOpportunityMap = new Map<Id, List<Opportunity>>();

        // Process the queried opportunities
        for (Opportunity opp : closedOpportunities) {
            if (!accountOpportunityMap.containsKey(opp.AccountId)) {
                accountOpportunityMap.put(opp.AccountId, new List<Opportunity>());
            }
            accountOpportunityMap.get(opp.AccountId).add(opp);
        }

        // Print the results
        for (Id accountId : accountOpportunityMap.keySet()) {
            System.debug('Account ID: ' + accountId + ', Opportunities: ' + accountOpportunityMap.get(accountId));
        }
    }
}