//
//  NetworkError.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 12/29/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidUserName
    case invalidPassword
    case invalidData
    case unableToComplete
}
