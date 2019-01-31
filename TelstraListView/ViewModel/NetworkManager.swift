//
//  NetworkManager.swift
//  TelstraListView
//
//  Created by Aabasaheb Deshpande on 1/30/19.
//  Copyright © 2019 wipro.com. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    
    var userDataModel = UserDataDisplayViewModel()
    
    func getDataFromJson(completion :@escaping ([UserDataDisplayViewModel])  -> ()) {
        
        //let urlString = URL(string: "https://images.ctfassets.net/")
        let urlString = "https://www.androidbegin.com/tutorial/jsonparsetutorial.txt"
        
        
        let request = URLRequest(url: URL(string: urlString)!)
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        config.connectionProxyDictionary = [AnyHashable: Any]()
        config.connectionProxyDictionary?[kCFNetworkProxiesHTTPEnable as String] = 1
        config.connectionProxyDictionary?[kCFNetworkProxiesHTTPProxy as String] = "142.54.173.19"
        config.connectionProxyDictionary?[kCFNetworkProxiesHTTPPort as String] = 8888
        config.connectionProxyDictionary?[kCFStreamPropertyHTTPSProxyHost as String] = "142.54.173.19"
        config.connectionProxyDictionary?[kCFStreamPropertyHTTPSProxyPort as String] = 8888
        
        let session = URLSession.init(configuration: config, delegate: nil, delegateQueue: OperationQueue.current)
        

        
        
        
        
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                let userDataArray : [UserDataDisplayViewModel] = (self.userDataModel.parseUserData(user: jsonResponse as! [String : Any]))
                
                DispatchQueue.main.async {
                    completion(userDataArray)
                }
                
                //print(userDataArray) //Response result
                //UserDataDisplayViewModel.parseUserData(UserData)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
}
    
}
