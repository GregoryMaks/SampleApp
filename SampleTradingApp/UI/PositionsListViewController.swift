//
//  PositionsListViewController.swift
//  SampleTradingApp
//
//  Created by Gregory Maksiuk on 07.11.2021.
//

import UIKit

final class PositionsListViewController: UIViewController {

    private static let cellIdentifier = "positionsList.cell"

    var viewModel: PositionsListViewModel? {
        didSet {
            if isViewLoaded { updateContent() }
        }
    }

    private var headerView: PositionsHeaderView!
    private var tableView: UITableView!

    override var navigationItem: UINavigationItem {
        let item = UINavigationItem(title: "positionList.header".localized)
        item.leftBarButtonItem = UIBarButtonItem(
            customView: UIImageView(image: .init(named: "t4icon"))
        )
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupHeaderView()
        setupTableView()
    }
}

private extension PositionsListViewController {

    func setupHeaderView() {
        guard let viewModel = viewModel else { return }

        headerView = PositionsHeaderView(viewModel: viewModel.headerViewModel)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.frame = .init(origin: .zero, size: headerView.intrinsicContentSize)
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor)
        ])
    }

    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.sectionHeaderTopPadding = 0
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.register(PositionsTableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
    }

    func updateContent() {
        headerView.viewModel = viewModel?.headerViewModel
        tableView.reloadData()
    }
}

extension PositionsListViewController: UITableViewDataSource {

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

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        PositionsListSectionHeaderView()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
}

extension PositionsListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

// MARK: - Actions

extension PositionsListViewController {

    @objc
    func contextMenuButtonClicked(_ sender: Any) {
    }
}
