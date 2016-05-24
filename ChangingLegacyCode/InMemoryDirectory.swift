//
//  InMemoryDirectory.swift
//  ChangingLegacyCode
//
//  Created by Paul Stringer on 19/05/2016.
//  Copyright © 2016 stringerstheory. All rights reserved.
//

import Foundation

class InMemoryDirectory {
  
    private var indexOfIndexElement : Int?
    private var elements = [Element]()

    //TODO: Modify to allow people to add elements at any time. The Index should be maintained auto-magically
    
    func addElement(element: Element) {
        
        elements.append(element)
        
        if indexExists {
            generateIndex()
        }
        
    }
    
    private var indexExists: Bool {
        get {
            return indexOfIndexElement != nil
        }
    }
    
    var elementCount: Int {
        get {
            return elements.count
        }
    }
    
    func element(name: String) -> Element? {
        
        guard let index = ( elements.indexOf { (element) -> Bool in
            
            return element.name == name
            
        } ) else {
            
            return nil
            
        }
        
        return elements[index]
        
    }
    
    func generateIndex(adding: Bool = false) {
        
        removeIndex()
        
        appendIndex()
    }
    
    func removeIndex() {
        
        if let indexToRemove = indexOfIndexElement  {
            
            elements.removeAtIndex(indexToRemove)
            
            indexOfIndexElement = nil
            
        }
        
    }
    
    func appendIndex() {
        
        elements.append(index())
        
        indexOfIndexElement = elementCount - 1
        
    }

    func index() -> Element {
        
        var index = Element(name: "Index")
        
        for element in elements {
            index.addText(element.name + "\n")
        }
        
        return index
        
    }
    
}