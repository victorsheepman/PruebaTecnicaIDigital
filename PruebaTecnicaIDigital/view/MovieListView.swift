//
//  MovieListView.swift
//  PruebaTecnicaIDigital
//
//  Created by Victor Marquez on 15/8/24.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var moviesViewModel = MovieListViewModel()
    
    @State private var isPresenter: Bool = false
    @State private var selectedMovie: MovieDataModel?

    let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 20){
                    ForEach(moviesViewModel.movies, id:\.id){  movie in
                        MovieCard(
                            date:   movie.releaseDate ?? "",
                            name:   movie.title ?? "",
                            urlImg: movie.poster ?? nil
                        )
                        .onTapGesture {
                            
                            selectedMovie = movie
                            isPresenter = true
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
             .navigationTitle(Constansts.Title.main)
             .sheet(
                isPresented: $isPresenter,
                onDismiss: { isPresenter = false })
            {
                if let movie = selectedMovie {
                    
                    VStack {
                        Text(movie.title ?? "")
                            .font(.largeTitle)
                            .fontWeight(.regular)
                            .foregroundStyle(.black)
                        VStack(alignment: .leading){
                            Text("Reseña")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                                .padding(.horizontal, 16)
                                .padding(.top, 10)
                            
                            Text(movie.overview ?? "")
                                .font(.callout)
                                .padding(.top, 2)
                                .padding(.horizontal, 16)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        HStack(spacing: 20) {
                            Spacer()
                            VStack(spacing: 0) {
                                Image(systemName: "star.fill")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text("\(String(format: "%.2f",movie.voteAverage ?? 0.0))")
                            }
                            Divider()
                            VStack(spacing: 0) {
                                Image(systemName: "calendar")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text("\(String(movie.releaseDate?.split(separator: "-")[0] ?? ""))")
                            }
                            Divider()
                            VStack(spacing: 0) {
                                Image(systemName: "waveform")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text("\(movie.originalLanguage?.uppercased() ?? "")")
                            }
                            Spacer()
                        }
                        .frame(height: 28)
                        .padding(.top, 40)
                        
                    }
                    .padding()
                } else {
                    Text("No movie selected")
                }
            }
        }
    }
}





#Preview {
    MovieListView()
}
