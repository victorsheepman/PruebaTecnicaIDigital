//
//  MovieListView.swift
//  PruebaTecnicaIDigital
//
//  Created by Victor Marquez on 15/8/24.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var moviesViewModel = MovieListViewModel()
    
      let gridLayout = [
          GridItem(.flexible()),
          GridItem(.flexible())
      ]
    var body: some View {
        NavigationView {
             ScrollView {
                 LazyVGrid(columns: gridLayout, spacing: 20){
                     ForEach(moviesViewModel.movies, id:\.id){  movie in
                         NavigationLink(destination: MovieDetailView(
                            img: movie.poster,
                            name: movie.title ?? "",
                            vote: movie.voteAverage ?? 0.0,
                            date: movie.releaseDate ?? "", 
                            description: movie.overview ?? "",
                            languague: movie.originalLanguage ?? ""
                         )
                         ) {
                             MovieCard(
                                 date: movie.releaseDate ?? "",
                                 name: movie.title ?? "",
                                 img: movie.poster ?? nil)
                         }
                     
                                    
                                }
                            }
                            .padding(.top,9)
                            .background(.white)
                            .padding(.bottom, 65)
                            .onAppear{
                                moviesViewModel.fetchMovies()
                               
                             }
             }
             .padding(.top, 19)
             .navigationTitle("Avengers movies")
             .background(Color("Gray7"))
         }
     }
    
           
    
}


#Preview {
    MovieListView()
}
