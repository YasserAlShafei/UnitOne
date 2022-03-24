//
//  LoginVC.swift
//  UnitOne Task
//
//  Created by Yasser Al-ShaFei on 24/03/2022.
//

import UIKit


class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    
    /*
    fileprivate func signIn(_ credential: PhoneAuthCredential) {
            self.showHUD()
            Auth.auth().signIn(with: credential){(authresult ,error) in
                if error != nil{
                    print("errorAli",error?.localizedDescription)
                    
                    self.showAlert(title: "خطأ", message: error?.localizedDescription, handler: { [weak self] _ in
                        guard let self = self else {return}
                        if (error?.localizedDescription ?? "").contains("The SMS code has expired"){
                            self.navigationController?.popViewController(animated: true)
                        }
                    })
                    
                    print("error")
                }else{
                    let vc =  TabBarVC.instantiate()
                    self.sceneDelegate.setRootVC(vc: vc)
        
                    
                }
            }
        }
    
    
    
    private func PhoneNumberVerifaction(){
              do{
                  let countryPhone = try countryPhoneTF.validatedText(validationType: .requiredField(field: "رقم الدولة مطلوب"))
                  let phone = try phoneNumberTF.validatedText(validationType: .requiredField(field: "رقم الهاتف مطلوب"))
                  let fullPhone = countryPhone + phone
                  print("fullPhone",fullPhone)
                  PhoneAuthProvider.provider().verifyPhoneNumber(fullPhone, uiDelegate: nil) { verifactionID, error in
                      self.hideHUD()
                      if error != nil{
                          print(error?.localizedDescription)
                      }else{
                          UserDefaults.standard.set(verifactionID, forKey: "authverifactionID")
                          let vc = SignInVC.instantiate()
                          self.sceneDelegate.setRootVC(vc: vc)
                      }
                  }
              }catch(let error){
                    self.showAlert(title:"خطأ", message:  (error as! ValidationError).message, handler: nil)
              }
        }
     */
}
