public class UserService {
    public class UserInformation {
        public String userName;
        public String profileId;
        public String emailId;
        public String userType;

        public UserInformation(String userName, String profileId, String emailId, String userType) {
            this.userName = userName;
            this.profileId = profileId;
            this.emailId = emailId;
            this.userType = userType;
        }
    }

    public static UserInformation getCurrentUserDetails() {
        // Fetch current logged-in user
        User currentUser = [SELECT Id, Name, ProfileId, Email, UserType FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];

        // Create a Info to return the user details
        UserInformation userDetails = new UserInformation(
            currentUser.Name,
            currentUser.ProfileId,
            currentUser.Email,
            currentUser.UserType
        );

        return userDetails;
    }
}







/*UserService.UserInformation currentUserDetails = UserService.getCurrentUserDetails();
System.debug('UserName: ' + currentUserDetails.userName);
System.debug('Profile Id: ' + currentUserDetails.profileId);
System.debug('Email Id: ' + currentUserDetails.emailId);
System.debug('UserType: ' + currentUserDetails.userType);*/
