

import Foundation
import FirebaseDatabase
import GoogleSignIn

//temporary
var users:[User?] = []


class UserHandler {
    
    let databaseRef = Database.database().reference()
    
    func storeUser(user: User) {
        //  func storeUser(user: User, closure: (Bool) -> Void) {
        databaseRef.child("users/\(user.googleUserId)/profileImageUrl").setValue(user.profileImageUrl)
        databaseRef.child("users/\(user.googleUserId)/fullName").setValue(user.fullName)
        databaseRef.child("users/\(user.googleUserId)/googleUserId").setValue(user.googleUserId)
        databaseRef.child("users/\(user.bioText)/bioText").setValue(user.bioText)
        
    }
    
    
    func getAllUsers(completion: @escaping ([User]) -> Void) {
        databaseRef.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let allUsers = snapshot.value as? NSDictionary
            let allFullNames = allUsers!["fullName"] as? String
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func getCurrentUser(completion: @escaping (User) -> Void) {
        let currentGGUserId = GIDSignIn.sharedInstance()?.currentUser.userID as! String
        var googleUserID: String = String()
        var fullName: String = String()
        var bioText: String = String()
        var profileImageUrl : String = String()
        
        databaseRef.child("users").child("\(currentGGUserId)").observeSingleEvent(of: .value) { (snapshot) in
            
            if let value = snapshot.value as? NSDictionary {
                googleUserID = value["googleUserId"] as! String
                profileImageUrl = (value["profileImageUrl"] as? String)!
                fullName = (value["fullName"] as? String)!
                bioText = (value["bioText"] as? String)!
                
                let currentUser = User(googleUserId: googleUserID, profileImageUrl: profileImageUrl, fullName: fullName, bioText: bioText)
                completion(currentUser)
            }
        }
    }
    

    func createMatch(userID1:String, userID2:String, closure: (Bool) -> Void) {}
    //    func getCurrentUser() -> User { }
    
    
    
}
