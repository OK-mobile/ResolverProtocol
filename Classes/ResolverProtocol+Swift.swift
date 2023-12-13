//
//  ResolverProtocol+Swift.swift
//  OKServiceInterfaces
//
//  Created by dmitry.rybochkin on 12.05.2020.
//  Copyright © 2020 OK.RU. All rights reserved.
//

public extension ResolverProtocol {

    // MARK: - Types

    typealias SwiftFactory<T> = (ResolverType) -> T?
    typealias SwiftCompletion<T> = (ResolverType, T?) -> Void
    typealias Completion<T> = (T?) -> Void
    typealias SwiftSubscribeEvent<T> = (T?) -> Void

    // MARK: - Functions

    func resolve<T>(_ protocolType: T.Type) -> T? {
        swiftResolver?.resolve()
    }

    func resolve<T>() -> T? {
        swiftResolver?.resolve()
    }

    func resolveNew<T>(_ protocolType: T.Type) -> T? {
        swiftResolver?.resolveNew()
    }

    func resolveNew<T>() -> T? {
        swiftResolver?.resolveNew()
    }

    func find<T>(_ protocolType: T.Type) -> T? {
        swiftResolver?.find()
    }

    func find<T>() -> T? {
        swiftResolver?.find()
    }

    func register<T>(_ protocolType: T.Type, factory: @escaping SwiftFactory<T>) {
        swiftResolver?.register(protocolType, factory: factory)
    }

    func register<T>(_ protocolType: T.Type, globalScope: ResolverGlobalScope, factory: @escaping SwiftFactory<T>) {
        swiftResolver?.register(protocolType, globalScope: globalScope, factory: factory)
    }

    func unregister<T>(_ protocolType: T.Type) {
        swiftResolver?.unregister(protocolType)
    }

    func unregister(globalScope: ResolverGlobalScope) {
        swiftResolver?.unregister(globalScope: globalScope)
    }

    func releaseInstance<T>(_ protocolType: T.Type) {
        swiftResolver?.releaseInstance(protocolType)
    }

    func releaseInstance<T>(_ protocolType: T.Type, before completion: @escaping Completion<T>) {
        swiftResolver?.releaseInstance(protocolType, before: completion)
    }

    func register<T>(_ protocolType: T.Type, factory: @escaping SwiftFactory<T>, completion: @escaping SwiftCompletion<T>) {
        swiftResolver?.register(protocolType, factory: factory, completion: completion)
    }

    func register<T>(_ protocolType: T.Type, globalScope: ResolverGlobalScope, factory: @escaping SwiftFactory<T>, completion: @escaping SwiftCompletion<T>) {
        swiftResolver?.register(protocolType, globalScope: globalScope, factory: factory, completion: completion)
    }

    func register<T>(_ protocolType: T.Type, scope: ResolverScopeProtocol, factory: @escaping SwiftFactory<T>, completion: @escaping SwiftCompletion<T>) {
        swiftResolver?.register(protocolType, scope: scope, factory: factory, completion: completion)
    }

    func subscribe<T>(_ subscriber: AnyObject, type protocolType: T.Type, event: @escaping SwiftSubscribeEvent<T>) {
        swiftResolver?.subscribe(subscriber, type: protocolType, event: event)
    }

    func unsubscribe<T>(_ subscriber: AnyObject, type protocolType: T.Type) {
        swiftResolver?.unsubscribe(subscriber, type: protocolType)
    }
}

private extension ResolverProtocol {

    // MARK: - Private properties

    @nonobjc
    var swiftResolver: SwiftResolverProtocol? {
        if let resolver = self as? ResolverType {
            return resolver
        }
        if let resolver = self as? SwiftResolverProtocol {
            return resolver
        }
        return nil
    }
}
