//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    
    
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
        configureTable()
        
        
        MockData.messages.append(Message(testName: "James", withTestMessage: "Hey Guys!Hey Guys!Hey Guys!Hey Guys!Hey Guys!Hey Guys!Hey Guys!Hey Guys!Hey Guys!Hey"))
        MockData.messages.append(Message(testName:"Paul", withTestMessage:"What's up?"))
        MockData.messages.append(Message(testName:"Amy", withTestMessage:"Hey! :)"))
        MockData.messages.append(Message(testName:"James", withTestMessage:"Want to grab some food later?"))
        MockData.messages.append(Message(testName:"Paul", withTestMessage:"Sure, time and place?"))
        MockData.messages.append(Message(testName:"Amy", withTestMessage:"YAS! I am starving!!!"))
        MockData.messages.append(Message(testName:"James", withTestMessage:"1 hr at the Local Burger sound good?"))
        MockData.messages.append(Message(testName:"Paul", withTestMessage:"Sure thing"))
        MockData.messages.append(Message(testName:"Amy", withTestMessage:"See you there :P"))

        tableView.reloadData()
    }
    
    
    // MARK: - Private
    private func configureTable() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //        tableView.register(Chat, forCellReuseIdentifier: "ChatRowViewCell")
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorColor = UIColor.clear
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockData.messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatRowViewCell(message: MockData.messages[indexPath.row])
        cell.accessoryType = UITableViewCell.AccessoryType.none
        return cell
    }
   



    

