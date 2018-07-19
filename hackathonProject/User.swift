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
    let firstName: String
    let lastName: String
    let street: String
    let city: String
    let state: String
    let zipcode: Int
    
    
    
    //MARK: - Init
    
    init(uid: String, firstName: String, lastName: String, street: String, city: String, state: String, zipcode: Int){
        self.uid = uid
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.city = city
        self.state = state
        self.zipcode = zipcode
    }
    
    init?(snapshot: DataSnapshot){
        guard let dict = snapshot.value as? [String : Any],
        let firstName = dict["firstName"] as? String,
        let lastName = dict["lastName"] as? String,
        let street = dict["street"] as? String,
        let city = dict["city"] as? String,
        let state = dict["state"] as? String,
        let zipcode = dict["zipcode"] as? Int
        
        else { return nil }
        
        self.uid = snapshot.key
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.city = city
        self.state = state
        self.zipcode = zipcode
        
    }
}
