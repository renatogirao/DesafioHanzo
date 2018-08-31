//  ListUsersTableViewController.swift
//  Teste Hanzo
//
//  Created by Renato Savoia Girão on 27/08/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit

class ListUsersTableViewController: UITableViewController {
    
    var users : [Users] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
    }

    func loadUsers() {
        let fileURL = Bundle.main.url(forResource: "UserJSON.json", withExtension: nil)!
        let jsonData = try! Data(contentsOf: fileURL)
        do {
            users = try JSONDecoder().decode([Users].self, from: jsonData)
            users = Array(Set(users))
        } catch {
            print (error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! UsersDetailsViewController
        let user = users[tableView.indexPathForSelectedRow!.row]
        vc.user = user
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        let user = users[indexPath.row]
        cell.prepare(with: user)
        return cell
    }
}
