//
//  PositionsListSectionHeaderView.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import UIKit

final class PositionsListSectionHeaderView: UIView {

    private var contentStackView: UIStackView!
    private var headerLabels = [UILabel]()

    init() {
        super.init(frame: .zero)
        setupContent()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PositionsListSectionHeaderView {

    func setupContent() {
        let titles = [
            "positionsSectionHeader.netPriceLabel".localized,
            "positionsSectionHeader.profitAndLossLabel".localized,
            "positionsSectionHeader.buyAndSellLabel".localized,
            "positionsSectionHeader.workingBuyAndSellLabel".localized
        ]

        headerLabels = titles.map {
            let label = UILabel.makeHeaderLabel()
            label.text = $0
            return label
        }

        contentStackView = UIStackView(arrangedSubviews: headerLabels)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.alignment = .center
        contentStackView.axis = .horizontal
        contentStackView.distribution = .fillEqually
        contentStackView.backgroundColor = .gray
        addSubview(contentStackView)

        NSLayoutConstraint.activate([
            // H
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            // V
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

private extension UILabel {

    static func makeHeaderLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }
}

#if DEBUG
import SwiftUI

struct PositionsListSectionHeaderViewWrapper: UIViewRepresentable {

    func makeUIView(context: Context) -> some UIView {
        PositionsListSectionHeaderView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct PositionsListSectionHeaderView_Previews: PreviewProvider {

    static var previews: some View {
        PositionsListSectionHeaderViewWrapper()
            .previewInterfaceOrientation(.portrait)
    }
}

#endif // DEBUG
