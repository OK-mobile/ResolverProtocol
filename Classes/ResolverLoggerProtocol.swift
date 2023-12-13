//
//  ResolverLoggerProtocol.swift
//  ResolverProtocol
//
//  Created by dmitry.rybochkin on 02.12.2020.
//  Copyright © 2020 OK.RU. All rights reserved.
//

import Foundation

@objc
public protocol ResolverLoggerProtocol {

    // MARK: - Functions

    func write(message: String)
}
