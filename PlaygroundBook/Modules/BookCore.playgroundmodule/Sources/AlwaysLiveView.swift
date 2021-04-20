//
//  AlwaysLiveView.swift
//  PlaygroundBook
//
//  Created by 薛竣祐 on 2021/4/14.
//

import SwiftUI

public struct AlwaysLiveView: View {
    public var body: some View {
        ZStack{
            Color(.black)
            Image(uiImage: UIImage(named:"me.png")!)
                .resizable()
                .scaledToFit()
        }
    }
}

