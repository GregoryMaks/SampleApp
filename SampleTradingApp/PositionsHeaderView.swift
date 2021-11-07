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
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        profitAndLossLabel = UILabel()
        profitAndLossLabel.textAlignment = .center
        profitAndLossLabel.translatesAutoresizingMaskIntoConstraints = false

        cashLabel = UILabel()
        cashLabel.textAlignment = .center
        cashLabel.translatesAutoresizingMaskIntoConstraints = false

        contentStackView = UIStackView(arrangedSubviews: [titleLabel, profitAndLossLabel, cashLabel])
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.alignment = .center
        contentStackView.axis = .horizontal
        contentStackView.distribution = .equalSpacing
        addSubview(contentStackView)

        NSLayoutConstraint.activate([
            // H
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            // V
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        updateContent()
    }

    private func updateContent() {
        titleLabel.text = viewModel.tradingSessionName
        profitAndLossLabel.text = "\("positionsHeader.profitAndLossLabel".localized) \(viewModel.profitAndLoss)"
        cashLabel.text = "\("positionsHeader.cashLabel".localized) \(viewModel.cash)"
    }
}

#if DEBUG
import SwiftUI

struct PositionsHeaderViewWrapper: UIViewRepresentable {

    func makeUIView(context: Context) -> some UIView {
        let viewModel = PositionsHeaderViewModel.sample
        return PositionsHeaderView(viewModel: viewModel)
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct PositionsHeaderViewWrapper_Previews: PreviewProvider {

    static var previews: some View {
        PositionsHeaderViewWrapper()
.previewInterfaceOrientation(.portrait)
    }
}

#endif // DEBUG
