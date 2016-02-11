//
//  LoginViewController.swift
//  WordsAndWeather
//
//  Created by Franks, Kent on 11/5/15.
//  Copyright © 2015 Franks, Kent. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var addCityTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    // MARK: - Actions
    @IBAction func loginAction(sender: AnyObject) {
        
    }
    
    @IBAction func addCityAction(sender: AnyObject) {

    }
    
    
    
    
    // MARK: - TextField Delegate 
    // added for convenience don't worry about doing anything here
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let nextTag=textField.tag+1;
        let nextResponder=textField.superview?.viewWithTag(nextTag) as UIResponder!
        if (nextResponder != nil){
            nextResponder?.becomeFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
            loginAction(loginButton)
        }
        return false
    }
    
    func textFieldHasChanged() {

    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    // MARK: - Navigation 
    //stubs to be used later
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        return true
    }
    
}
