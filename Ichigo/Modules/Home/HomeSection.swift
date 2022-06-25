//
//  HomeSection.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 21/6/22.
//

import Foundation
import RxDataSources

enum HomeSection: SectionModelType {
  case photos(items: [PhotoWithInfoTableViewCellViewModel])
  var items: [AnyObject] {
    switch self {
    case .photos(let items):
      return items
    }
  }
  
  init(original: HomeSection, items: [AnyObject]) {
    switch original {
    case .photos:
      self = .photos(items: items as! [PhotoWithInfoTableViewCellViewModel])
    }
  }
  
}

extension HomeSection: TableViewDataSource {
  typealias Section = HomeSection
  static var allCases: [HomeSection] {
    return [
      .photos(items: [PhotoWithInfoTableViewCellViewModel]())
    ]
  }
  
  static func generateDataSource() -> RxTableViewSectionedReloadDataSource<HomeSection> {
    return RxTableViewSectionedReloadDataSource<HomeSection>(configureCell: { (_, tableView, indexPath, viewModel) -> UITableViewCell in
      var cell: UITableViewCell!
      if let viewModel = viewModel as? PhotoWithInfoTableViewCellViewModel {
        let newCell = tableView.dequeueCell(PhotoWithInfoTableViewCell.self, at: indexPath)
        newCell.configureWith(value: viewModel)
        cell = newCell
      }
      return cell
    })
  }
  
  var cellType: UITableViewCell.Type {
    switch self {
    case .photos:
      return PhotoWithInfoTableViewCell.self
    }
  }
  
}

extension HomeSection: RelativeOrder {
  var sectionOrder: Int {
    switch self {
    case .photos:
      return 0
    }
  }
}
