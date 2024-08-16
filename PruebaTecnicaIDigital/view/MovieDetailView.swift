//
//  MovieDetailView.swift
//  PruebaTecnicaIDigital
//
//  Created by Victor Marquez on 15/8/24.
//

import SwiftUI

struct MovieDetailView: View {
    var img: URL?
    var name: String
    var vote: Double
    var date: String
    var description: String
    var languague: String
    
    
    var body: some View {
        VStack{
            
            VStack(alignment: .center){
                AsyncImage(url: img){ phase in
                    phase
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 300)
                        .clipped()
                }placeholder: {
                    Rectangle()
                        .fill(Color.gray) 
                        .padding(.bottom, 5)
                        .frame(height: 240)
                }
                
                Text(name)
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .foregroundStyle(.black)
                    
            }
            
            VStack(alignment: .leading){
                Text("Reseña")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 16)
                .padding(.top, 10)
                
                Text(description)
                    .font(.caption)
                    .padding(.top, 2)
                    .padding(.horizontal, 16)
                    .fixedSize(horizontal: false, vertical: true)
            }
                
            aboutView
            
            Spacer()
        }
    }
    
    var aboutView: some View {
        HStack(spacing:20){
            Spacer()
            VStack(spacing:0){
                Image(systemName: "star.fill")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width:16, height: 16)
                
                Text("\(String(format: "%.2f",vote))")
            }
            Divider()
            VStack(spacing:0){
                
                Image(systemName: "calendar")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width:16, height: 16)
                
                Text("\(String(date.split(separator: "-")[0]))")
            }
            
            Divider()
            VStack(spacing:0){
                
                Image(systemName: "waveform")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width:16, height: 16)
                
                Text("\(languague.uppercased())")
            }
            
            Spacer()
        }
        .frame(height: 28)
        .padding(.top, 40)
    }
}

#Preview {
    MovieDetailView(
        img: URL(string:  "https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg") ?? nil,
        name: "Avengers: Infinity War",
        vote: 7.1,
        date: "2024-05-31", 
        description: "When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and Earth’s Mightiest Heroes are put to the ultimate test as the fate of the planet hangs in the balance. As the villainous Ultron emerges, it is up to The Avengers to stop him from enacting his terrible plans, and soon uneasy alliances and unexpected action pave the way for an epic and unique global adventure.",
        languague: "fr"
    )
}
