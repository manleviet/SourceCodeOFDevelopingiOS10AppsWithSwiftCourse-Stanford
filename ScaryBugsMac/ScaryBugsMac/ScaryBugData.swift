//
//  ScaryBugData.swift
//  ScaryBugsMac
//
//  Created by Lê Viết Mẫn on 7/25/15.
//  Copyright (c) 2015 Lê Viết Mẫn. All rights reserved.
//

import Foundation

class ScaryBugData: NSObject {
    var title: String
    var rating: Double
    
    override init() {
        self.title = String()
        self.rating = 0.0
    }
    
    init(title: String, rating: Double) {
        self.title = title
        self.rating = rating
    }
}
