//
//  PlaylistViewController.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

protocol PlaylistDisplayProtocol: class {
    func displayPlaylist()
    func displayError()
}

class PlaylistViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let cellIdentifier = "TrackTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    init() {
        super.init(nibName: "PlaylistViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlaylistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? TrackTableViewCell
            else { return UITableViewCell() }
        return cell
    }
    
    
}

extension PlaylistViewController: UITableViewDelegate { }

