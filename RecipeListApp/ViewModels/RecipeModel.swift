//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Valentino Masetti on 13/08/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Parsed the local json file (services)
        self.recipes = DataService.getLocalData() // Con DataService() faccio un'instanza on-the-fly
        
        // Set the recipes property
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var denom:Int
        var num: Int
        
        // Get a single serving by multiplying denominator by the recipe servings
        if ingredient.num != nil && ingredient.denom != nil {
            denom = ingredient.denom! * recipeServings
            num = ingredient.num! * targetServings
            
            if let unit = ingredient.unit {
                return stringFromFraction(num: num, denom: denom, unit: unit)
            } else {
                return stringFromFraction(num: num, denom: denom)
            }
            
        } else if ingredient.num != nil {
            denom = 1 * recipeServings
            num = ingredient.num! * targetServings
            
            if let unit = ingredient.unit {
                return stringFromFraction(num: num, denom: denom, unit: unit)
            } else {
                return stringFromFraction(num: num, denom: denom)
            }
            
        } else {return "To taste"}

        
    }
    
    private static func stringFromFraction(num:Int, denom: Int, unit: String? = nil) -> String {
        var numUnits = 0
        var myNum = num
        var myDenom = denom
        
        if myDenom < 1 || num < 1 {
            return "Not valid"
        }
        
        if (num % myDenom == 0) {
            if unit != nil {
                if (num / myDenom > 1) {
                    return String(num/myDenom) + " " + getPluralUnit(unit: unit!)
                } else {
                    return String(num/myDenom) + " " + unit!
                }
            } else {
                return String(num/myDenom)
            }
            
        }
        
        while myNum > myDenom && myDenom != 1 {
            myNum -= myDenom
            numUnits += 1
        }
        
        // Reduce fraction by greatest common divisor
        let gcd = getGcd(myNum, myDenom)
        if gcd > 1 {
            myNum /= gcd
            myDenom /= gcd
        }
        
        if unit != nil {
            if numUnits == 0 {
                return "\(myNum)/\(myDenom) \(unit!)"
            } else {
                if numUnits > 1 {
                    return "\(numUnits) \(myNum)/\(myDenom) \(getPluralUnit(unit: unit!))"
                } else {
                    return "\(numUnits) \(myNum)/\(myDenom) \(unit!)"
                }
            }
        } else {
            if numUnits == 0 {
                return "\(myNum)/\(myDenom)"
            } else {
                if numUnits > 1 {
                    return "\(numUnits) \(myNum)/\(myDenom)"
                } else {
                    return "\(numUnits) \(myNum)/\(myDenom)"
                }
            }
        }
    }
    
    private static func getGcd(_ a: Int,_ b: Int) -> Int {
        var gcd = 1
        let minValue = (a<b ? a:b)
        if minValue == 1 {
            return gcd
        } else if (minValue < 1) {
            return 0
        }
        for i in 2...minValue {
            if (a % i == 0) && (b % i == 0) {
                gcd = i
            }
        }
        return gcd
    }
    
    private static func getPluralUnit(unit: String) -> String {
        var unit1 = unit
        if unit1.suffix(2) == "ch" {
            unit1 += "es"
        } else if unit.suffix(1) == "f"{
            unit1 = String(unit1.dropLast())
            unit1 += "ves"
        } else {
            unit1 += "s"
        }
        return unit1
    }
    
}
