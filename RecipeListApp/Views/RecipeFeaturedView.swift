//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Valentino Masetti on 20/08/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    // We cannot create an other instance of RecipeModel because if the user modifies the recipes or anything else, this data would not be syncronized with that changes
    // We don't wanna manage two sets of data
    // To get around to this problem, we have to use the enviromental object. So we have to create the instance of RecipeModel in the RecipeTabView (that is the Parent view that contains all the views, featured and RecipeListView)
    // MARK: Enviromental object modifier: we have to add a property for that recipe model and it will automatically be populated with the instance that you have created in the parent
    // We could also create an instance of RecipeModel directly in the main struct (RecipeListApp)
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView {
                    
                    // Loop through each recipe
                    ForEach (0..<model.recipes.count) { index in
                        
                        // Only show those that should be featured
                        if model.recipes[index].featured {
                            
                            // Recipe card button
                            Button {
                                
                                // In questo modo la detail view (sheet()) viene mostrata
                                // Show the recipe detail sheet
                                self.isDetailViewShowing = true
                                
                            } label: {
                                // Recipe card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            }   .sheet(isPresented: $isDetailViewShowing, content: { // Se il parametro è true, il content viene eseguito, altrimenti no. In questo caso il content è il fatto di mostrare i dettagli della ricetta.
                                // Show the Recipe Detail View
                                RecipeDetailView(recipe: model.recipes[index])
                            })
                                .buttonStyle(PlainButtonStyle()) // Per il testo black
                                .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5) // -5 alla x e +5 alla y dell'ombra

                            
                            
                        }
                        
                    }
                    
                    // Serve a impostare la tab view come swipable e con .automatic dico che voglio visualizzare i puntini dell'indice solo quando c'è più di una ricetta
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Now dots have a background
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearthy")
            }.padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
