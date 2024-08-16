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
                Rectangle()
                    .fill(Color.gray) 
                    .padding(.bottom, 5)
                    .frame(height: 240)
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
    }
}

#Preview {
    MovieCard(
        date: "2018-04-25",
        name: "Avengers: Infinity War",
        img: URL(string:  "https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg") ?? nil
    )
}
