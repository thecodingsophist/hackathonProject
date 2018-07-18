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
 //   let firstName: String
 //   let lastName: String
    
    
    //MARK: - Init
    
    init(uid: String, username: String){
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot){
        guard let dict = snapshot.value as? [String : Any],
        let username = dict["username"] as? String
        else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
}
