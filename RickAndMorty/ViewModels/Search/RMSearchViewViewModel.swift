//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 31.1.23..
//

import Foundation


final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]
    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOption, String)) -> Void)?
    private var searchText = ""
  
    //MARK: - Init
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    //MARK: - Public
    public func executeSearch() {
        // Create Request based on filters
        // Send API call
        // Notify view of results, no results or error
    }
    
    public func set(query text: String) {
        self.searchText = text
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        self.optionMapUpdateBlock?(tuple)
    }
    
    public func registerOptionChangeBlock(_ block: @escaping ((RMSearchInputViewViewModel.DynamicOption, String)) -> Void) {
        self.optionMapUpdateBlock = block
    }
}