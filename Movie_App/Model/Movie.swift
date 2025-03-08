//
//  Movie.swift
//  Srinivas_Muppera_Assignment
//
//  Created by Srinivas Muppera on 04/03/25.
//
//

import SwiftUI
import Combine

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
