//
//  CardInfoViewController.swift
//  CardTble
//
//  Created by Denis Snezhko on 15.07.2022.
//

import UIKit

final class CardInfoViewController: UIViewController {
    
    // MARK: - Elements
    
    private lazy var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var cardNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cardManaCostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cardTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cardRarityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cardSetNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cardArtistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.contentMode = .scaleAspectFit
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var card: Card?
    
    // MARK: - Lifecycle
    
    convenience init(card: Card) {
        self.init(nibName:nil, bundle:nil)
        self.card = card
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayouts()
        loadImage()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = .white
        cardNameLabel.text = "Name: " + (card?.name ?? "No")
        cardManaCostLabel.text = "Mana cost: " + (card?.manaCost ?? "No")
        cardTypeLabel.text = "Type: " + (card?.type ?? "No")
        cardRarityLabel.text = "Rarity: " + (card?.rarity ?? "No")
        cardSetNameLabel.text = "Set name: " + (card?.setName ?? "No")
        cardArtistNameLabel.text = "Artist: " + (card?.artist ?? "No")
    }
    
    private func setupHierarchy() {
        view.addSubview(stackView)
        view.addSubview(cardImageView)
        stackView.addArrangedSubview(cardNameLabel)
        stackView.addArrangedSubview(cardManaCostLabel)
        stackView.addArrangedSubview(cardTypeLabel)
        stackView.addArrangedSubview(cardRarityLabel)
        stackView.addArrangedSubview(cardSetNameLabel)
        stackView.addArrangedSubview(cardArtistNameLabel)
    }
    
    private func setupLayouts() {
        let sideGap = Metric.sideGap
        let verticalGap = Metric.verticalGap
        NSLayoutConstraint.activate([
            cardImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: verticalGap),
            cardImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sideGap),
            cardImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sideGap),
            cardImageView.heightAnchor.constraint(equalToConstant: Metric.screenWidth),
            
            
            stackView.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: verticalGap),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Metric.stackViewBottomGap),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sideGap),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sideGap),
        ])
    }
    
    private func loadImage() {
        guard let imagePath = card?.imageUrl,
              let imageURL = URL(string: imagePath),
              let imageData = try? Data(contentsOf: imageURL)
        else {
            cardImageView.image = UIImage(systemName: "shareplay.slash")
            return
        }
        cardImageView.image = UIImage(data: imageData)
    }
}

// MARK: - Metric

extension CardInfoViewController {
    struct Metric {
        static let screenWidth = UIScreen.main.bounds.width
        static let sideGap: CGFloat = 16
        static let verticalGap: CGFloat = 10
        static let stackViewBottomGap: CGFloat = -200
    }
}
