//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Valentino Masetti on 13/08/22.
//

import SwiftUI

struct RecipeListView: View {
    
    // Automatically catches the data in the Parent View
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                
                ScrollView {
                    // The Lazy VStack is a VStack that creates items ONLY as needed
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink {
                                // Destination
                                RecipeDetailView(recipe: r)
                            } label: {
                                // MARK: Row Item
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(r.name)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            
                            
                        }
                    }
                }
            }.navigationBarHidden(true)
                .padding(.leading)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .previewDevice("iPhone 13 Pro")
            .environmentObject(RecipeModel())
    }
}
