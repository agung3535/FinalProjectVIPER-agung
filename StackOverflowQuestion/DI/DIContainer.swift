//
//  DIContainer.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 19/11/23.
//

import Foundation

protocol DIContainerProtocol {
    
    func register<Component>(type: Component.Type, component: Any)
    func resolver<Component>(type: Component.Type) -> Component?
    
}

final class DIContainer: DIContainerProtocol {
    
    static let shared = DIContainer()
    
    private init() {}
    
    var components: [String: Any] = [:]
    
    func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }
    
    func resolver<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }
    
    
    
    
    
}
