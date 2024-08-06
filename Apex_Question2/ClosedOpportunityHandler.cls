public  class ClosedOpportunitiesHandler {
    public static void ClosedOpportunities() {
        // Query to get all closed opportunities with AccountId populated
        List<Opportunity> closedOpportunities = [
            SELECT Id, AccountId
            FROM Opportunity
            WHERE IsClosed = TRUE AND AccountId != NULL
        ];

        // Initialize the list, set, and map
        List<Id> opportunityIds = new List<Id>();
        Set<Id> accountIds = new Set<Id>();
        Map<Id, Id> opportunityAccountMap = new Map<Id, Id>();

        // Process the queried opportunities
        for (Opportunity opp : closedOpportunities) {
            opportunityIds.add(opp.Id);
            accountIds.add(opp.AccountId);
            opportunityAccountMap.put(opp.Id, opp.AccountId);
        }

        // Print the results
        System.debug('Opportunity IDs: ' + opportunityIds);
        System.debug('Account IDs: ' + accountIds);
        System.debug('Opportunity to Account Map: ' + opportunityAccountMap);
    }
}