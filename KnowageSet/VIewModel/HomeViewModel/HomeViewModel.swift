//
//  HomeViewModel.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 28/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel {
    
    private let arrTagsItems: [String] = ["AutoLayout", "dynamically", "calculates", "the", "size", "and", "position",
                                           "of", "all", "the", "views", "in", "your", "view", "hierarchy", "based",
                                            "on", "constraints", "placed", "on", "those", "views"]
    private let headerTitle:[String] = ["","Live Programs","Bhakti Sagar Store", "Chalisa"]
 
    var numberOfSection: Int {
        get {
            return 4
        }
    }
    func heightForHeader(section:Int)->Int {
        switch section {
        case 0:
            return 0
        default:
            return 30
        }
    }

    func numberOfRowInSection(section:Int)->Int {
        switch section {
        case 0:
            return 1
        default:
            return 1
        }
        
    }
    func heightForRow(section:Int)->Int {
        switch section {
        case -1:
            return 130
           default:
            return 145
        }
    }
    
    var getAllTags: [String] {
        get {
            return self.arrTagsItems
        }
    }
    func sectionTitle(index:Int)-> String {
        return self.headerTitle[index]
        
    }
    
}
