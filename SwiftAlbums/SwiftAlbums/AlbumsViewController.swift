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

  override func tableView(_ tableView: UITableView,
                          titleForHeaderInSection section: Int) -> String? {
    return artists[section].name
  }

  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as! AlbumCell
    let album = artists[indexPath.section].albums[indexPath.row]
    cell.label.text = album.name
    return cell
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let api = API()
    api.getAlbums { (artists) in
      self.artists = artists
      self.tableView.reloadData()
    }
  }

}

class AlbumCell: UITableViewCell {
  @IBOutlet var cover: UIImageView!
  @IBOutlet var label: UILabel!
}
