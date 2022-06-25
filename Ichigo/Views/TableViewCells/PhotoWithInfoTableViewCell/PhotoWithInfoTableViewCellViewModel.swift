//
//  PhotoWithInfoTableViewCellViewModel.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 21/6/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol PhotoWithInfoTableViewCellViewModelType {
  var id: BehaviorRelay<String?> { get }
  var thumbUrl: BehaviorRelay<String?> { get }
  var title: BehaviorRelay<String?> { get }
  var desc: BehaviorRelay<String?> { get }
}

class PhotoWithInfoTableViewCellViewModel: PhotoWithInfoTableViewCellViewModelType {
  var id = BehaviorRelay<String?>(value: nil)
  var thumbUrl = BehaviorRelay<String?>(value: nil)
  var title = BehaviorRelay<String?>(value: "hehe")
  var desc = BehaviorRelay<String?>(value: "hehe")
}
