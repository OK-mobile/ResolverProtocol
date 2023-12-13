//
//  ResolverProtocol.swift
//  OKServiceInterfaces
//
//  Created by dmitry.rybochkin on 19.02.2020.
//  Copyright © 2020 OK.RU. All rights reserved.
//

import Foundation

@objc
public protocol ResolverProtocol: ObjcRegisterProtocol {

    // MARK: - Types

    typealias ObjcFactory = (ResolverProtocol) -> Any?
    typealias ObjcCompletion = (Any?) -> Void
    typealias ObjcSubscribeEvent = (Any?) -> Void

    // MARK: - Functions

    func register(closure: @escaping (ResolverProtocol) -> Void)
    /**
     resolve приоритетно возвращает уже созданный и сохраненый instance
     ссылка на вновь созданный instance будет сохранена в
     зависимости от ResolverReferenceType в ResolverScopeProtocol
     */
    func resolve(protocol: Protocol) -> Any?
    func resolve(class: AnyClass) -> Any?
    /**
     resolveNew всегда возвращает новый instance
     resolveNew ссылка не будет сохранена аналогчно scope = ResolverReferenceType.none
     */
    func resolveNew(protocol: Protocol) -> Any?
    func resolveNew(class classType: AnyClass) -> Any?
    /**
     find  возвращает уже созданный и сохраненый instance
     */
    func find(protocol: Protocol) -> Any?
    func find(class classType: AnyClass) -> Any?

    func unregister(class: AnyClass)
    func unregister(protocol: Protocol)
    func unregister(namespace: String)

    func releaseInstance(class: AnyClass)
    func releaseInstance(class: AnyClass, before completion: @escaping ObjcCompletion)
    func releaseInstance(protocol: Protocol)
    func releaseInstance(protocol: Protocol, before completion: @escaping ObjcCompletion)
    func releaseInstances(globalScope: ResolverGlobalScope)
    func releaseInstances(namespace: String)
    func releaseInstances()

    func subscribe(_ subscriber: AnyObject, protocol protocolType: Protocol, event: @escaping ObjcSubscribeEvent)
    func subscribe(_ subscriber: AnyObject, class classType: AnyClass, event: @escaping ObjcSubscribeEvent)
    func unsubscribe(_ subscriber: AnyObject, protocol protocolType: Protocol)
    func unsubscribe(_ subscriber: AnyObject, class classType: AnyClass)
    func unsubscribeAll(_ subscriber: AnyObject)
}
