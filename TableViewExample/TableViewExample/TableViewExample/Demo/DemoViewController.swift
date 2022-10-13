//
//  DemoViewController.swift
//  TableViewExample
//
//  Created by Andrey Korotkov on 12.10.2021.
//

import UIKit

final class DemoViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        navigationItem.title = "TableViewTest"
    }
    
    private func setupTableView() {
        tableView.register(CodeTableViewCell.self, forCellReuseIdentifier: "CodeTableViewCell")
        tableView.register(UINib(nibName: "XibTableViewCell", bundle: nil), forCellReuseIdentifier: "XibTableViewCell")
        tableView.separatorStyle = .none
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: AnyObject) {
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }

}

extension DemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell: XibTableViewCell = tableView.dequeueReusableCell(withIdentifier: "XibTableViewCell") as! XibTableViewCell
            cell.configurre(with: "XibTableViewCell")
            return cell
        } else {
            let cell: CodeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CodeTableViewCell") as! CodeTableViewCell
            cell.configurre(with: "CodeTableViewCell")
            return cell
        }

    }


}

extension DemoViewController: UITableViewDelegate {


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Yay!", message: "You selected row number \(indexPath.row)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

