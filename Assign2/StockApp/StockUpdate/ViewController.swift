//
//  ViewController.swift
//  StockUpdate
//
//  Created by Enoch Qu　 on 11/6/20.
//  Copyright © 2020 Xin Enoch Qu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSpinner
import SwiftyJSON


class ViewController: UIViewController {

    let apiKey = "2eb755bb11a5e45879c82c2286291487"
    let apiURL = "https://financialmodelingprep.com/api/v3/profile/"
    
    @IBOutlet weak var txtStockName: UITextField!
    @IBOutlet weak var lblStockValue: UILabel!
    @IBOutlet weak var lblStockCEO: UILabel!
    
    @IBAction func getStockValue(_ sender: Any) {
        guard let stockName = txtStockName.text else { return}
        
        let url = "\(apiURL)\(stockName)?apikey=\(apiKey)"
        getStockValue(stockURL: url, stockName: stockName)

      
        
    }
    
    func getStockValue(stockURL : String!, stockName : String!) {
        SwiftSpinner.show("Getting Stock Value for \(String(describing: stockName))")
              Alamofire.request(stockURL).responseJSON{(response) in
                  
                      SwiftSpinner.hide()
                      if(response.result.isSuccess) {
                          guard let jsonString = response.result.value else { return }
                          
                          guard let stockJSON: [JSON] = JSON(jsonString).array else { return }
                          print(stockJSON)
                          if stockJSON.count < 1 { return }
                          guard let ceo = stockJSON[0]["ceo"].rawString() else { return }
                          guard let price = stockJSON[0]["price"].double else { return }
                        self.lblStockCEO.text = "\(ceo)"
                          self.lblStockValue.text = "$ \(price)"
                      }
              }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

