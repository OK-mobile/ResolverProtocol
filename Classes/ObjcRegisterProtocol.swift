//
//  ObjcRegisterProtocol.swift
//  ResolverProtocol
//
//  Created by dmitry.rybochkin on 01.02.2021.
//  Copyright © 2020 OK.RU. All rights reserved.
//

import Foundation

@objc
public protocol ObjcRegisterProtocol: AnyObject {

    // MARK: - Functions

    func register(protocol protocolType: Protocol, factory: @escaping (ResolverProtocol) -> Any?)
    func register(protocol protocolType: Protocol, globalScope: ResolverGlobalScope, factory: @escaping (ResolverProtocol) -> Any?)
    func register(protocol protocolType: Protocol, scope: ResolverScopeProtocol, factory: @escaping (ResolverProtocol) -> Any?)
    func register(protocol protocolType: Protocol, factory: @escaping (ResolverProtocol) -> Any?, completion: @escaping (ResolverProtocol, Any?) -> Void)
    func register(protocol protocolType: Protocol,
                  globalScope: ResolverGlobalScope,
                  factory: @escaping (ResolverProtocol) -> Any?,
                  completion: @escaping (ResolverProtocol, Any?) -> Void)
    func register(protocol protocolType: Protocol,
                  scope: ResolverScopeProtocol,
                  factory: @escaping (ResolverProtocol) -> Any?,
                  completion: @escaping (ResolverProtocol, Any?) -> Void)

    func register(class classType: AnyClass, factory: @escaping (ResolverProtocol) -> Any?)
    func register(class classType: AnyClass, globalScope: ResolverGlobalScope, factory: @escaping (ResolverProtocol) -> Any?)
    func register(class classType: AnyClass, scope: ResolverScopeProtocol, factory: @escaping (ResolverProtocol) -> Any?)
    func register(class classType: AnyClass, factory: @escaping (ResolverProtocol) -> Any?, completion: @escaping (ResolverProtocol, Any?) -> Void)
    func register(class classType: AnyClass,
                  globalScope: ResolverGlobalScope,
                  factory: @escaping (ResolverProtocol) -> Any?,
                  completion: @escaping (ResolverProtocol, Any?) -> Void)
    func register(class classType: AnyClass,
                  scope: ResolverScopeProtocol,
                  factory: @escaping (ResolverProtocol) -> Any?,
                  completion: @escaping (ResolverProtocol, Any?) -> Void)
}
