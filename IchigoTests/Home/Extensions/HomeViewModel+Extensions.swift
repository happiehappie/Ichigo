//
//  HomeViewModel+Extensions.swift
//  IchigoTests
//
//  Created by Jack Xiong Lim on 24/6/22.
//

import Foundation
@testable import Ichigo

extension HomeModels.PhotosViewModel {
  static func mock() -> Self {
    let value = GetPhotosResponse.mock()
    var viewModels = [PhotoWithInfoTableViewCellViewModel]()
    for photo in value.data {
      let viewModel = PhotoWithInfoTableViewCellViewModel()
      viewModel.id.accept(photo.id)
      viewModel.title.accept(photo.user?.name)
      viewModel.desc.accept(photo.desc)
      viewModel.thumbUrl.accept(photo.photoUrls?.regular)
      viewModels.append(viewModel)
    }
    return HomeModels.PhotosViewModel(contentVMs: viewModels)
  }
}
