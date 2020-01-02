//
//  CoordinatorProtocol.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import UIKit
protocol CoordinatorProtocol:AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator:CoordinatorProtocol?{ get set }
    func start()
    func start(coordinator: CoordinatorProtocol)
    func didFinish(coordinator: CoordinatorProtocol)
}
