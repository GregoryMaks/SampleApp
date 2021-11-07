//
//  PositionsHeaderView.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import UIKit

final class PositionsHeaderView: UIView {

    let viewModel: PositionsHeaderViewModel

    private var titleLabel: UILabel!

    private var contentStackView: UIStackView!
    private var profitAndLossLabel: UILabel!
    private var cashLabel: UILabel!

    init(viewModel: PositionsHeaderViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupContent()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PositionsHeaderView {

    func setupContent() {
        backgroundColor = .systemBackground

        titleLabel = UILabel()
        titleLabel.font = .preferredFont(forTextStyle: .footnote)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        profitAndLossLabel = UILabel()
        profitAndLossLabel.textAlignment = .center
        profitAndLossLabel.font = .preferredFont(forTextStyle: .footnote)
        profitAndLossLabel.translatesAutoresizingMaskIntoConstraints = false

        cashLabel = UILabel()
        cashLabel.textAlignment = .center
        cashLabel.font = .preferredFont(forTextStyle: .footnote)
        cashLabel.translatesAutoresizingMaskIntoConstraints = false

        contentStackView = UIStackView(arrangedSubviews: [titleLabel, profitAndLossLabel, cashLabel])
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.alignment = .center
        contentStackView.axis = .horizontal
        contentStackView.distribution = .equalSpacing
        addSubview(contentStackView)

        NSLayoutConstraint.activate([
            // H
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            // V
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
        ])

        updateContent()
    }

    private func updateContent() {
        titleLabel.text = viewModel.tradingSessionName
        profitAndLossLabel.text = "\("positionsHeader.profitAndLossLabel".localized) \(viewModel.profitAndLoss)"
        profitAndLossLabel.textColor = .color(for: viewModel.profitAndLossColorStyle)
        cashLabel.text = "\("positionsHeader.cashLabel".localized) \(viewModel.cash)"
        cashLabel.textColor = .color(for: viewModel.cashColorStyle)
    }
}

private extension UIColor {

    static func color(for colorStyle: PositionsHeaderViewModel.ColorStyle) -> UIColor {
        switch colorStyle {
        case .positive:
            return .systemBlue
        case .neutral:
            return .label
        case .negative:
            return .systemRed
        }
    }
}
