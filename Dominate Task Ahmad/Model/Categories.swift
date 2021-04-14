//
//  Categories.swift
//  Dominate Task Ahmad
//
//  Created by Ahmad Mustafa on 07/03/2021.
//

import Foundation

// MARK: - Categories
struct Categories: Codable {
    let status: Status
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let title: String
    let logo: String
    let subcategories: [Subcategory]
}

// MARK: - Subcategory
struct Subcategory: Codable {
    let id, categoryID: Int
    let title, logo: String
    let logoPath: String

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
        case title, logo
        case logoPath = "logo_path"
    }
}

// MARK: - Status
struct Status: Codable {
    let message: String
    let code: Int
}
