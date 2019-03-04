//
//  UIImage+Extensions.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(from url: String) {
        guard let urlPath = URL(string: url) else { return }
        self.image = UIImage(named: "placeholderImage")
        ImageDownloader.shared.loadImage(from: urlPath) { [weak self] (image) in
            guard let image = image else { return }
            self?.alpha = 0
            self?.image = image
            UIView.animate(withDuration: 0.2, animations: {
                self?.alpha = 1
            })
        }
    }
}
