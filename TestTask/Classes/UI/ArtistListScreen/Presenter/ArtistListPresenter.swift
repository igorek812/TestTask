//
//  ArtistListPresenter.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol ArtistListProtocol: class {
    func showLoading()
    func hideLoading()
    func showPlaceholder()
    func searchArtistSuccess(cellModels: [ArtistViewModel])
    func alert(message: String)
}

final class ArtistListPresenter {
    
    private weak var view: ArtistListProtocol?
    private var lastSearchedName: String?
    private var searchTask: DispatchWorkItem?
    
    public func set(_ view: ArtistListProtocol) {
        self.view = view
    }
    
    public func searchArtist(with name: String) {
        searchTask?.cancel()
        
        if name.isEmpty {
            view?.searchArtistSuccess(cellModels: [])
            return
        } else if name == lastSearchedName {
            return
        }
        
        lastSearchedName = name
        
        view?.showLoading()
        
        let nameEncodedString = name.replacingOccurrences(of: " ", with: "+")
        
        let task = DispatchWorkItem { [weak self] in
            self?.fetchSearch(with: nameEncodedString)
        }
        
        searchTask = task
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.75, execute: task)
    }
}

private extension ArtistListPresenter {
    
    func fetchSearch(with name: String) {
        
        ArtistListService.searchArtist(with: name) { [weak self] status in
            switch status {
            case .success(let data):
                self?.handle(data)
            case .failure(let error):
                self?.handle(error)
            }
            
            self?.view?.hideLoading()
        }
    }
    
    func handle(_ data: SearchArtistListResponce) {
        
        if data.results.isEmpty {
            view?.showPlaceholder()
        } else {
            let cellModels = data.results.map { ArtistViewModel(name: $0.artistName, trackName: $0.trackName, imageUrl: $0.artworkUrl60) }
            
            view?.searchArtistSuccess(cellModels: cellModels)
        }
    }
    
    func handle(_ error: Error) {
        view?.alert(message: error.localizedDescription)
    }
}
