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

extension PositionsHeaderViewModel.ColorStyle {

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

