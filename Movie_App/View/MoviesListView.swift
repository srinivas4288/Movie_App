//
//  ListView.swift
//  Srinivas_Muppera_Assignment
//
//  Created by Srinivas Muppera on 04/03/25.
//


import SwiftUI
import Combine


struct MoviesListView: View {
    let movies: [Movie]
    
    @Binding var showAlert: Bool
    @Binding var errorMessage: String?
    
    var body: some View {
        
        NavigationStack {
            if movies.isEmpty {
                VStack {
                    Text("No Movies Available")
                        .font(.title)
                        .foregroundColor(.gray)
                    Image(systemName: "film")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
            } else  {
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 16), count: 3),spacing: 16) {
                        ForEach(movies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieItemView(movie: movie)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationTitle("Movies")
                .background(Color(.black))
                
            }
        }
    }
}


// MARK: - MovieItemView
struct MovieItemView: View {
    let movie: Movie
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(height: 150)
            .cornerRadius(12)
            .shadow(radius: 4)
            
            
            Text(movie.title)
                .font(.headline)
                .lineLimit(1)
                .padding(.top, 5)
                .foregroundColor(.white)
                .background(Color(.black))
            Text("Rating: \(movie.voteAverage, specifier: "%.1f")")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}


#Preview {
    ContentView()
}
