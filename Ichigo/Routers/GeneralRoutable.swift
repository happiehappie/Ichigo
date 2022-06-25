//
//  GeneralRoutable.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 21/6/22.
//

import Foundation

protocol GeneralRoutable {
  func navigateBack()
  func handleError(error: Error)
}
