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
        
        // Handle Keyboard Dismissal
        let outsideTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(outsideTap)
        
        // UISetup
        setupTextFields()
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    // MARK: - UISetup
    func setupTextFields() {
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.layer.cornerRadius = 6.0
        usernameTextField.layer.borderColor = UIColor .lightGrayColor().CGColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 6.0
        passwordTextField.layer.borderColor = UIColor .lightGrayColor().CGColor
        addCityTextField.layer.borderWidth = 1.0
        addCityTextField.layer.cornerRadius = 6.0
        addCityTextField.layer.borderColor = UIColor .lightGrayColor().CGColor
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
        if let nextResponder=textField.superview?.viewWithTag(nextTag) as UIResponder! {
            nextResponder.becomeFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
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
