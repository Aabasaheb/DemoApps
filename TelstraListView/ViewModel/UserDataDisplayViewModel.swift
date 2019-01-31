//
//  UserDataDisplayViewModel.swift
//  TelstraListView
//
//  Created by Aabasaheb Deshpande on 1/31/19.
//  Copyright © 2019 wipro.com. All rights reserved.
//

import UIKit

class UserDataDisplayViewModel: NSObject, UserDataViewModel {

    var country: String
    var population: String
    var flagImage: String
    var rank: Int
    override init() {
        self.country = ""
        self.flagImage = ""
        self.population = ""
        self.rank = 0
    }
    
    init(user: [String:Any]) {
        self.country = (user["country"] as? String)!
        self.flagImage = (user["flag"] as? String)!
        self.population = (user["population"] as? String)!
        self.rank = (user["rank"] as? Int)!
    }
    
    func parseUserData(user : [String : Any]) -> [UserDataDisplayViewModel] {
        
        let worldpopulation = user["worldpopulation"] as! [[String:Any]]
        var userArray = [UserDataDisplayViewModel]()
        
        for userObj in worldpopulation {
            var userModelObject = UserDataDisplayViewModel(user: userObj)
            userArray.append(userModelObject)
        }
        return userArray
    }
}
