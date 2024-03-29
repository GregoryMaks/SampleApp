//
//  PositionsListViewModel.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import Foundation

class PositionsListViewModel {

    let positions: [Position]

    private var positionModels: [PositionModel] = []
    private let positionsService: PositionsServiceProtocol

    init(positionsService: PositionsServiceProtocol) {
        self.positionsService = positionsService

        positionModels = positionsService.allPositions()
        positions = positionModels.map {
            .init($0)
        }
    }

    var headerViewModel: PositionsHeaderViewModel {
        let summaryProfitAndLoss = positionModels.reduce(0) { $0 + $1.PL }
        return PositionsHeaderViewModel(
            tradingSessionName: "demo0001",
            profitAndLoss: "\(summaryProfitAndLoss)",
            profitAndLossColorStyle: .init(for: summaryProfitAndLoss),
            cash: "-85,521",
            cashColorStyle: .negative
        )
    }
}

extension PositionsListViewModel {

    struct Position {
        let marketDescription: String
        let netPrice: String
        let netPriceColorStyle: ColorStyle
        let profitAndLoss: String
        let profitAndLossColorStyle: ColorStyle
        let buyAndSell: String
        let workingBuyAndSell: String
    }

    enum ColorStyle {
        case positive
        case neutral
        case negative
    }
}

extension PositionsListViewModel.Position {

    init(_ model: PositionModel) {
        marketDescription = model.MarkeDescription
        netPrice = "\(model.Net)"
        netPriceColorStyle = .init(for: model.Net)
        profitAndLoss = "\(model.PL)"
        profitAndLossColorStyle = .init(for: model.PL)
        buyAndSell = "\(model.Buy)-\(model.Sell)"
        workingBuyAndSell = "\(model.WorkingBuy)-\(model.WorkingSell)"
    }
}

extension PositionsListViewModel.ColorStyle {

    init(for number: Int) {
        if number < 0 {
            self = .negative
        } else if number > 0 {
            self = .positive
        } else {
            self = .neutral
        }
    }
}

extension PositionsTableViewCellViewModel {

    init(_ positionModel: PositionsListViewModel.Position) {
        marketDescription = positionModel.marketDescription
        netPrice = positionModel.netPrice
        netPriceColorStyle = positionModel.netPriceColorStyle
        profitAndLoss = positionModel.profitAndLoss
        profitAndLossColorStyle = positionModel.profitAndLossColorStyle
        buyAndSell = positionModel.buyAndSell
        workingBuyAndSell = positionModel.workingBuyAndSell
    }
}
