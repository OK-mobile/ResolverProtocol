//
//  ResolverScopeProtocol.swift
//  OKServiceInterfaces
//
//  Created by dmitry.rybochkin on 13.05.2020.
//  Copyright © 2020 OK.RU. All rights reserved.
//

import Foundation

@objc
public protocol ResolverScopeProtocol {

    // MARK: - Properties

    var referenceType: ResolverReferenceType { get }
    var namespace: String { get }
}
