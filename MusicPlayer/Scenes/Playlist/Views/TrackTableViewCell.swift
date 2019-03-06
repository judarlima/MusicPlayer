//
//  TrackTableViewCell.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    @IBOutlet weak var artworkImage: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(viewModel: TrackViewModel) {
        artworkImage.loadImage(from: viewModel.artwork)
        trackLabel.text = viewModel.songName
        artistLabel.text = viewModel.artist
    }
    
    override func prepareForReuse() {
        artworkImage.image = nil
        trackLabel.text = ""
        artistLabel.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.setSelected(false, animated: false)
    }
}
