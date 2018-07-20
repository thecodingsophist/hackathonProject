//
//  User.swift
//  hackathonProject
//
//  Created by Sarah Bloom on 7/17/18.
//

import Foundation
import FirebaseDatabase.FIRDatabase

class User{
    
    //MARK: - Properties
    
    let uid: String
    let username: String
    let address: UserAddress?
    //MARK: - Init
    
    init(uid: String, username: String){
        self.uid = uid
        self.username = username
        self.address = nil
    }
    
    init?(snapshot: DataSnapshot){
        guard let dict = snapshot.value as? [String : Any],
        let username = dict["username"] as? String
        else { return nil }
        self.address  = nil
        self.uid = snapshot.key
        self.username = username
    }
}

struct UserAddress {
    let street: String
    let city: String
    let state: String
    let zipCode: String
}
