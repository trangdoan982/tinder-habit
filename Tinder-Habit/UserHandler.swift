

import Foundation
import FirebaseDatabase

//temporary
var users:[User?] = []


class UserHandler {
    
    let databaseRef = Database.database().reference()
    
  
  func getAllUsers(closure: ([User]) -> Void) {}
  func storeUser(user: User) {
//  func storeUser(user: User, closure: (Bool) -> Void) {
        //send to Firebase
        
        //set key "profileImageUrl" to
        databaseRef.child("users/\(user.googleUserId)/profileImageUrl").setValue(user.profileImageUrl.absoluteString)
        databaseRef.child("users/\(user.googleUserId)/fullName").setValue(user.fullName)
        databaseRef.child("users/\(user.googleUserId)/googleUserId").setValue(user.googleUserId)
        
//        return user
    }
  
    func createMatch(userID1:String, userID2:String, closure: (Bool) -> Void) {}
//    func getCurrentUser() -> User { }
    
    func getAllUsers() {
        databaseRef.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
        
        
        //    func getProfileImageUrl(user:User) {
        //
        //        databaseRef.child(user.googleUserId).observeSingleEvent(of: .value, with: { snapshot in
        //            guard let value = snapshot.value as? User else {
        //                return
        //            }
        //            let imageUrl = value.profileImageUrl
        //            print("image url is \(String(describing: imageUrl.absoluteString))")
        //        })
        //
        //    }
        
        
    }
}
