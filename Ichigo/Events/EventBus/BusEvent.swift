//
//  BusEvent.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 21/6/22.
//

import Foundation
import RxSwift

protocol BusEvent {
  var error: Error? { get }
  static var throttle: Bool { get }
  
  init(error: Error, params: Any?)
}

protocol SerialBusEventProtocol: BusEvent {
  associatedtype ReturnType
  static func onSubcribeAction() -> Single<ReturnType>?
  static func saga() -> [SerialSubrequest]
  
  var payload: ReturnType? { get }
  
  init(payload: ReturnType, params: Any?)
}

protocol ConcurrentBusEventProtocol: BusEvent {
  associatedtype ReturnType
  static func saga(_ parameters: Any...) -> [ConcurrentSubrequest]
  
  var payload: ReturnType? { get }
  
  init(payload: ReturnType)
  
}

protocol StandaloneEventProtocol: BusEvent {
  associatedtype ReturnType
  
  var payload: ReturnType? { get }
  
  init(payload: ReturnType)
}

