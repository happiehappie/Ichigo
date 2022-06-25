//
//  HomeViewController.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 21/6/22.
//

import UIKit
import RxSwift
import RxDataSources

class HomeViewController<ViewModel, Router>: UIViewController where ViewModel: HomeViewModelType, Router: GeneralRoutable & HomeRoutable {
  
  // MARK: - Properties -
  // MARK: Internal
  
  var rootView: HomeView {
    return view as! HomeView
  }
  
  // MARK: Private
  
  private(set) lazy var viewModel: ViewModel = ViewModel()
  private var router: Router
  private var disposeBag: DisposeBag!
  
  // MARK: - Initializer and Lifecycle Methods -
  init(viewModel: ViewModel, router: Router) {
    self.router = router
    
    super.init(nibName: nil, bundle: nil)
    
    self.viewModel = viewModel
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = HomeView(frame: UIScreen.main.bounds)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    setupView()
    setupListeners()
  }
  
  // MARK: - Private API -
  // MARK: Setup Methods
  
  private func setupView() {
    
    for section in HomeSection.allCases {
      rootView.tableView.registerCellClass(section.cellType)
    }
  }
  
  private func setupListeners() {
    disposeBag = DisposeBag()
    
    viewModel.sectionedItems
      .bind(to: rootView.tableView.rx.items(dataSource: viewModel.dataSource))
      .disposed(by: disposeBag)
    
    viewModel.photos
      .subscribe(onNext: { [weak self] (value) in
        guard let strongSelf = self else { return }
        strongSelf.viewModel.setSection(.photos(items: value))
      })
      .disposed(by: disposeBag)
    
    viewModel.notifyError
      .subscribe(onNext: { [weak self] (value) in
        guard let strongSelf = self, let value = value else { return }
        DispatchQueue.main.async {
          strongSelf.router.handleError(error: value)
        }
      })
      .disposed(by: disposeBag)
  }
  
}
