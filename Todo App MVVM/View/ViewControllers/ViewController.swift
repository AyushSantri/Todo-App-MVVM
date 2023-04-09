//
//  ViewController.swift
//  Todo App MVVM
//
//  Created by Ayush Santri on 03/04/23.
//

import UIKit

class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var todoArray : [TodoTask] = []
    
    let tableView : UITableView = UITableView()
    let addDataController = AddDataController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        
        navigationItem.title = "TODO App"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToNextScreen))
        
        fetchData()
    }
    
    @objc func goToNextScreen() {
        navigationController?.pushViewController(addDataController, animated: true)
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
        return todoArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            fatalError("error in custom cell")
        }
        let data = todoArray[indexPath.row]
        
        cell.lable.text = data.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let showDetailedTODOViewController = showDetailedTODOViewController()
        showDetailedTODOViewController.configure(title: "ayush title", description: "this is a title form view controller")
        showDetailedTODOViewController.modalPresentationStyle = .pageSheet
        showDetailedTODOViewController.sheetPresentationController?.detents = [.medium()]
        showDetailedTODOViewController.sheetPresentationController?.prefersGrabberVisible = true
        
        present(showDetailedTODOViewController, animated: true)
    }
}

extension ViewController {
    func fetchData() {
        do {
            try self.todoArray = context.fetch(TodoTask.fetchRequest())
        }
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        DispatchQueue.main.async {
            print(self.todoArray)
            self.tableView.reloadData()
        }
    }
    
    func addData(dataToAdd : TodoTask) {
        let todoTask = TodoTask(context: context)
        todoTask.title = dataToAdd.title
        todoTask.detailedTask = dataToAdd.detailedTask
        todoTask.priority = dataToAdd.priority
        try! context.save()
        fetchData()
    }
    
    func deleteData(todoObj : TodoTask) {
        context.delete(todoObj)
        try! context.save()
        fetchData()
    }
}

