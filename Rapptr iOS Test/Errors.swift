//
//  Errors.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 12/21/22.
//

import Foundation

enum chatError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
