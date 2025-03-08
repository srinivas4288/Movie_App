
# WatchMovie_App

The Movies & TV Shows App is a SwiftUI-based iOS application that fetches and displays a curated list of movies and TV shows using API. The app is built using the MVVM (Model-View-ViewModel) architecture, leveraging Combine for asynchronous data fetching.

**Features:**

Display a list of Movies and TV Shows with their poster, title, and rating.
Separate tabs for Movies and TV Shows.
Graceful handling of loading and error states using AsyncImage and ProgressView.
Responsive grid layout with adaptive sizing using LazyVGrid.

**Architecture**

The app is designed using the MVVM pattern to maintain a clear separation between the UI and business logic.

**Model Layer**

Movie.swift: Defines the Movie struct conforming to Codable and Identifiable. 

TVShow.swift: Defines the TVShow struct with similar properties of Movie .

**ViewModel Layer**

MoviesAndTVShowsViewModel.swift: Handles fetching data from the API using Combine, and publishes the data to the views using @Published.

**View Layer**

ContentView.swift: Entry point of the app with a TabView for Movies and TV Shows.

MoviesListView.swift: Displays the list of movies using a grid layout.

TVShowsListView.swift: Similar to MoviesListView, but for TV shows.

PosterCardView.swift: A reusable view for displaying the movie/TV show poster and information.
