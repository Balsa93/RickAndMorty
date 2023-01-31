//
//  RMLocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Balsa Komnenovic on 31.1.23..
//

import UIKit

final class RMLocationTableViewCell: UITableViewCell {
    static let identifier = "RMLocationTableViewCell"

    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: RMLocationTableViewCellViewModel) {
        
    }
}
