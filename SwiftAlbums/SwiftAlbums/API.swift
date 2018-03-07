//
//  API.swift
//  SwiftAlbums
//
//  Created by Rafael Cardenas on 3/6/18.
//  Copyright © 2018 Rafael Cárdenas. All rights reserved.
//
import Alamofire
import Foundation

class API {

  func getAlbums() {
    let url = "https://bit.ly/2HaKQSC"
    Alamofire
      .request(url)
      .validate()
      .responseJSON { (response) in

        if let json = response.value as? [[String: Any]] {
          var artists = [Artist]()
          for artistJSON in json {
            var albums = [Album]()
            if let albumsJSON = artistJSON["albums"] as? [[String: Any]] {
              for albumJSON in albumsJSON {
                let album = Album(name: albumJSON["name"] as! String,
                                  year: albumJSON["year"] as! Int,
                                  description: albumJSON["description"] as! String,
                                  coverURL: albumJSON["cover"] as! String)
                albums.append(album)
              }
            }
            let artist = Artist(name: artistJSON["name"] as! String,
                                albums: albums)
            artists.append(artist)
          }
        }

    }
  }

}
