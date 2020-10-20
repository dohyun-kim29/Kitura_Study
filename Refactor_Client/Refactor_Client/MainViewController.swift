//
//  ViewController.swift
//  Refactor_Client
//
//  Created by DohyunKim on 2020/09/24.
//  Copyright © 2020 DohyunKim. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class ViewController: UIViewController {
    
    let url = URL(string: "http://localhost:8080/file/")!
    var result = ""
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnRequest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        btnRequest.rx.tap
            .map { _ in self.request()}
            .subscribe(onNext: { self.lblResult.text = self.result})
        .disposed(by: disposeBag)
    }
    
    
    func request() {
        
        Alamofire.request(url, method: .get, headers: ["Content-Type":"application/json"])
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                let jsonSerialization = try! JSONSerialization.jsonObject(with: response.data!, options: []) as! [String:Any]
                print(jsonSerialization)
                
                self.result = jsonSerialization["file"] as! String
                
        }
        
        
    }
}

