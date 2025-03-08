//
//  MoviesAndTVShowsViewModel.swift
//  Srinivas_Muppera_Assignment
//
//  Created by Srinivas Muppera on 04/03/25.
//

import SwiftUI
import Combine



struct MoviesResponse: Codable {
    let results: [Movie]
}

struct TVShowsResponse: Codable {
    let results: [TVShow]
}


class MoviesAndTVShowsViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var tvShows: [TVShow] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    
    @Published var movieErrorMessage: String? = nil
    @Published var showMovieAlert: Bool = false
    
    @Published var tvShowErrorMessage: String? = nil
    @Published var showTVShowAlert: Bool = false
    
    private var AUTH_TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZTcwMWQyZGYyZmUyMGZkMTdjMzc3Y2E2MWZmYWRjZCIsIm5iZiI6MTUxMzA2MDE5NS42NDksInN1YiI6IjVhMmY3NzYzOTI1MTQxMDMzMDE2NTg4OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.R-laDw07hbgfX8VrRB_sD2GXqDhvlgnsh07i0_DHXX8"
    
    func fetchData() {
        let moviesPublisher = fetchMovies()
        let tvShowsPublisher = fetchTVShows()
        
        Publishers.Zip(moviesPublisher, tvShowsPublisher)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { movies, tvShows in
                self.movies = movies
                self.tvShows = tvShows
            })
            .store(in: &cancellables)
    }

    
    
    private func fetchMovies() -> AnyPublisher<[Movie], Error> {
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie")!
        var request = URLRequest(url: url)
        request.addValue("Bearer \(AUTH_TOKEN)", forHTTPHeaderField: "Authorization")
        return URLSession.shared.dataTaskPublisher(for: request)
            .map {$0.data }
            .decode(type: MoviesResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .eraseToAnyPublisher()
    }
    
    private func fetchTVShows() -> AnyPublisher<[TVShow], Error> {
        let url = URL(string: "https://api.themoviedb.org/3/discover/tv")!
        var request = URLRequest(url: url)
        request.addValue("Bearer \(AUTH_TOKEN)", forHTTPHeaderField: "Authorization")
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: TVShowsResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .eraseToAnyPublisher()
    }
}
