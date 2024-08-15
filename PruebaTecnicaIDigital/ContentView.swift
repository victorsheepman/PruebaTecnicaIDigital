//
//  ContentView.swift
//  PruebaTecnicaIDigital
//
//  Created by Victor Marquez on 15/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var movieListViewModel = MovieListViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear{
                    
            movieListViewModel.fetchMovies()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
