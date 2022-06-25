//
//  PhotoWithInfoTableViewCell.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 21/6/22.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit
import AlamofireImage

class PhotoWithInfoTableViewCell: UITableViewCell {
  private lazy var containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemBlue
    return view
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .headline)
    label.textColor = .label
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var descLabel: UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .caption1)
    label.textColor = .label
    label.translatesAutoresizingMaskIntoConstraints = false
    label.setContentHuggingPriority(.defaultLow, for: .vertical)
    label.numberOfLines = 2
    return label
  }()

  private lazy var contentImageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFill
    view.clipsToBounds = true
    return view
  }()
  
  var viewModel: PhotoWithInfoTableViewCellViewModelType = PhotoWithInfoTableViewCellViewModel()
  var disposeBag: DisposeBag!
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
    setupListeners()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    disposeBag = nil
  }
  
  func setupView() {
    selectionStyle = .none
    backgroundColor = .clear
    contentView.addSubview(containerView)
    containerView.addSubview(contentImageView)
    containerView.addSubview(titleLabel)
    containerView.addSubview(descLabel)

    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
      containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: ICGSpace.m),
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: ICGSpace.m),
      titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -ICGSpace.m),

      descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ICGSpace.s),
      descLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: ICGSpace.m),
      descLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -ICGSpace.m),

      contentImageView.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: ICGSpace.s),
      contentImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      contentImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
      contentImageView.heightAnchor.constraint(equalTo: contentImageView.widthAnchor, multiplier: 1.0),
      contentImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)

    ])
  }
  
  func setupListeners() {
    disposeBag = DisposeBag()
    viewModel.thumbUrl
      .subscribe(onNext: { [weak self] (value) in
        guard let strongSelf = self, let string = value, let url = URL(string: string) else { return }
        strongSelf.contentImageView.af.setImage(withURL: url)
      })
      .disposed(by: disposeBag)

    viewModel.title
      .subscribe(onNext: { [weak self] in
        guard let strongSelf = self else { return }
        strongSelf.titleLabel.text = $0
      })
      .disposed(by: disposeBag)

    viewModel.desc
      .subscribe(onNext: { [weak self] in
        guard let strongSelf = self else { return }
        strongSelf.descLabel.text = $0
      })
      .disposed(by: disposeBag)

  }
  
}

extension PhotoWithInfoTableViewCell: ValueCell {
  func configureWith(value: PhotoWithInfoTableViewCellViewModelType) {
    viewModel = value
    setupListeners()
  }
}
