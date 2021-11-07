//
//  Localization.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import Foundation

extension String {

    public var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
