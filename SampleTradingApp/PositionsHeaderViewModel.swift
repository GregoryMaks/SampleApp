//
//  PositionsHeaderViewModel.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import Foundation

protocol PositionsHeaderViewModelProtocol {

    var tradingSessionName: String { get }
    var profitAndLoss: String { get }
    var cash: String { get }
}

struct PositionsHeaderViewModel: PositionsHeaderViewModelProtocol {

    let tradingSessionName: String
    let profitAndLoss: String
    let cash: String
}

extension PositionsHeaderViewModel {

    static var sample: Self {
        .init(tradingSessionName: "demo0001", profitAndLoss: "24,413", cash: "-85,521")
    }
}
