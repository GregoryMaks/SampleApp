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
        let viewModel = PositionsListViewModel(
            session: .init(name: "demo0001", profitAndLoss: "1000", cash: "2200"),
            positions: [
                .init(marketDescription: "ZC DEC21", netWorth: "6", profitAndLoss: "5436", buyAndSell: "6-0", workingBuyAndSell: "0-0"),
                .init(marketDescription: "10Y OCT21", netWorth: "0", profitAndLoss: "2131", buyAndSell: "0-0", workingBuyAndSell: "1-0"),
                .init(marketDescription: "2YY OCT21", netWorth: "0", profitAndLoss: "12", buyAndSell: "7-3", workingBuyAndSell: "0-2"),
                .init(marketDescription: "5YY OCT 21", netWorth: "0", profitAndLoss: "0", buyAndSell: "56-34", workingBuyAndSell: "3-3")
            ]
        )
        let viewController = PositionsViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
}
