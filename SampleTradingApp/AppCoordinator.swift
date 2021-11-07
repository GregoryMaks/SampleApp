//
//  AppCoordinator.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import UIKit

final class AppCoordinator {

    let window: UIWindow

    private var navigationController: UINavigationController!

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        guard let jsonPath = Bundle.main.path(forResource: "positions", ofType: "json") else {
            preconditionFailure("Unable to read positions.json")
        }
        let jsonUrl = URL(fileURLWithPath: jsonPath)
        let viewModel = PositionsListViewModel(positionsService: PositionsService(jsonPath: jsonUrl))
        let viewController = PositionsListViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
}
