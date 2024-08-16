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
    var urlImg:    URL?
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url:urlImg!){ phase in
                phase
                    .resizable()
                    .scaledToFill()
                    .frame(height: 240)
                    .clipped()
            }placeholder: {
                Rectangle()
                    .fill(Color.gray)
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
        .cornerRadius(8)
    }
}

#Preview {
    MovieCard(
        date: "2018-04-25",
        name: "Avengers: Infinity War",
        urlImg: URL(string:  "https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg") ?? nil
    )
}
