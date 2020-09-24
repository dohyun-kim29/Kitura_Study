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
    
    let url = URL(string: "http://localhost:8080")!

    
    @IBOutlet weak var txtResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func request(_ sender: Any) {
        request()
    }
   
    

    
    func request() {

        var request = URLRequest(url: url)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request){
            [weak self] data, res, err in
            guard self != nil else { return }
            if let err = err { print(err.localizedDescription); return }
            print((res as! HTTPURLResponse).statusCode)
            switch (res as! HTTPURLResponse).statusCode{
            case 200:
                
                var result :Any
                
                let jsonSerialization = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                print(jsonSerialization)
                
                result = jsonSerialization["hello"]!
                
                
                print(result)
                
                
                
                DispatchQueue.main.async {
                    self?.txtResult.text! = result as! String
                }
                
                

               


            default:
                print(err?.localizedDescription as Any)
            }
            
            
            
        }.resume()
    }
}


