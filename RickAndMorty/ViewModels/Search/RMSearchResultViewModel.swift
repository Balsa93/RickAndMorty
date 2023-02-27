//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 27.2.23..
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
