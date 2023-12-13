//
//  SwiftResolverProtocol.swift
//  OKServiceInterfaces
//
//  Created by dmitry.rybochkin on 19.02.2020.
//  Copyright © 2020 OK.RU. All rights reserved.
//

import Foundation

public typealias ResolverType = ResolverProtocol & SwiftResolverProtocol

public protocol SwiftResolverProtocol: AnyObject {

    // MARK: - Types

    typealias SwiftFactory<T> = (ResolverType) -> T?
    typealias SwiftCompletion<T> = (ResolverType, T?) -> Void
    typealias Completion<T> = (T?) -> Void
    typealias SwiftSubscribeEvent<T> = (T?) -> Void

    // MARK: - Functions

    func register<T>(_ protocolType: T.Type, factory: @escaping SwiftFactory<T>)
    func register<T>(_ protocolType: T.Type, globalScope: ResolverGlobalScope, factory: @escaping SwiftFactory<T>)
    func register<T>(_ protocolType: T.Type, scope: ResolverScopeProtocol, factory: @escaping SwiftFactory<T>)
    func register<T>(_ protocolType: T.Type, factory: @escaping SwiftFactory<T>, completion: @escaping SwiftCompletion<T>)
    func register<T>(_ protocolType: T.Type, globalScope: ResolverGlobalScope, factory: @escaping SwiftFactory<T>, completion: @escaping SwiftCompletion<T>)
    func register<T>(_ protocolType: T.Type, scope: ResolverScopeProtocol, factory: @escaping SwiftFactory<T>, completion: @escaping SwiftCompletion<T>)

    /*
        resolve приоритетно возвращает уже созданный и сохраненый instance
        ссылка на вновь созданный instance будет сохранена
        в зависимости от ResolverReferenceType в ResolverScopeProtocol
     */
    func resolve<T>(_ protocolType: T.Type) -> T?
    func resolve<T>() -> T?
    /*
        resolveNew всегда возвращает новый instance
        resolveNew ссылка не будет сохранена аналогчно scope = ResolverReferenceType.none
    */
    func resolveNew<T>(_ protocolType: T.Type) -> T?
    func resolveNew<T>() -> T?
    /*
        find возвращает уже созданный и сохраненый instance
     */
    func find<T>(_ protocolType: T.Type) -> T?
    func find<T>() -> T?

    func unregister<T>(_ protocolType: T.Type)
    func unregister(globalScope: ResolverGlobalScope)
    func unregister(scope: ResolverScopeProtocol)

    func releaseInstance<T>(_ protocolType: T.Type, before completion: @escaping Completion<T>)
    func releaseInstance<T>(_ protocolType: T.Type)
    func releaseInstances(scope: ResolverScopeProtocol)
    func releaseInstances()

    func subscribe<T>(_ subscriber: AnyObject, type protocolType: T.Type, event: @escaping SwiftSubscribeEvent<T>)
    func unsubscribe<T>(_ subscriber: AnyObject, type protocolType: T.Type)
}
