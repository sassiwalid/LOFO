//
//  CoordinatorProtocol.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import UIKit
protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator:Coordinator? { get set }
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
}
