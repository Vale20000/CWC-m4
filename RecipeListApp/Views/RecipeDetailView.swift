//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Valentino Masetti on 16/08/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.vertical, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding([.leading, .bottom, .trailing])
                
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased() + ";")
                            .padding(.bottom, 0.5)
                    }
                }.padding(.horizontal, 5)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions:")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(0...recipe.directions.count-1, id: \.self) { i in
                        Text("\(i+1). " + recipe.directions[i] )
                            .padding(.bottom, 5)
                    }
                }.padding(.horizontal, 5)
            }
        }
            
            
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
