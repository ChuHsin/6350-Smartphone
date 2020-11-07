//
//  ViewController.swift
//  SegueExample
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


    @IBAction func gotoNextScreen(_ sender: Any) {
        performSegue(withIdentifier: "SegueNextScreen", sender: self)
    }
}

