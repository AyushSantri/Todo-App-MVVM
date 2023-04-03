//
//  ViewController.swift
//  Todo App MVVM
//
//  Created by Ayush Santri on 03/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView : UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    private func setUpTable() {
        view.addSubview(tableView)
        
        tableView.rowHeight = 50
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            fatalError("error in custom cell")
        }
        
        return cell
    }
}

