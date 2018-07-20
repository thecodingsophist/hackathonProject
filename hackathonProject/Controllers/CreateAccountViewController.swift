//
//  CreateAccountViewController.swift
//  hackathonProject
//
//  Created by Sarah Bloom on 7/17/18.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var streetTextfield: UITextField!
    @IBOutlet weak var cityTextfield: UITextField!
    @IBOutlet weak var stateTextfield: UITextField!
    @IBOutlet weak var zipcodeTextfield: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser,
            let firstName = firstNameTextfield.text, !firstName.isEmpty,
            let lastName = lastNameTextfield.text, !lastName.isEmpty,
            let street = streetTextfield.text, !street.isEmpty,
            let city = cityTextfield.text, !city.isEmpty,
            let state = stateTextfield.text, !state.isEmpty,
            let zipcodeStr = zipcodeTextfield.text, !zipcodeStr.isEmpty,
            let zipcode = Int(zipcodeStr)
        else { return }
        
        UserService.create(firUser, firstName: firstName, lastName: lastName, street: street, city: city, state: state, zipcode: zipcode) { (user) in
            guard let user = user else { return }
            
            print("Created new user: \(user.firstName) \(user.lastName)")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    
    }
}
