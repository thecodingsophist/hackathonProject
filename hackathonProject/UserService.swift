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
    static func create(_ firUser: FIRUser, firstName: String, lastName: String, street: String, city: String, state: String, zipcode: Int, completion: @escaping (User?) -> Void) {
        let userAttrs = ["firstName": firstName, "lastName" : lastName, "street" : street, "city" : city, "state" : state, "zipcode" : zipcode] as [String : Any]
        
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
