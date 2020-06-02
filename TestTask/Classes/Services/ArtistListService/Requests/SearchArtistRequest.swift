//
//  SearchArtistRequest.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

final class SearchArtistRequest: BaseRequest {
    
    private let term: String
    private let limit: String
    private let media: String
    
    init(term: String, limit: String, media: String) {
        self.term = term
        self.limit = limit
        self.media = media
    }
    
    override var path: String {
        return "/search"
    }
    
    override var parameters: [String : String] {
        return ["term": term, "limit": limit, "media": media]
    }
}
