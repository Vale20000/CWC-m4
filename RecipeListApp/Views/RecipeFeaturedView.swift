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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
