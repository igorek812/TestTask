//
//  ArtistListCell.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

final class ArtistListCell: UITableViewCell {
    
    private lazy var artistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "empty_artist")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - LyfeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: - Functions
    private func setup() {
        
        contentView.addSubview(artistImageView)
        artistImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        artistImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        artistImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        artistImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: artistImageView.topAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: artistImageView.rightAnchor, constant: 5).isActive = true
        
        contentView.addSubview(trackNameLabel)
        trackNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3).isActive = true
        trackNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        trackNameLabel.leftAnchor.constraint(equalTo: artistImageView.rightAnchor, constant: 5).isActive = true
    }
    
    public func configure(_ viewModel: ArtistViewModel) {
        nameLabel.text = viewModel.name
        trackNameLabel.text = viewModel.trackName
        artistImageView.image = UIImage(named: "empty_artist")
        artistImageView.downloadedFrom(link: viewModel.imageUrl)
    }
}
