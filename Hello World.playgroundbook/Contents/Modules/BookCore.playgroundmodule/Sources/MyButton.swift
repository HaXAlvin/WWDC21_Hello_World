//
//  MyButton.swift
//  PlaygroundBook
//
//  Created by 薛竣祐 on 2021/4/18.
//

import SwiftUI

public struct MyButton:View{
    @State var action:()->Void
    @State var label:String
    public var body : some View{
        Button(action: action){
            Text(label)
                .font(.system(size: 20))
                .padding(7)
                .background(
                    LinearGradient(
                        gradient:
                            Gradient(
                                colors: [
                                    Color(red: 1.0, green: 0.07, blue: 0.57),
                                    .purple]
                            ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .opacity(0.8)
                .foregroundColor(Color.white)
                .cornerRadius(14)
        }.lineLimit(2)
    }
}
