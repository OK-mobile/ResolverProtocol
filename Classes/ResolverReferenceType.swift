//
//  ResolverReferenceType.swift
//  OKServiceInterfaces
//
//  Created by dmitry.rybochkin on 13.05.2020.
//  Copyright © 2020 OK.RU. All rights reserved.
//

import Foundation

@objc
public enum ResolverReferenceType: Int {

    // MARK: - Cases

    case weak
    case strong
    case none
}
