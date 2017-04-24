//
//  LoginViewController.swift
//  FineartPixel
//
//  Created by Shilp_m on 4/22/17.
//  Copyright © 2017 DryRun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnLogin.layer.cornerRadius = 15
        btnFacebook.layer.cornerRadius = 15
        btnLogin.clipsToBounds = true
        btnFacebook.clipsToBounds = true
        
        txtEmail.delegate=self
        txtPassword.delegate=self
        txtPassword.setBottomBorder()
        txtEmail.setBottomBorder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onClickLogin(_ sender: Any) {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
        if isValidEmail(testStr: txtEmail.text!) != true {
           alert(message: "Invalid Email Id", title: "Email")
        }
        else if txtPassword.text == "" {
           alert(message: "Inavalid Password", title: "Password")
        } else {
          let defaults = UserDefaults.standard
          defaults.set(txtEmail.text, forKey: "savedString")
          if let myString = defaults.value(forKey: "savedString") as? String {
            let back = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.present(back, animated: true, completion: nil)
          }
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
//        if self.view.frame.origin.y == 0{
//           self.view.frame.origin.y -= 150
//        }
//    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
//        if self.view.frame.origin.y != 0{
//            self.view.frame.origin.y += 150
//        }
//        return true
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        textField.endEditing(true)
        imgLogo.isHidden = false
        lblLogin.isHidden = false
        
        return true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
           imgLogo.isHidden = true
           lblLogin.isHidden = true
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
    }

    
    
    @IBAction func onClickFacebookLogin(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
