//
//  PositionsService.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import Foundation

protocol PositionsServiceProtocol {

    func allPositions() -> [PositionModel]
}

final class PositionsService: PositionsServiceProtocol {

    private let jsonPath: URL

    init(jsonPath: URL) {
        self.jsonPath = jsonPath
    }

    func allPositions() -> [PositionModel] {
        do {
            let data = try Data(contentsOf: jsonPath)
            let positions = try JSONDecoder().decode([PositionModel].self, from: data)
            return positions
        } catch {
            preconditionFailure("failed to read JSON file")
        }
    }
}
