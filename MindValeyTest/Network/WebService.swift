//
//  WebService.swift
//  mercafacilTest
//
//  Created by Lazaro Neto on 02/10/2018.
//  Copyright © 2018 Lazaro Neto. All rights reserved.
//

import UIKit

typealias ResultResponse<T> = (_ success: Bool, _ value: T?, _ error: Error?)-> Void

let sharedWebService = WebService()

class WebService: NSObject {
    
    fileprivate override init(){}
    
    enum Path {
        
        case posts
        
        var path: String {
            
            switch self {
            case .posts:
                return "http://pastebin.com/raw/wgkJgazE"
            }
        }
        
        private func returnUrl(path: String) -> String {
            if let url = Bundle.main.object(forInfoDictionaryKey: "ServerURL") as? String {
                return url + path
            }
            return ""
        }
    }
    
    func createGeneriErrorForResponse() -> Error {
        let error = NSError(domain: "network", code: -1, userInfo: [NSLocalizedDescriptionKey: "Não foi possível completar operação, tente novamente mais tarde"])
        return error
    }
}
