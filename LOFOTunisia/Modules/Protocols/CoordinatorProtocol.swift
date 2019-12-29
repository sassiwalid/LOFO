//
//  CoordinatorProtocol.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import Foundation
import UIKit
protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    func start()
}
