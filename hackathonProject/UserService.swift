//
//  UserService.swift
//  hackathonProject
//
//  Created by Sarah Bloom on 7/18/18.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct UserService{
    typealias FIRUser = FirebaseAuth.User
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["username": username]
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
}
