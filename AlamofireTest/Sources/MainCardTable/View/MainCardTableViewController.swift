//
//  MainCardTableViewController.swift
//  AlamofireTest
//
//  Created by Denis Snezhko on 15.07.2022.
//

import UIKit

class MainCardTableViewController: UIViewController {
    
    // MARK: - Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(CardCell.self, forCellReuseIdentifier: CardCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var presenter: MainCardTableViewControllerOutput?
    private var cards = [Card]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayouts()
        presenter?.fetchCards()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        title = "My Cards"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - MainViewControllerInput

extension MainCardTableViewController: MainCardTableViewControllerInput {
    func updateCards(with cards: [Card]) {
        self.cards = cards
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension MainCardTableViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        cards.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CardCell.identifier,
            for: indexPath
        ) as? CardCell else {
            return UITableViewCell()
        }
        cell.configure(with: cards[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainCardTableViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: false)
        let card = cards[indexPath.row]
        let viewController = CardInfoViewController(card: card)
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true)
    }
}
