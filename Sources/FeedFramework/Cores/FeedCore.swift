//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/30/22.
//

import Foundation
import ComposableArchitecture

public struct FeedState: Equatable {
    public var name: String
    public var description: String
    public var showProfile: Bool
    public var longPress: Bool
    
    public init (
        name: String = "Matthew Garlington",
        description: String = "This is a desciption to showcase the post ability in echo, I hope you like it!",
        showProfile: Bool = false,
        longPress: Bool = false
    ) {
        self.name = name
        self.description = description
        self.showProfile  = showProfile
        self.longPress = longPress
    }
}

public enum FeedAction: Equatable {
    case didShow
    case longPress
}

public typealias FeedEnviroment = NetworkRequestAction<Nothing, NetworkError>



public let feedReducer = Reducer<FeedState, FeedAction, FeedEnviroment> { state, action, env in
    
    switch action {
    case .didShow:
        state.showProfile.toggle()
        return .none
    
    case .longPress:
        state.longPress.toggle()
        return .none
    }
    
}
