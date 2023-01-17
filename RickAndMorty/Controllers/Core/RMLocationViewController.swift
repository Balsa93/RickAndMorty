//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 8.1.23..
//

import UIKit

/// Controller to show and search for Locations
final class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
    }
    
    @objc func searchTapped() {
        
    }
}
