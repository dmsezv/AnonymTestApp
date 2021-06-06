//
//  ApplicationAssembly.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

class ApplicationAssembly {
    lazy var coreAssembly: CoreAssemblyProtocol = CoreAssembly()
    lazy var serviceAssembly: ServiceAssemblyProtocol = ServiceAssembly(coreAssembly: coreAssembly)
    lazy var presentationAssembly: PresentationAssemblyProtocol = PresentationAssembly(serviceAssembly: serviceAssembly)
}
