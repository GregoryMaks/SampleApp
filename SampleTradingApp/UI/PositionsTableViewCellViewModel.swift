//
//  PositionsTableViewCellViewModel.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import Foundation

struct PositionsTableViewCellViewModel {

    let marketDescription: String
    let netPrice: String
    let netPriceColorStyle: PositionsListViewModel.ColorStyle
    let profitAndLoss: String
    let profitAndLossColorStyle: PositionsListViewModel.ColorStyle
    let buyAndSell: String
    let workingBuyAndSell: String
}
