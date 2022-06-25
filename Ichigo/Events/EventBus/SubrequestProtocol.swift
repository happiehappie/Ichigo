//
//  SubrequestProtocol.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 21/6/22.
//

import Foundation
import RxSwift

protocol SubrequestProtocol {
  var compensation: Single<Void>? { get }
  var debugInfo: String { get }
}
