//
//  SliderMenuViewModel.swift
//  BhaktiSagar
//
//  Created by Jitendra Kumar Agarwal on 21/12/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation

class SliderMenuViewModel {
    
    private var arrItems     =   ["Home","Video","Live Program","Profile","Setting"]
 
    
    var numberOfRowInSection: Int {
        get {
            return arrItems.count
        }
    }
    var heightForRow : Int {
        get {
            return 60
        }
    }

}

