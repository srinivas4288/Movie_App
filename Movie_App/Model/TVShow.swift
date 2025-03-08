//
//  TVShow.swift
//  Srinivas_Muppera_Assignment
//
//  Created by Srinivas Muppera on 04/03/25.
//


import SwiftUI
import Combine

struct TVShow: Identifiable, Codable {
    let id: Int
    let name: String
    let overview: String
    let posterPath: String?
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, name, overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

