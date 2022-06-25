//
//  HomeViewModel.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 21/6/22.
//

import Foundation
import RxCocoa
import RxDataSources

protocol HomeViewModelType: SectionSetter, TableViewSectionSetter where Section == HomeSection {
  var photos: BehaviorRelay<[PhotoWithInfoTableViewCellViewModel]> { get }
  var notifyError: PublishRelay<Error?> { get }
  init()
}

class HomeViewModel: HomeViewModelType {
  let photos: BehaviorRelay<[PhotoWithInfoTableViewCellViewModel]> = BehaviorRelay(value: [])
  
  var dataSource: RxTableViewSectionedReloadDataSource<Section> = Section.generateDataSource()
  var sectionedItems: BehaviorRelay<[HomeSection]> = BehaviorRelay(value: [])
  var sectionCache = [Int: HomeSection]()
  
  var interactor: HomeBusinessLogic!
  
  let notifyError: PublishRelay<Error?> = PublishRelay()
  required init() {
    interactor = HomeInteractor(presenter: HomePresenter(viewController: self))
  }
}

extension HomeViewModel: HomeDisplayable {
  func displayPhotos(with viewModel: HomeModels.PhotosViewModel) {
    photos.accept(viewModel.contentVMs)
  }
  
  func displayPhotos(with error: HomeModels.DataError) {
    notifyError.accept(error.error)
  }
}
