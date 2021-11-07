//
//  PositionsTableViewCell.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import UIKit

final class PositionsTableViewCell: UITableViewCell {

    var viewModel: PositionsTableViewCellViewModel? {
        didSet {
            updateContent()
        }
    }

    private var cellStackView: UIStackView!
    private var contentStackView: UIStackView!
    private var marketDescriptionLabel: UILabel!
    private var netWorthLabel: UILabel!
    private var profitAndLossLabel: UILabel!
    private var buyAndSellLabel: UILabel!
    private var workingBuyAndSellLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContent()
    }

    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setupContent()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PositionsTableViewCell {

    func setupContent() {
        marketDescriptionLabel = .makeGenericLabel()
        marketDescriptionLabel.textAlignment = .left

        netWorthLabel = .makeGenericLabel()
        profitAndLossLabel = .makeGenericLabel()
        buyAndSellLabel = .makeGenericLabel()
        workingBuyAndSellLabel = .makeGenericLabel()

        contentStackView = UIStackView(arrangedSubviews: [netWorthLabel, profitAndLossLabel, buyAndSellLabel, workingBuyAndSellLabel])
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.alignment = .center
        contentStackView.axis = .horizontal
        contentStackView.distribution = .fillEqually

        cellStackView = UIStackView(arrangedSubviews: [marketDescriptionLabel, contentStackView])
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.alignment = .fill
        cellStackView.axis = .vertical
        cellStackView.distribution = .fill
        contentView.addSubview(cellStackView)

        NSLayoutConstraint.activate([
            // H
            cellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            // V
            cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            cellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
        ])
    }

    func updateContent() {
        // TODO: color labels according to content
        marketDescriptionLabel.text = viewModel?.marketDescription
        netWorthLabel.text = viewModel?.netWorth
        profitAndLossLabel.text = viewModel?.profitAndLoss
        buyAndSellLabel.text = viewModel?.buyAndSell
        workingBuyAndSellLabel.text = viewModel?.workingBuyAndSell
    }
}

private extension UILabel {

    static func makeGenericLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }
}

#if DEBUG
import SwiftUI

struct PositionsTableViewCellWrapper: UIViewRepresentable {

    let viewModel: PositionsTableViewCellViewModel

    func makeUIView(context: Context) -> some UIView {
        let cell = PositionsTableViewCell()
        cell.viewModel = viewModel
        return cell
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct PositionsTableViewCell_Previews: PreviewProvider {

    static let viewModels: [PositionsTableViewCellViewModel] = [
        PositionsTableViewCellViewModel(marketDescription: "ZC DEC21", netWorth: "6", profitAndLoss: "5,588", buyAndSell: "6-0", workingBuyAndSell: "0-0")
    ]

    static var previews: some View {
        ForEach(0..<viewModels.count, id: \.self) {
            PositionsTableViewCellWrapper(viewModel: viewModels[$0])
                .frame(width: .none, height: 60)
                .background(Color.gray)
        }
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

#endif // DEBUG
