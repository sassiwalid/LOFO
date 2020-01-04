//
//  BaseCoordinator.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/2/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import UIKit
import Foundation
class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController = UINavigationController()
    func start() {
        fatalError("Start method must be implemented")
    }
    func start(coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
    }
}
