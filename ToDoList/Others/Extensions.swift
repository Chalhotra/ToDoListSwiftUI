//
//  Extensions.swift
//  ToDoList
//
//  Created by Soumil Malhotra on 14/07/24.
//

import Foundation


extension Encodable {
    func asDictionary() -> [String : AnyObject] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: AnyObject]
            return json ?? [:]
        } catch {
            return [:]
        }
    
        
    }
}
