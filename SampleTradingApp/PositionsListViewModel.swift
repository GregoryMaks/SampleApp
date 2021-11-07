//
//  PositionsListViewModel.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import Foundation

struct PositionsListViewModel {

    let session: Session
    let positions: [Position]
}

extension PositionsListViewModel {

    struct Session {
        let name: String
        let profitAndLoss: String
        let cash: String
    }

    struct Position {
        let marketDescription: String
        let netWorth: String
        let profitAndLoss: String
        let buyAndSell: String
        let workingBuyAndSell: String
    }
}

extension PositionsTableViewCellViewModel {

    init(_ positionModel: PositionsListViewModel.Position) {
        marketDescription = positionModel.marketDescription
        netWorth = positionModel.netWorth
        profitAndLoss = positionModel.profitAndLoss
        buyAndSell = positionModel.buyAndSell
        workingBuyAndSell = positionModel.workingBuyAndSell
    }
}
