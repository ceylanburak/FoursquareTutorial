//
//  NetworkManager.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 24.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import Foundation
import FoursquareAPIClient
import PKHUD

class NetworkManager {
    typealias SuccessBlockCompletion<T> = (T?) -> Void
    typealias ErrorBlockCompletion = (FoursquareClientError) -> Void
    
    class func request<T: Codable>(with path: String! = "", parameters: [String: String]! = [:], responseType: T.Type = T.self, successCompletion: @escaping SuccessBlockCompletion<T>, errorCompletionBlock: ErrorBlockCompletion? = nil) {
        
        showProgress()
        
        SessionManager.shared.client.request(path: path, parameter: parameters) { (result) in
            
            hideProgress()
            
            switch result {
            case let .success(data):
//                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let decodedObject = try! JSONDecoder().decode(responseType.self, from: data)
                successCompletion(decodedObject)
                
                print("json = \(String(describing: data.prettyJSON))")
            case let .failure(error):

                switch error {
                case let .connectionError(connectionError):
                    print(connectionError)
                case let .responseParseError(responseParseError):
                    print(responseParseError)   // e.g. JSON text did not start with array or object and option to allow fragments not set.
                case let .apiError(apiError):
                    print(apiError.errorType)   // e.g. endpoint_error
                    print(apiError.errorDetail) // e.g. The requested path does not exist.
                }
                
                errorCompletionBlock?(error)

            }
        }
    }
    
    private class func showProgress() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    private class func hideProgress() {
        DispatchQueue.main.async {
            PKHUD.sharedHUD.hide(false)
        }
    }
}
