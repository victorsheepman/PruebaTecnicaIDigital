//
//  MovieCardView.swift
//  PruebaTecnicaIDigital
//
//  Created by Victor Marquez on 15/8/24.
//

import SwiftUI

struct MovieCard: View {
    var date:   String
    var name:   String
    var img:    URL?
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url:img!){ phase in
                phase
                    .resizable()
                   
                    .scaledToFill()
                    .frame(height: 240)
                    .clipped()
            }placeholder: {
                Image("image")
                    .resizable()
                    .padding(.bottom, 5)
                    .scaledToFill()
                    .frame(height: 240)
                    .clipped()
            }
            
          
            Text(name)
        
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding([.horizontal])
            
            
            Text(date.split(separator: "-")[0])
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding([.leading])

                
            Spacer()

        }
        .frame(width: 178, height: 300)

        .background(Color(.systemBackground))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color("Gray3"), lineWidth: 1)
        )
        
    }
}

#Preview {
    MovieCard(
        date: "2018-04-25",
        name: "Avengers: Infinity War",
        img: URL(string:  "https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg") ?? nil
    )
}
