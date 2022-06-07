//
//  Trip.swift
//  TimeToTravel
//
//  Created by  Юлия Григорьева on 04.06.2022.
//

import Foundation

struct Trip: Codable {
    var startCity: String
    var endCity: String
    var startDate: String
    var endDate: String
    var price: Int

}

struct Trips: Codable {
    var data: [Trip]
}


