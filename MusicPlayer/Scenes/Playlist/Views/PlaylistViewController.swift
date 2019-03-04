//
//  PlaylistViewController.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

protocol PlaylistDisplayProtocol: class {
    func displayPlaylist (viewModel: PlayListViewModel)
    func displayError(message: String)
}

class PlaylistViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let cellIdentifier = "TrackTableViewCell"
    private var interactor: PlaylistInteractorProtocol!
    private var viewModel = PlayListViewModel(tracks: [])
    
    init(interactor: PlaylistInteractorProtocol) {
        super.init(nibName: "PlaylistViewController", bundle: Bundle.main)
        self.interactor = interactor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.seePlaylist()
        self.showLoader()
    }
    
    func setupView() {
        setupNavBar()
        setupTableView()
    }
    
    func setupNavBar() {
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "shuffle"),
                                                 style: .done,
                                                 target: self,
                                                 action: #selector(PlaylistViewController.shuffle))
        rightBarButtonItem.tintColor = .white
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.title = "Shuffle Songs"
    }
    
    @objc func shuffle() {
        interactor.shufflePlaylist()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
    }
}

extension PlaylistViewController: PlaylistDisplayProtocol {
    
    func displayPlaylist(viewModel: PlayListViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.viewModel = viewModel
            self?.tableView.reloadData()
            self?.hideLoader()
        }
    }
    
    func displayError(message: String) {
        print(message)
    }
}

extension PlaylistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? TrackTableViewCell
            else { return UITableViewCell() }
        let cellViewModel = viewModel.tracks[indexPath.row]
        cell.bind(viewModel: cellViewModel)
        return cell
    }
    
    
}

extension PlaylistViewController: UITableViewDelegate { }

