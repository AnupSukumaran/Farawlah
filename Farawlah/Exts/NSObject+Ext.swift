//
//  NSObject+Ext.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import UIKit

enum Results<T> {
    case success(T)
    case failure(errorStr: String)
}

extension NSObject {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                return jsonData
            }
        } catch {
            print("JSONErro = \(error.localizedDescription)")
        }
        
        return nil
    }

    
    func parse(jsonData: Data, handler: (Results<ModelResponse>) -> ()) {
          
           do {
               let modelResponse = try ModelResponse(data: jsonData)
               handler(.success(modelResponse))
              
           } catch {
               handler(.failure(errorStr: error.localizedDescription))
           }
           
           
       }

    
}
