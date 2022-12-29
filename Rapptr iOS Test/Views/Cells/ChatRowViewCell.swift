//
//  ChatTableViewCell_connector.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 12/21/22.
//

import UIKit
import SwiftUI

class ChatRowViewCell: UITableViewCell {
    
    init(message: Message) {
        super.init(style: .default, reuseIdentifier: "ChatRowViewCell")
        let vc = UIHostingController(rootView: ChatRowView(message: message))
        contentView.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        vc.view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        vc.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        vc.view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        vc.view.backgroundColor = .clear
        
        accessoryType = .disclosureIndicator
        selectionStyle = .default
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
