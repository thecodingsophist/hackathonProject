//
//  LoginViewController.swift
//  hackathonProject
//
//  Created by Sarah Bloom on 7/16/18.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

class LoginViewController: UIViewController {
 
    typealias FIRUSER = FirebaseAuth.User
    
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let authUI = FUIAuth.defaultAuthUI()
            else{return}
        
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    
}

extension LoginViewController: FUIAuthDelegate{
    func authUI( _ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?){
        if let error = error{
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
       guard let user = authDataResult?.user
        else { return }
        
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        userRef.observeSingleEvent(of: .value, with: {(snapshot) in
            if let user = User(snapshot: snapshot) {
                print("welcome back, \(user.username)")
            } else {
                print ("New user!")
            }
        })
    }
}
