//
//  AlbumsViewController.swift
//  SwiftAlbums
//
//  Created by Rafael Cardenas on 3/6/18.
//  Copyright © 2018 Rafael Cárdenas. All rights reserved.
//

import Foundation
import UIKit

class AlbumsViewController: UITableViewController {

  var artists = [Artist]()

  override func numberOfSections(in tableView: UITableView) -> Int {
    return artists.count
  }

  override func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
    return artists[section].albums.count
  }

  func tableView(_ tableView: UITableView,
                 titleForHeaderInSection section: Int) -> String? {
    return artists[section].name
  }

}

class AlbumCell: UITableViewCell {
  @IBOutlet var cover: UIImageView!
  @IBOutlet var label: UILabel!
}
