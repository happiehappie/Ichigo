//
//  HomeBusinessLogic.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 23/6/22.
//

import Foundation

protocol HomeDisplayable: AnyObject {
  func displayPhotos(with viewModel: HomeModels.PhotosViewModel)
  func displayPhotos(with error: HomeModels.DataError)
}

protocol HomeBusinessLogic { // Interactor
  func getPhotos()
}

protocol HomePresentable { // Presenter
  func presentPhotos(with response: HomeModels.PhotosResponse)
  func presentPhotos(with error: HomeModels.DataError)
}
