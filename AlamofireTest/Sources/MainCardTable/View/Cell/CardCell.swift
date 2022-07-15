//
//  CardCell.swift
//  CardTble
//
//  Created by Denis Snezhko on 15.07.2022.
//

import UIKit
import Alamofire

final class CardCell: UITableViewCell {
    
    // MARK: - Elements
    
    static let identifier = "CardCell"
    
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
    
    private lazy var cardRarityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var card: Card?
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardImageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(cardNameLabel)
        stackView.addArrangedSubview(cardRarityLabel)
        accessoryType = .none
        selectionStyle = .none
        backgroundColor = .cyan
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cardImageView.image = nil
        cardNameLabel.text?.removeAll()
        cardRarityLabel.text?.removeAll()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            cardImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cardImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            cardImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardImageView.widthAnchor.constraint(equalToConstant: 55),
            
            stackView.topAnchor.constraint(equalTo: cardImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: cardImageView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    // MARK: - Private functions
    
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
    
    // MARK: - Configuration
    
    func configure(with card: Card) {
        self.card = card
        cardNameLabel.text = card.name
        cardRarityLabel.text = card.rarity
        loadImage()
    }
}
