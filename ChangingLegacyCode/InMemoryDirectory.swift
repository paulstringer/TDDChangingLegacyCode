//
//  InMemoryDirectory.swift
//  ChangingLegacyCode
//
//  Created by Paul Stringer on 19/05/2016.
//  Copyright © 2016 stringerstheory. All rights reserved.
//

import Foundation

class InMemoryDirectory {
  
    fileprivate var elements = [Element]()
    
    //TODO: Modify to allow people to add elements at any time. The Index should be maintained auto-magically
    
    func addElement(_ element: Element) {
        
        elements.append(element)
        
    }
    
    var elementCount: Int {
        get {
            return elements.count
        }
    }
    
    func element(_ name: String) -> Element? {
        
        guard let index = ( elements.index { (element) -> Bool in
            
            return element.name == name
            
        } ) else {
            
            return nil
            
        }
        
        
        return elements[index]
        
    }
    
    //TODO: Write a test for the defect where GenerateIndex duplicates indexes
    
    func generateIndex() {
        
        var index = Element(name: "Index")
        
        for element in elements {
            index.addText(element.name + "\n")
        }
        
        addElement(index)
        
    }
    
}
