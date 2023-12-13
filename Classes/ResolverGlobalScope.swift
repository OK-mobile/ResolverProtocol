//
//  ResolverGlobalScope.swift
//  Pods
//
//  Created by Sergey Rakov on 05.08.2020.
//  Copyright © 2020 OK.RU. All rights reserved.
//

import Foundation

/**
 Базовый набор скоупов, доступных по всему приложению.
 */
@objc
public enum ResolverGlobalScope: Int {

    /**
     Вечные сервисы, создаются на старте приложения
     Инстанс хранится в резолвере
     */
    case `default`

    /**
     Сессионные сервисы, действующие только при залогиненном пользователе
     Инстанс хранится в резолвере и чистится при разлогине
     */
    case session

    /**
     Скоуп, используемый для фабрики инстансов
     Инстансы не хранятся в резолвере, каждый раз создаётся новый
     */
    case transient
}
