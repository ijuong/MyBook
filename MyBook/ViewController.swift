//
//  ViewController.swift
//  MyBook
//
//  Created by ktds 02 on 2017. 8. 17..
//  Copyright © 2017년 cj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginViewControllerProtocol {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let idStr = UserDefaults.standard.object(forKey: "userId") as? String
        let pwStr = UserDefaults.standard.object(forKey: "userPassword") as? String
        
        if let id = idStr {
            let welcomAlert = UIAlertController(title: "My book", message: "\(id)님 환영합니다", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
            welcomAlert.addAction(closeAction)
            self.present(welcomAlert, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "loginvc", sender: self)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LoginViewController {
            vc.delegate = self
        }
    }

    func send(withId:String, password:String){
        self.idLabel.text = withId
        self.pwLabel.text = password
        
        UserDefaults.standard.set(withId, forKey: "userId")
        UserDefaults.standard.set(password, forKey: "userPassword")
    }
}

