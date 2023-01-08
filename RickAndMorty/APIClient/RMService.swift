//
//  RMService.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 8.1.23..
//

import Foundation

/// Primary API service object to get Rick And Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick And Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
    }
}
