//
//  SearchArtistListResponce.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

struct SearchArtistListResponce: Codable {
    let resultCount: Int
    let results: [SearchArtistResponce]
}

struct SearchArtistResponce: Codable {
    let artistName: String
    let trackName: String
    let artworkUrl60: String
}
