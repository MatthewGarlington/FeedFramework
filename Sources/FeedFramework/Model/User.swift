//
//  User.swift
//  FeedFrameworkTestHarness
//
//  Created by Matthew Garlington on 5/30/22.
//

import Foundation


public struct Post: Identifiable {
    public var id = UUID().uuidString
    public var name: String
    public var post: String
    public var profilePic: String
}

