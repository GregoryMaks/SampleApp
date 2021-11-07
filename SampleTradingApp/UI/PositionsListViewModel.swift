//
//  PositionsListViewModel.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import Foundation

class PositionsListViewModel {

    let session: Session
    let positions: [Position]

    private let positionsService: PositionsServiceProtocol

    init(positionsService: PositionsServiceProtocol) {
        self.positionsService = positionsService

        session = .sample
        positions = positionsService.allPositions().map {
            .init($0)
        }
    }
}

extension PositionsListViewModel {

    struct Session {
        let name: String
        let profitAndLoss: String
        let cash: String
    }

    struct Position {
        let marketDescription: String
        let netPrice: String
        let profitAndLoss: String
        let buyAndSell: String
        let workingBuyAndSell: String
    }
}

extension PositionsListViewModel.Session {

    static var sample: Self {
        .init(name: "demo0001", profitAndLoss: "24,413", cash: "-84,521")
    }
}

extension PositionsListViewModel.Position {

    init(_ model: PositionModel) {
        marketDescription = model.MarkeDescription
        netPrice = "\(model.Net)"
        profitAndLoss = "\(model.PL)"
        buyAndSell = "\(model.Buy)-\(model.Sell)"
        workingBuyAndSell = "\(model.WorkingBuy)-\(model.WorkingSell)"
    }
}

extension PositionsTableViewCellViewModel {

    init(_ positionModel: PositionsListViewModel.Position) {
        marketDescription = positionModel.marketDescription
        netPrice = positionModel.netPrice
        profitAndLoss = positionModel.profitAndLoss
        buyAndSell = positionModel.buyAndSell
        workingBuyAndSell = positionModel.workingBuyAndSell
    }
}
