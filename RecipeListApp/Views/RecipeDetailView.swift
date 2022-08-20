//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Valentino Masetti on 16/08/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + item.name)
                            .padding(.bottom, 0.5)
                    }
                }.padding(.horizontal, 5)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(0...recipe.directions.count-1, id: \.self) { i in
                        Text("\(i+1). " + recipe.directions[i])
                            .padding(.bottom, 5)
                    }
                }.padding(.horizontal, 5)
            }
        }.navigationTitle(recipe.name)
            
            
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
