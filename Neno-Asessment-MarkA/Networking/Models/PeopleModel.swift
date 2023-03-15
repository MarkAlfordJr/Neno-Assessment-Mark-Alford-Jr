//
//  PeopleModel.swift
//  Neno-Asessment-MarkA
//
//  Created by Mark Alford on 3/15/23.
//

import Foundation

/**
 Generates a list of people, for the feed screen
 */
// MARK: - Welcome
struct PeopleModel: Codable {
    let status: String
    let code, total: Int
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let firstname, lastname, email, phone: String
    let birthday: String
    let gender: Gender
    let address: Address
    let website, image: String
}

// MARK: - Address
struct Address: Codable {
    let id: Int
    let street, streetName, buildingNumber, city: String
    let zipcode, country, countyCode: String
    let latitude, longitude: Double

    enum CodingKeys: String, CodingKey {
        case id, street, streetName, buildingNumber, city, zipcode, country
        case countyCode = "county_code"
        case latitude, longitude
    }
}

enum Gender: String, Codable {
    case male = "male"
}
