//
//  RMSearchResultsView.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 6.3.23..
//

import UIKit

protocol RMSearchResultsViewDelegate: AnyObject {
    func rmSearchResultsView(_ resultsView: RMSearchResultsView, didTapLocationAt index: Int)
}

/// Shows search results UI (table of collection as needed)
final class RMSearchResultsView: UIView {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RMLocationTableViewCell.self, forCellReuseIdentifier: RMLocationTableViewCell.identifier)
        tableView.isHidden = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var viewModel: RMSearchResultViewModel? {
        didSet {
            self.processViewModel()
        }
    }
    private var locationCellViewModels: [RMLocationTableViewCellViewModel] = []
    weak var delegate: RMSearchResultsViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubviews(tableView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: - Private
    private func processViewModel() {
        guard let viewModel = viewModel else { return }
        switch viewModel {
        case .characters(let viewModels):
            setupCollectionView()
            break
        case .locations(let viewModels):
            setupTableView(viewModels: viewModels)
            break
        case .episodes(let viewModels):
            setupCollectionView()
            break
        }
    }
    
    private func setupCollectionView() {
        
    }
    
    private func setupTableView(viewModels: [RMLocationTableViewCellViewModel]) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        self.locationCellViewModels = viewModels
        tableView.reloadData()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    //MARK: - Public
    public func configure(with viewModel: RMSearchResultViewModel) {
        self.viewModel = viewModel
    }
}

//MARK: - TableView
extension RMSearchResultsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RMLocationTableViewCell.identifier, for: indexPath) as? RMLocationTableViewCell else { return UITableViewCell() }
        cell.configure(with: locationCellViewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewModel = locationCellViewModels[indexPath.row]
        delegate?.rmSearchResultsView(self, didTapLocationAt: indexPath.row)
    }
}
