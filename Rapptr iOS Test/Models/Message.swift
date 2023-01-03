//
//  Message.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

struct ChatData: Decodable {
    let data: [Message]
}

struct Message: Decodable  {

    var userID: String
    var username: String
    var avatarURL: URL?
    var text: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case username = "name"
        case avatarURL = "avatar_url"
        case text = "message"
    }
    
    init(testName: String, withTestMessage message: String) {

        self.userID = "0"
        self.username = testName
        self.avatarURL = Bundle.main.url(forResource: "Cory_Tepper", withExtension: "jpg")
        self.text = message
    }
}


struct MockData {
    static let sampleMessage = Message(testName: "Cory Tepper", withTestMessage: "Hire me")
    
    static let sampleChat = [sampleMessage, sampleMessage, sampleMessage, sampleMessage]
    
    static var messages: [Message] = []
}
