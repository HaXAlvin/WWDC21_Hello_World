//
//  TestBuild.swift
//  BookCore
//
//  Created by 薛竣祐 on 2021/4/12.
//

import SwiftUI

struct TestBuild: View {
    var body: some View {
        return ZStack{
            Color(.purple)
            VStack{
                Spacer()
                Text("Hello, World!")
                    .padding()
            }
        }
    }
}

struct TestBuild_Previews: PreviewProvider {
    static var previews: some View {
        TestBuild()
    }
}
