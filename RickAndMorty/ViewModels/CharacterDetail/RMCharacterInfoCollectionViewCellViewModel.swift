//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 10.1.23..
//

import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {
    private let type: `Type`
    private let value: String
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    public var title: String {
        type.displayTitle
    }
    public var displayValue: String {
        if value.isEmpty { return "None" }
            if let date = Self.dateFormatter.date(from: value), type == .created {
                return Self.shortDateFormatter.string(from: date)
        }
        return value
    }
    public var iconImage: UIImage? {
        return type.iconImage
    }
    public var tintColor: UIColor {
        return type.tintColor
    }
    
    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case created
        case location
        case episodeCount
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemCyan
            case .gender:
                return .systemRed
            case .type:
                return .systemOrange
            case .species:
                return .systemGreen
            case .origin:
                return .systemPink
            case .created:
                return .systemMint
            case .location:
                return .systemBlue
            case .episodeCount:
                return .systemYellow
            }
        }
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "bell")
            case .gender:
                return UIImage(systemName: "globe")
            case .type:
                return UIImage(systemName: "gear")
            case .species:
                return UIImage(systemName: "person")
            case .origin:
                return UIImage(systemName: "house")
            case .created:
                return UIImage(systemName: "lasso")
            case .location:
                return UIImage(systemName: "location")
            case .episodeCount:
                return UIImage(systemName: "highlighter")
            }
        }
        var displayTitle: String {
            switch self {
            case .status,
                    .gender,
                    .type,
                    .species,
                    .origin,
                    .created,
                    .location:
                return rawValue.uppercased()
            case .episodeCount:
                return "EPISODE COUNT"
            }
        }
    }
    
    init(value: String, type: `Type`) {
        self.value = value
        self.type = type
    }
}
