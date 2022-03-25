//
//  LoginVC.swift
//  UnitOne Task
//
//  Created by Yasser Al-ShaFei on 24/03/2022.
//

import UIKit


class PhoneVC: UIViewController {

    @IBOutlet weak var perfixPhoneTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func logIn_SendSmsCode(_ sender: Any){
        var phone = phoneTF.text!
        var perfixPhone = perfixPhoneTF.text!
        
        if phone != "" || phone.hasPrefix("059") || phone.count == 10 || !perfixPhone.isEmpty || perfixPhone.hasPrefix("972") || perfixPhone.hasPrefix("970")
        {
            textFieldShouldReturn(perfixNumber: perfixPhone, numberPhone: phone)
        }
    }
    
    func textFieldShouldReturn(perfixNumber: String ,numberPhone: String) -> Bool {
        //txt.resignFirstResponder()
        
        if !perfixNumber.isEmpty || !numberPhone.isEmpty {
            let number = "+\(perfixNumber)\(numberPhone)"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let vc = SMSCodeVC()
                    vc.title = "Enter Code"
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        
        return true
    }
}
