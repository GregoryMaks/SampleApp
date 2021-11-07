//
//  PositionsTableViewCellViewModel.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import Foundation

protocol PositionsTableViewCellViewModelProtocol {

    var marketDescription: String { get }
    var netWorth: String { get }
    var profitAndLoss: String { get }
    var buyAndSell: String { get }
    var workingBuyAndSell: String { get }
}

struct PositionsTableViewCellViewModel: PositionsTableViewCellViewModelProtocol {

    let marketDescription: String
    let netWorth: String
    let profitAndLoss: String
    let buyAndSell: String
    let workingBuyAndSell: String
}
