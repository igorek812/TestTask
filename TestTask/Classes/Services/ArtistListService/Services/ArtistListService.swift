//
//  ArtistListService.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

final class ArtistListService {
    
    // поиск артиста
    static func searchArtist(with title: String, completion: @escaping (Result<SearchArtistListResponce>) -> Void) {
        let requestData = SearchArtistRequest(term: title, limit: "25", media: "music")
        let request = RequestFactory.getRequest(baseRequest: requestData)
        RequestService<SearchArtistListResponce>().process(request: request, completion: completion)
    }
}
