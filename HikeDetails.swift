//
//  HikeDetails.swift
//  AddAHike
//
//  Created by Nagesh, Vidya Sindhu on 4/4/15.
//  Copyright (c) 2015 Nagesh, Vidya Sindhu. All rights reserved.
//

import UIKit

class HikeDetails {
    var name: String
    var url: String
    var roundTripLength: Double
    
    init (name: String, url: String, roundTripLength: Double) {
        self.name = name
        self.url = url
        self.roundTripLength = roundTripLength
    }
}