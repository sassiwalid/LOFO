//
//  BaseCoordinator.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/2/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import UIKit
import Foundation
class BaseCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var parentCoordinator: CoordinatorProtocol?
    var navigationController = UINavigationController()
    func start() {
        fatalError("Start method must be implemented")
    }
    func start(coordinator: CoordinatorProtocol) {
        self.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    func didFinish(coordinator: CoordinatorProtocol) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
    }
}
