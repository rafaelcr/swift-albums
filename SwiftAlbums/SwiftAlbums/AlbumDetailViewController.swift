//
//  AlbumDetailViewController.swift
//  SwiftAlbums
//
//  Created by Rafael Cardenas on 3/6/18.
//  Copyright © 2018 Rafael Cárdenas. All rights reserved.
//
import AlamofireImage
import Foundation
import UIKit

class AlbumDetailViewController: UIViewController {

  var album: Album!

  @IBOutlet var cover: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    cover.af_setImage(withURL: URL(string: album.coverURL)!)
    titleLabel.text = album.name
    descriptionLabel.text = album.description
  }

}
