//
//  HomeInteractor.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 23/6/22.
//

import Foundation
import RxSwift

class HomeInteractor: HomeBusinessLogic {
  
  var presenter: HomePresentable?
  var getPhotosEventType: SerialBusEvent.Type = GetPhotosEvent.self
  private var disposeBag = DisposeBag()
  
  init(presenter: HomePresentable) {
    self.presenter = presenter
    EventBus.shared.events(of: getPhotosEventType)
      .subscribe(onNext: { [weak self] (value) in
        guard let strongSelf = self else { return }
        if let payload = value.payload {
          strongSelf.presenter?.presentPhotos(with: HomeModels.PhotosResponse(response: payload))
        }
        else if let error = value.error {
          strongSelf.presenter?.presentPhotos(with: HomeModels.DataError(error: error))
        }
      })
      .disposed(by: disposeBag)
    getPhotos()
  }
  
  func getPhotos() {
    EventBus.shared.executeEvent(of: getPhotosEventType)
  }
  
}
