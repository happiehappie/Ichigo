//
//  GetPhotosEvent.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 23/6/22.
//

import Foundation
import RxSwift

class GetPhotosEvent: SerialBusEvent<GetPhotosResponse> {
  // MARK: Overridden Methods
  override class func saga() -> [SerialSubrequest] {
    let subrequest1 = SerialSubrequest(action: { _ in
      return API.getPhotos().map { $0 as Any }
    }, debugInfo: "GET /photos")
    
    return [subrequest1]
  }
}
