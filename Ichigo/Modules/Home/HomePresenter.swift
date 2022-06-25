//
//  HomePresenter.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 23/6/22.
//

import Foundation

struct HomePresenter {
  private(set) weak var viewController: HomeDisplayable?
  
  init(viewController: HomeDisplayable) {
    self.viewController = viewController
  }
}

extension HomePresenter: HomePresentable {
  func presentPhotos(with response: HomeModels.PhotosResponse) {
    var viewModels = [PhotoWithInfoTableViewCellViewModel]()
    for photo in response.response.data {
      let viewModel = PhotoWithInfoTableViewCellViewModel()
      viewModel.id.accept(photo.id)
      viewModel.title.accept(photo.user?.name)
      viewModel.desc.accept(photo.desc)
      viewModel.thumbUrl.accept(photo.photoUrls?.regular)
      viewModels.append(viewModel)
    }
    viewController?.displayPhotos(with: HomeModels.PhotosViewModel(contentVMs: viewModels))
  }
  
  func presentPhotos(with error: HomeModels.DataError) {
    viewController?.displayPhotos(with: error)
  }
  
}
