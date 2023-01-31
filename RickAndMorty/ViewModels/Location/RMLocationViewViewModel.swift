//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 31.1.23..
//

import Foundation

class RMLocationViewViewModel {
    private var locations: [RMLocation]?
    private var cellViewModel: [String] = []
    private var hasMoreResults: Bool {
        return false
    }
    
    //MARK: - Init
    init() { }
    
    //MARK: - Public
    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequests, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }
}
