//
//  MainViewModel.swift
//  Refactored_Client
//
//  Created by DohyunKim on 2020/09/24.
//  Copyright © 2020 DohyunKim. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Alamofire



class MainViewModel {
    
    let model = Model()
    let view = MainViewController()
    
    func request() -> String {
        
        let url = model.url
        
        Alamofire.request(url, method: .get, headers: ["Content-Type":"application/json"])
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                if let JSON = response.result.value {
                    print(JSON)
                }
        }

            
        
        return "asd"
    }
    

    
    
}
