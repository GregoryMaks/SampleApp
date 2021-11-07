//
//  PositionModel.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import Foundation

struct PositionModel: Codable {

    let MarkeDescription: String
    let Net: Int
    let PL: Int
    let Buy: Int
    let Sell: Int
    let WorkingBuy: Int
    let WorkingSell: Int
}
