//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 8.1.23..
//

import Foundation

struct RMEpisode: Codable, RMEpisodeDataRender {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
