//
//  PositionsViewController.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import UIKit

final class PositionsViewController: UIViewController {

    var tableView: UITableView!

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
}

extension PositionsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO
        0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO
        preconditionFailure()
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
