//
//  MovieDetailView.swift
//  Srinivas_Muppera_Assignment
//
//  Created by Srinivas Muppera on 07/03/25.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(spacing: 20){
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(maxWidth: 200, maxHeight: 300)
                    .padding()
                    .background(Color.black)
                    .ignoresSafeArea()
                    .cornerRadius(20)
                    
                    Text(movie.title)
                        .lineLimit(nil)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Text(movie.overview)
                        .font(.body)
                        .padding()
                    Text("Rating: \(movie.voteAverage, specifier: "%.1f")")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color(.lightGray))
                .cornerRadius(20)
                .ignoresSafeArea()
            }
        }
    }
}

struct TVShowDetailView: View {
    let tvShow: TVShow
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(tvShow.posterPath ?? "")")) { image in
                    image.resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    Color.gray
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .ignoresSafeArea()
                .cornerRadius(20)
                
                Text(tvShow.name)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Text(tvShow.overview)
                    .font(.body)
                    .padding()
                Text("Rating: \(tvShow.voteAverage, specifier: "%.1f")")
                
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
            }
        }
        .padding()
        .background(Color(.lightGray))
    }
}

#Preview {
    ContentView()
}

