//
//  BaseViewController.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var loaderView: UIView = UIView()
    private let loader: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loader.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.loaderView.backgroundColor = #colorLiteral(red: 0.4648635387, green: 0.32649225, blue: 0.4731030464, alpha: 1)
        self.loaderView.addSubview(self.loader)
    }
    
    func showLoader() {
        self.loaderView.frame = UIScreen.main.bounds
        self.loader.center = self.loaderView.center
        
        DispatchQueue.main.async {
            self.loader.startAnimating()
            self.view.addSubview(self.loaderView)
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
            self.loaderView.removeFromSuperview()
        }
    }
}
