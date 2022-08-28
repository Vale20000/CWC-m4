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
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 25))
                
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
                                    VStack(alignment: .leading) {
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlights(highlights: r.highlights)
                                            .foregroundColor(.black)
                                    }
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
