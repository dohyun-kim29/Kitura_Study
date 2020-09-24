//
//  ViewController.swift
//  ClientAPP
//
//  Created by DohyunKim on 2020/09/24.
//  Copyright © 2020 DohyunKim. All rights reserved.
//

import UIKit
import Alamofire
import RxCocoa
import RxSwift


class ViewController: UIViewController {
    
    let url = URL(string: "https://localhost:8080/")!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func request(_ sender: Any) {
        request()
    }
   
    
    func request() {
        Alamofire.request(url, method: .get, parameters: ["Content-Type":"application/json"])
        .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("ERROR \(String(describing:response.result.error))")
                    return
                }
        }
        
    }
}


