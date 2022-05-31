//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/30/22.
//


import SwiftUI


// Extending View to get Bounds....
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
