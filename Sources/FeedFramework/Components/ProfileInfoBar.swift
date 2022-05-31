//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/30/22.
//

import SwiftUI

struct ProfileInfoBarView: View {
    @State private var isLikesPressed = false
    @State private var isPostsPressed = false
    var body: some View {
        HStack {
            HStack {
                Spacer()
                ZStack {
                    Button {
                        withAnimation {
                            isLikesPressed = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                isLikesPressed = false
                            }
                        }
                    } label: {
                        ProfileInfoButtonLabel(title: "Likes")
                    }
                    NotificationBadge(number: 12, isPressed: $isLikesPressed)
                }
                .buttonStyle(LongPrimitiveButtonStyle(minDuration: 0.2, pressedColor: .red.opacity(0.4)))
                Spacer()
                HStack {
                    ZStack {
                        Button {
                            withAnimation {
                                isPostsPressed = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    isPostsPressed = false
                                }
                            }
                        } label: {
                            ProfileInfoButtonLabel(title: "Posts")
                        }
                        Spacer()
                        NotificationBadge(number: 120, isPressed: $isPostsPressed)
                    }
                }
                .buttonStyle(LongPrimitiveButtonStyle(minDuration: 0.2, pressedColor: .red.opacity(0.4)))
                Spacer()
                    Button {
                        //
                    } label: {
                        ProfileInfoButtonLabel(title: "Comments")
                    }
                    .buttonStyle(LongPrimitiveButtonStyle(minDuration: 0.2, pressedColor: .red.opacity(0.4)))
                Spacer()
                
                EditButton()
                Spacer()
            }
        }
    }
}

struct ProfileInfoBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoBarView()
    }
}

