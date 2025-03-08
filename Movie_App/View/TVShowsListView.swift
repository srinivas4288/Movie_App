//
//  TVShowsListView.swift
//  Srinivas_Muppera_Assignment
//
//  Created by Srinivas Muppera on 07/03/25.
//


import SwiftUI

struct TVShowsListView: View {
    
    let tvShows: [TVShow]
    
    @Binding var showAlert: Bool
    @Binding var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            if tvShows.isEmpty {
                VStack {
                    Text("No tvShows Available")
                        .font(.title)
                        .foregroundColor(.gray)
                    Image(systemName: "film")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
            } else  {
                ScrollView {
                    
                    LazyVGrid(columns: Array (repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                        ForEach(tvShows) { tvShow in
                            NavigationLink(destination: TVShowDetailView(tvShow: tvShow)) {
                                TVShowItemView(tvShow: tvShow)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("TV Shows")
                .background(Color(.black))
            }
        }
    }
}



struct TVShowItemView: View {
    let tvShow: TVShow
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(tvShow.posterPath ?? "")")) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(height: 150)
            .cornerRadius(12)
            .shadow(radius: 4)
            
            Text(tvShow.name)
                .font(.headline)
                .lineLimit(1)
                .padding(.top, 5)
                .foregroundColor(.white)
            
            Text("Rating: \(tvShow.voteAverage, specifier: "%.1f")")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    ContentView()
}
