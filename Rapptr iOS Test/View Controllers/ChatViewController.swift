//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    var messages: [Message] = []
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Using the following endpoint, fetch chat data
     *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
     *
     * 3) Parse the chat data using 'Message' model
     *
     **/
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        setupNavBar(title: title ?? "")
        configureTableView()
        getMessages()
    }
    
    // MARK: - TableView Setup
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.pinToEdges(of: view)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor(named: "UIView_BG")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatRowViewCell(message: messages[indexPath.row])
        cell.accessoryType = UITableViewCell.AccessoryType.none
        tableView.separatorStyle = .none
        return cell
    }
    
    
    // MARK: - Network Call
    func getMessages() {
        Task {
            do {
                messages = try await ChatClient.shared.getMessages()
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
}


