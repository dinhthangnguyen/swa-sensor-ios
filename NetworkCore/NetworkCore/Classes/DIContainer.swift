//
//  DIContainer.swift
//  NetworkCore
//
//  Created by Thang Nguyen on 2/4/24.
//

import Swinject

public enum DIContainer {
    public static var shared = Container()
    public static func resolve<Service>(_ serviceType: Service.Type) -> Service {
        // swiftlint:disable:next force_unwrapping
        shared.resolve(serviceType)!
    }
}
