//
//  ViewController.swift
//  AlartControllerExample
//
//  Created by Enoch Qu　 on 11/6/20.
//  Copyright © 2020 Xin Enoch Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    } 

    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "This is Title", message: "This is a Message", preferredStyle: .alert)
        
        let OK =    UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK pressed")
        }
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel) { (action) in
            print("Cancel Pressed")
        }
        
        alert.addAction(cancel)
        alert.addAction(OK)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

