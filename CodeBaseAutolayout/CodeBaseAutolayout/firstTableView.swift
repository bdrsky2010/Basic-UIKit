//
//  firstTableView.swift
//  CodeBaseAutolayout
//
//  Created by Minjae Kim on 11/7/23.
//

import UIKit

class firstTableView: UIViewController {
	
	lazy var myTableView: UITableView = {
		let tableView: UITableView = UITableView(frame: .zero, style: .grouped)
		tableView.register(TableViewCell.self, forCellReuseIdentifier: "JungkookTableViewCell")
		tableView.backgroundColor = .red
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = 120
		// 아주 중요
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()
//	private var userData: [UserData] = []
	private var userData: [UserData] = [UserData(userName: "이름: 팡준", userJob: "직업: 백수", userContent: "소개: 해위")]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .systemBackground
		self.title = "이 사람의 이름은 정국입니다."
		
		view.addSubview(myTableView)
		myTableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
		])
		
//		guard let url = Bundle.main.url(forResource: "Data", withExtension: "json") else { return }
//		
//		do {
//			let stringData = try String(contentsOf: url, encoding: String.Encoding.utf8)
//			print(stringData)
//			let data = stringData.data(using: String.Encoding.utf8)
//			userData = try JSONDecoder().decode([UserData].self, from: data!)
//			for i in 0..<userData.count {
//				print("name: \(userData[i].userName)")
//				print("job: \(userData[i].userJob)")
//				print("content: \(userData[i].userContent)\n")
//			}
//		} catch {
//			print(error.localizedDescription)
//		}
		print("userData.count :: \(userData.count)")
	}
}

extension firstTableView: UITableViewDelegate {
	
}

extension firstTableView: UITableViewDataSource {
	// 테이블 뷰 셀의 갯수
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return self.userData.count
		return 10
	}
	// 각 셀에 대한 설정
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = myTableView.dequeueReusableCell(withIdentifier: "JungkookTableViewCell", for: indexPath) as! TableViewCell
//		cell.cellInit(name: userData[indexPath.row].userName, job: userData[indexPath.row].userJob, content: userData[indexPath.row].userContent)
		cell.cellInit(name: userData[0].userName, job: userData[0].userJob, content: userData[0].userContent)
		return cell
	}
//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		tableView.beginUpdates()
//		tableView.endUpdates()
//	}
//	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//		tableView.beginUpdates()
//		tableView.endUpdates()
//	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}

#Preview {
	firstTableView()
}
