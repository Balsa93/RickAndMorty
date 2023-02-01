//
//  RMNoSearchResultsView.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 31.1.23..
//

import UIKit

class RMNoSearchResultsView: UIView {
    private let viewModel = RMNoSearchResultsViewViewModel()
    private let iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .systemBlue
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(iconView, label)
        addConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: - Private
    private func addConstraints() {
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 90),
            iconView.heightAnchor.constraint(equalToConstant: 90),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            label.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10),
            label.leftAnchor.constraint(equalTo: leftAnchor),
            label.rightAnchor.constraint(equalTo: rightAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configure() {
        label.text = viewModel.title
        iconView.image = viewModel.image
    }
}
