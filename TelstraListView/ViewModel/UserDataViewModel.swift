//
//  UserDataViewModel.swift
//  TelstraListView
//
//  Created by Aabasaheb Deshpande on 1/31/19.
//  Copyright © 2019 wipro.com. All rights reserved.
//

import Foundation

protocol UserDataViewModel {
    var country: String { get }
    var population: String { get }
    var flagImage: String { get }
    var rank: Int { get }
    
}
