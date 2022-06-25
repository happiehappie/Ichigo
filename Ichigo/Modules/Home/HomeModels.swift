//
//  HomeModels.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 23/6/22.
//

import Foundation

enum HomeModels {
    struct PhotosResponse {
        let response: GetPhotosResponse
    }

    struct PhotosViewModel {
        var contentVMs: [PhotoWithInfoTableViewCellViewModel]
    }

    struct DataError {
        let error: Error
    }
}
