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
    
    // create a array to hold preferred cities for weather check
    var citiesArray = [String]()
    
    // create a Bool property named loginExists, this propert will be mutable
    var loginExists = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* -------------------------------------------------------------------------------------
        
            We are going to user the NSUserDefaults to store our username and password.
            You get access to the user defaults by calling NSUserDefaults.standardUserDefaults().
        
         ------------------------------------------------------------------------------------- */

        // Get the standard user defaults and assign them to a constant.
        let defaults = NSUserDefaults.standardUserDefaults()

        /* -------------------------------------------------------------------------------------

            The user defaults is a dictionary.
            You access items in the dictionary using someDictionary.objectForKey("theKey")
            You can set items in a dictionary using:
                defaults.setValue(value, forKey: "theKey")
                defaults.setBool(value, forKey: "theKey")

        ------------------------------------------------------------------------------------- */
        
        // Get the value of the key userIDExists and set it to a constant named userLoginExists
        let userLoginExists = defaults.objectForKey("userIDExists")
        
        // Use an if statement to determine if userLoginExists is nil or not
        if userLoginExists == nil {
            loginButton.setTitle("Create Login", forState: UIControlState.Normal)
        } else {
            loginButton.setTitle("Login", forState: UIControlState.Normal)
        }
        
        /* -------------------------------------------------------------------------------------
        
            We can set the title on a button using button.setTitle("yourTitle", , forState: UIControlState.Normal)
            We're going to be setting the title for the loginButton.
            If userLoginExists was nil we want to set the title for loginButton to "Create Login"
            If userLoginExists was not nil we want to set the title to "Login"
        
        ------------------------------------------------------------------------------------- */
        
        // Fill in the implementation of the if block above to set our button title
        
        /*
            print the cities saved to NSUserDefaults
        */
        if let _ = defaults.objectForKey("citiesArray") {
            citiesArray = defaults.objectForKey("citiesArray") as! [String]
            print("Printing all cities saved in user defaults")
            for city in citiesArray {
                print("saved city = \(city)")
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Actions
    @IBAction func loginAction(sender: AnyObject) {
        // Use an if statement to check the value of loginExists
        // If false set the values in the userDefaults with keys of appPassword and appUserID
        // If true compare the values in the textFields to the values stored in userdefaults and if those match login is successful and should be printed to console
        
        /* -------------------------------------------------------------------------------------
        
            You can print to the console using print("print this to console")
        
        ------------------------------------------------------------------------------------- */
        let defaults = NSUserDefaults.standardUserDefaults()
        if loginExists {
            // When getting value for a key in a dictionary you need to use as! String
            let userID = defaults.objectForKey("appUserID") as! String
            let password = defaults.objectForKey("appPassword") as! String
            if userID == usernameTextField.text && password == passwordTextField.text {
                print("Login Successful")
            }
        } else {
            defaults.setValue(usernameTextField.text, forKey: "appUserID")
            defaults.setValue(passwordTextField.text, forKey: "appPassword")
            defaults.setBool(true, forKey: "userIDExists")
            loginExists = true
            loginButton.setTitle("Login", forState: UIControlState.Normal)
            print("Login created")
        }
        
    }
    
    @IBAction func addCityAction(sender: AnyObject) {
        /*
            Add the city entered into the text field to the cities array. Then print all the cities in the array one by one.
        */
        citiesArray.append(addCityTextField.text!)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(citiesArray, forKey: "citiesArray")
        print("Printing all cities after add")
        for city in citiesArray {
            print(city)
        }
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
