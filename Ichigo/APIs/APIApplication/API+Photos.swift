//
//  API+Photos.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 23/6/22.
//

import Foundation
import RxSwift

extension API {
  static func getPhotos() -> Single<GetPhotosResponse> {
    print("\(baseUrl)photos/?client_id=\(clientId)")
    return API.request(.get, "\(baseUrl)photos/?client_id=\(clientId)")
  }
}
