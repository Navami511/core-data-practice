//
//  ContentView.swift
//  Core Data Practice
//
//  Created by Navami Ajay on 31/10/23.
// this program doen not use the mvvm model

import SwiftUI

struct ContentView: View {
    @State var movieTitle: String = ""
    @State private var movies: [Movie] = [Movie]() // not a good method to use @state to pass value from third party. it is completely meant to be used for the ui
    let coreDM: CoreDataManager
    private func populateMovies(){
        movies = coreDM.getAllMovies()
    }
    
//    @FetchRequest(entity: Movie.entity(),
//                   sortDescriptors: [NSSortDescriptor(keyPath: \Movie.title, ascending: true)]
//       ) var items: FetchedResults<Movie>
    
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("enter title", text: $movieTitle)
                    .textFieldStyle(.roundedBorder)
                Button("SAVE"){
                    coreDM.saveMovie(title: movieTitle)
                    populateMovies()
                }
                List{
                    ForEach(movies, id:\.self) { movie in
                        Text(movie.title ?? "no entry!!!")
                    }.onDelete(perform: { indexSet in
                        indexSet.forEach{ index in
                            let movie = movies[index]
                            coreDM.deleteMovie(movie: movie)
                            populateMovies()
                        }
                    })
                }
//                List(movies, id: \.self) { movie in
//                    Text(movie.title ?? "no entry!!")
//                }
                
                
                Spacer()
            }
            .padding()
        }.navigationTitle("MOVIES")
//            .onAppear(perform: {
//               populateMovies()
//                
//            })
    }
}

#Preview {
    ContentView( coreDM: CoreDataManager())
}
