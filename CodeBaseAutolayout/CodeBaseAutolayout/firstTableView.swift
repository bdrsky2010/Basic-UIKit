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
		tableView.backgroundColor = .systemBackground
		tableView.rowHeight = UITableView.automaticDimension
		// 아주 중요
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()
	private var userData: [UserData] = []
//	private var userData: [UserData] = [UserData(userName: "이름: 팡준", userJob: "직업: 백수", userContent: """
// 많은 사람들이 저에게 그렇게 얘기를 해요. 김민재 그렇게 웃긴 사람 아닌 것 같다. 그런 말을 들을 떄마다 어떤 기분인지 아세요? 무인도, 무인도에 가면 초코파이를 1,200원에 팔고 있거든요? 그런데 그 때마다 백설공주와 여덟 난쟁이가 행복하게 사는 그런 꿈을 꾸곤 하는데 HOT 행복 도쿄 올림픽 막 모든 게 복합적으로 이루어지면서 이번 태풍 피해가 없으시길 바라요
//""")]
	
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
		userData = loadJson("data.json")

		func loadJson<T: Decodable>(_ filename: String) -> T {
			let data: Data
			
			guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
			else { fatalError("\(filename) not found") }
			
			do {
				data = try Data(contentsOf: file)
			} catch {
				fatalError("Could not load \(filename): \(error)")
			}
			
			do {
				return try JSONDecoder().decode(T.self, from: data)
			} catch {
				fatalError("Unable to parse \(filename): \(error)")
			}
		}
		print("userData.count :: \(userData.count)")
	}
}

extension firstTableView: UITableViewDelegate {
	
}

extension firstTableView: UITableViewDataSource {
	// 테이블 뷰 셀의 갯수
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.userData.count
	}
	// 각 셀에 대한 설정
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "JungkookTableViewCell", for: indexPath) as! TableViewCell
		cell.cellInit(name: userData[indexPath.row].userName, job: userData[indexPath.row].userJob, content: userData[indexPath.row].userContent)
//		cell.cellInit(name: userData[0].userName, job: userData[0].userJob, content: userData[0].userContent)
		return cell
	}
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}
}

#Preview {
	firstTableView()
}
