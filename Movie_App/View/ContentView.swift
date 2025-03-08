// MoviesAndTVShowsApp.swift

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var viewModel = MoviesAndTVShowsViewModel()
    
    var body: some View {
        NavigationView {
            TabView {
                MoviesListView(
                    movies: viewModel.movies,
                    showAlert: $viewModel.showMovieAlert,
                    errorMessage: $viewModel.movieErrorMessage
                )
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
                
                TVShowsListView(
                    tvShows: viewModel.tvShows,
                    showAlert: $viewModel.showTVShowAlert,
                    errorMessage: $viewModel.tvShowErrorMessage
                )
                .tabItem {
                    Label("TV Shows", systemImage: "tv")
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}



#Preview {
    ContentView()
}
