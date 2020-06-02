//
//  ArtistListViewController.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

final class ArtistListViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(ArtistListCell.self, forCellReuseIdentifier: ArtistListCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var loadingView: LoadingView = {
        let view = LoadingView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.dimsBackgroundDuringPresentation = false
        sc.searchBar.placeholder = LOC("search")
        sc.searchBar.delegate = self
        sc.searchResultsUpdater = self
        sc.searchBar.sizeToFit()
        return sc
    }()
    
    private lazy var placeholderView: PlaceholderView = {
        let view = PlaceholderView()
        view.set(LOC("artist_not_found"))
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let presenter = ArtistListPresenter()
    private var cellModels: [ArtistViewModel] = []
    
    
    // MARK: - LyfeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.set(self)
    }
    
    
    // MARK: - Functions
    
    private func setup() {
        
        title = LOC("artist_list_vc_title")
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        view.addSubview(loadingView)
        loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadingView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        view.addSubview(placeholderView)
        placeholderView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        placeholderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        placeholderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        placeholderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}


// MARK: - UISearchBarDelegate

extension ArtistListViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        tableView.reloadData()
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchArtist(with: "")
    }
}


// MARK: - UISearchResultsUpdating

extension ArtistListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            presenter.searchArtist(with: searchText)
        }
    }
}


// MARK: - UITableViewDataSource

extension ArtistListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArtistListCell.identifier, for: indexPath) as? ArtistListCell else { return UITableViewCell() }
        cell.configure(cellModels[indexPath.row])
        return cell
    }
}


// MARK: - UITableViewDelegate

extension ArtistListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - ArtistListProtocol

extension ArtistListViewController: ArtistListProtocol {
    
    func showLoading() {
        loadingView.isHidden = false
    }
    
    func hideLoading() {
        loadingView.isHidden = true
    }
    
    func showPlaceholder() {
        placeholderView.isHidden = false
        cellModels = []
        tableView.reloadData()
    }
    
    func searchArtistSuccess(cellModels: [ArtistViewModel]) {
        placeholderView.isHidden = true
        self.cellModels = cellModels
        tableView.reloadData()
    }
    
    func alert(message: String) {
        showAlert(message: message)
    }
}
