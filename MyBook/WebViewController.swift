//
//  WebViewController.swift
//  MyBook
//
//  Created by ktds 02 on 2017. 8. 17..
//  Copyright © 2017년 cj. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var shopURL:String?

    @IBOutlet weak var bookWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let bookURL = shopURL else {
            return
        }
        
        if let urlIns = URL(string: bookURL) {
            let urlRequest = URLRequest(url: urlIns)
            self.bookWebView.loadRequest(urlRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
