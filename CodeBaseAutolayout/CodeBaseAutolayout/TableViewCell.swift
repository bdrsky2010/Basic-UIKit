//
//  TableView.swift
//  CodeBaseAutolayout
//
//  Created by Minjae Kim on 11/5/23.
//

import UIKit

class TableViewCell: UITableViewCell {
	private var userProfileImg: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "Jungkook")
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private var userNameLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.numberOfLines = 1
		return view
	}()
	private var userJobLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.numberOfLines = 1
		return view
	}()
	private var userContentLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.numberOfLines = 0
		return view
	}()
	private var hStack: UIStackView = {
		let view = UIStackView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.spacing = 10
		view.axis = .vertical
		return view
	}()
	
	// 스토리보드로 init 해줄 땐 어쩌구
	// 코드베이스로 init 해줄 땐 이렇게 해야댐
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.contentView.backgroundColor = .blue
		
		print("MyTableView :: awakeFromNib() called")
		configUI()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	func configUI() {
		hStack.addArrangedSubview(userNameLabel)
		hStack.addArrangedSubview(userJobLabel)
		hStack.distribution = .equalSpacing
		print(hStack.arrangedSubviews)
		
		contentView.addSubview(userProfileImg)
		contentView.addSubview(hStack)
		contentView.addSubview(userContentLabel)
		NSLayoutConstraint.activate([
			userProfileImg.widthAnchor.constraint(equalToConstant: 50),
			userProfileImg.heightAnchor.constraint(equalToConstant: 100),
			userProfileImg.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
			userProfileImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			hStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
			hStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
			hStack.leadingAnchor.constraint(equalTo: userProfileImg.trailingAnchor, constant: 10),
			hStack.bottomAnchor.constraint(equalTo: userProfileImg.bottomAnchor),
			
			userContentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
			userContentLabel.leadingAnchor.constraint(equalTo: userProfileImg.leadingAnchor),
			userContentLabel.topAnchor.constraint(equalTo: userProfileImg.bottomAnchor, constant: 10),
			userContentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
		])
	}
	
	func cellInit(name: String, job: String, content: String) {
		print(name)
		userNameLabel.text = name
		userJobLabel.text = job
		userContentLabel.text = content
	}
}

#Preview {
	TableViewCell()
}
