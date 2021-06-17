//
//  ViewController.swift
//  TMDBTest
//
//  Created by Bezdenezhnykh Sergey on 17.06.2021.
//

import UIKit

class ViewController: UIViewController , Coordinating {
    
    var viewModel: ViewModelProtocol?
    var viewData: Movies?
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(CellView.self, forCellReuseIdentifier: "cell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Test"
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        setConstraint()
        viewModel?.viewDidLoad()
        updateView()
    }
    
    private func updateView() {
        viewModel?.viewData = { [weak self] viewData in
            print("------", viewData.results.count)
            self?.viewData = viewData
            self?.tableView.reloadSections([0], with: .automatic)
        }
    }
    
    func setConstraint() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellView {
            cell.movie = viewData?.results[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

