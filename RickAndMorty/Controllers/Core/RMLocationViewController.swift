//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 8.1.23..
//

import UIKit

/// Controller to show and search for Locations
final class RMLocationViewController: UIViewController {
    private let primaryView = RMLocationView()
    private let viewModel = RMLocationViewViewModel()
    
//    *Another way of adding subview to the view*
//    override func loadView() {
//        view = primaryView()
//    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(primaryView)
        title = "Locations"
        addSearchButton()
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
    }
    
    @objc func searchTapped() {
        
    }
}
