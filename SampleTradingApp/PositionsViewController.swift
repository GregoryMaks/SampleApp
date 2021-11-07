//
//  PositionsViewController.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import UIKit

final class PositionsViewController: UIViewController {

    private static let cellIdentifier = "positionsList.cell"

    var viewModel: PositionsListViewModel? {
        didSet {
            if isViewLoaded { updateContent() }
        }
    }

    private var tableView: UITableView!

    override var navigationItem: UINavigationItem {
        let item = UINavigationItem(title: "TODO")
        item.rightBarButtonItem = UIBarButtonItem(
            image: .init(systemName: "line.3.horizontal"),
            style: .plain,
            target: self,
            action: #selector(contextMenuButtonClicked(_:))
        )
        return item
    }

    init(viewModel: PositionsListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // TODO sample remove
        self.viewModel = PositionsListViewModel(
            session: .init(name: "demo0001", profitAndLoss: "1000", cash: "2200"),
            positions: [
                .init(marketDescription: "ZC DEC21", netWorth: "6", profitAndLoss: "5436", buyAndSell: "6-0", workingBuyAndSell: "0-0"),
                .init(marketDescription: "10Y OCT21", netWorth: "0", profitAndLoss: "2131", buyAndSell: "0-0", workingBuyAndSell: "1-0"),
                .init(marketDescription: "2YY OCT21", netWorth: "0", profitAndLoss: "12", buyAndSell: "7-3", workingBuyAndSell: "0-2"),
                .init(marketDescription: "5YY OCT 21", netWorth: "0", profitAndLoss: "0", buyAndSell: "56-34", workingBuyAndSell: "3-3")
            ]
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
}

private extension PositionsViewController {

    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.register(PositionsTableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)

        // Header view
        // TODO get from self VM
        let headerView = PositionsHeaderView(viewModel: PositionsHeaderViewModel.sample)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.frame = .init(origin: .zero, size: headerView.intrinsicContentSize)
        tableView.tableHeaderView = headerView
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: tableView.widthAnchor)
        ])
    }

    func updateContent() {
        tableView.reloadData()
    }
}

extension PositionsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.positions.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let viewModel = viewModel,
            viewModel.positions.count > indexPath.row
        else {
            preconditionFailure()
        }

        let position = viewModel.positions[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath) as? PositionsTableViewCell else {
            preconditionFailure()
        }
        cell.viewModel = .init(position)
        return cell
    }
}

extension PositionsViewController: UITableViewDelegate {
}

// MARK: - Actions

extension PositionsViewController {

    @objc
    func contextMenuButtonClicked(_ sender: Any) {
    }
}
