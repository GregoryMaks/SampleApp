//
//  PositionsHeaderViewModel.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import Foundation

struct PositionsHeaderViewModel {

    let tradingSessionName: String
    let profitAndLoss: String
    let profitAndLossColorStyle: ColorStyle
    let cash: String
    let cashColorStyle: ColorStyle
}

extension PositionsHeaderViewModel {

    enum ColorStyle {
        case positive
        case neutral
        case negative
    }
}

extension PositionsHeaderViewModel {

    static var sample: Self {
        .init(
            tradingSessionName: "demo0001",
            profitAndLoss: "24,413",
            profitAndLossColorStyle: .positive,
            cash: "-85,521",
            cashColorStyle: .negative
        )
    }
}
