//
//  Element.swift
//  ChangingLegacyCode
//
//  Created by Paul Stringer on 19/05/2016.
//  Copyright © 2016 stringerstheory. All rights reserved.
//

import Foundation

struct Element {
    
    var name: String
    
    mutating func addText(_ text: String) {
        
        name = name + text
        
    }
}
