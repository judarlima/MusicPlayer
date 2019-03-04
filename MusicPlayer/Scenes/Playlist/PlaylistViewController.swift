//
//  PlaylistViewController.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

class PlaylistViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(nibName: "PlaylistViewController", bundle: Bundle.main)
        self.view.backgroundColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
