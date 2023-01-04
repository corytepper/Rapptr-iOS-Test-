//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import UIKit

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
 */

// Query string to use (Keeps returning 'invalid parameters' for some reason)
// http://dev.rapptrlabs.com/Tests/scripts/login.php?email=info@rapptrlabs.com&password=Test123

final class LoginClient {
    static private let shared = LoginClient()
    
    private var session: URLSession?
    private let startTime = NSDate.timeIntervalSinceReferenceDate
    
    func getPostString(params:[String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    // MARK: - Network call using URLSession
    func login(email: String, password: String, completion: @escaping (String) -> Void, error errorHandler: @escaping (String?) -> Void) {
        
        let parameters = getPostString(params: ["email":email, "password":password])
        let urlString = "http://dev.rapptrlabs.com/Tests/scripts/login.php"
        let requestURL = URL(string: urlString)!
        var requestHeader = URLRequest.init(url: requestURL)
        
        requestHeader.httpBody = parameters.data(using: .utf8, allowLossyConversion: false)
        requestHeader.httpMethod = "POST"
        
        session = URLSession.shared
        session?.dataTask(with: requestHeader, completionHandler: { data, response, error in
            
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    if let decodedData = try JSONDecoder().decode(LoginResponse?.self, from: data!) {
                        
                        
                        if httpResponse.statusCode == 200 {
                            
                            let responseTime = NSDate.timeIntervalSinceReferenceDate - self.startTime
                            let milliseconds = Int((responseTime * 1000).truncatingRemainder(dividingBy: 1000))
                            DispatchQueue.main.async {
                                let successMessage = decodedData.message
                                let completionMessage = successMessage + "\nRequest completed in " + String(milliseconds) + " ms."
                                completion(completionMessage)
                            }
                        } else{
                            DispatchQueue.main.async {
                                errorHandler(decodedData.message)
                            }
                        }
                    }
                }
            }
            catch {
                print(error)
            }
        }).resume()
    }
}
