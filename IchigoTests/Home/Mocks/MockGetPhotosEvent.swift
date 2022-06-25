//
//  MockGetPhotosEvent.swift
//  IchigoTests
//
//  Created by Jack Xiong Lim on 24/6/22.
//

import Foundation
import RxSwift
@testable import Ichigo

enum MockGetPhotosEventType {
  case someObject
  case error
}

enum MockGetPhotosEventError: Error {
  case http
}

class MockGetPhotosEvent: SerialBusEvent<GetPhotosResponse> {
  static var type: MockGetPhotosEventType = .someObject
  
  override class func saga() -> [SerialSubrequest] {
    return [
      SerialSubrequest(action: { (_) -> Single<Any?> in
        switch type {
        case .someObject:
          return Single.just(GetPhotosResponse.mock()).map { $0 as Any }
        case .error:
          return Single.error(MockGetPhotosEventError.http)
        }
        
      }, debugInfo: "Mocking GetPhotosEvent Event")
    ]
  }
}

