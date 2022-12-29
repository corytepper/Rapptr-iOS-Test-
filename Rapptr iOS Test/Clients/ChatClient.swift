//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

final class ChatClient {
    
    static let shared =  ChatClient()
    
    private let chatURL = "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php"
    
    private init() {}
    
    func getMessages() async throws -> [Message] {
        guard let url = URL(string: chatURL) else  {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(ChatData.self, from: data)
            return decodedResponse.data
            
        } catch {
            throw NetworkError.invalidData
        }
    }
}
    
        
    

