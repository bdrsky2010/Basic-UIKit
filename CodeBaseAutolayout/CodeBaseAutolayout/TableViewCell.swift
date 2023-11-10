//
//  TableView.swift
//  CodeBaseAutolayout
//
//  Created by Minjae Kim on 11/5/23.
//

import UIKit

class TableViewCell: UITableViewCell {
	private var userProfileImg: UIImageView = {
		let imageview = UIImageView()
		imageview.image = UIImage(named: "Jungkook")
		imageview.translatesAutoresizingMaskIntoConstraints = false
		return imageview
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
		view.textColor = .gray
		return view
	}()
	private var userContentLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.numberOfLines = 0
		return view
	}()
	private var vStack: UIStackView = {
		let view = UIStackView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.axis = .vertical
		view.distribution = .fillEqually
		return view
	}()
	
	// 스토리보드로 init 해줄 땐 어쩌구
	// 코드베이스로 init 해줄 땐 이렇게 해야댐
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.contentView.backgroundColor = .systemBackground
		
		print("MyTableView :: awakeFromNib() called")
		configUI()
		print("사이즈: ", self.contentView.frame.height)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	func configUI() {
		print(self.frame)
		print(self.contentView.frame)
		contentView.addSubview(userProfileImg)
		contentView.addSubview(vStack)
		contentView.addSubview(userContentLabel)
		vStack.addArrangedSubview(userNameLabel)
		vStack.addArrangedSubview(userJobLabel)

		NSLayoutConstraint.activate([
			userProfileImg.widthAnchor.constraint(equalToConstant: 70),
			userProfileImg.heightAnchor.constraint(equalToConstant: 70),
			userProfileImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			userProfileImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			
			vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			vStack.leadingAnchor.constraint(equalTo: userProfileImg.trailingAnchor, constant: 10),
			vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			vStack.bottomAnchor.constraint(equalTo: userProfileImg.bottomAnchor),

			userContentLabel.topAnchor.constraint(equalTo: userProfileImg.bottomAnchor, constant: 10),
			userContentLabel.leadingAnchor.constraint(equalTo: userProfileImg.leadingAnchor),
			userContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			userContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
		])
	}
//	func configUI() {
//		vStack.addArrangedSubview(userNameLabel)
//		vStack.addArrangedSubview(userJobLabel)
//		vStack.distribution = .equalSpacing
//		print(vStack.arrangedSubviews)
//		
//		contentView.addSubview(userProfileImg)
//		contentView.addSubview(vStack)
//		contentView.addSubview(userContentLabel)
//		NSLayoutConstraint.activate([
//			
//			userProfileImg.widthAnchor.constraint(equalToConstant: 50),
//			userProfileImg.heightAnchor.constraint(equalToConstant: 50),
//			userProfileImg.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
//			userProfileImg.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
//			
//			vStack.topAnchor.constraint(equalTo: userProfileImg.topAnchor),
//			vStack.heightAnchor.constraint(equalTo: userProfileImg.heightAnchor),
//			vStack.leadingAnchor.constraint(equalTo: userProfileImg.trailingAnchor, constant: 10),
//			vStack.bottomAnchor.constraint(equalTo: userProfileImg.bottomAnchor),
//			
//			
//			userContentLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
//			userContentLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
//			userContentLabel.topAnchor.constraint(equalTo: userProfileImg.bottomAnchor, constant: 10),
//			userContentLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
//		])
//	}
	
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
