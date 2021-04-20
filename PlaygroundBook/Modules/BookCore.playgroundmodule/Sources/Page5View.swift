//
//  Page5View.swift
//  PlaygroundBook
//
//  Created by 薛竣祐 on 2021/4/18.
//
import SwiftUI
import PlaygroundSupport
public struct MyText:View{
    @State var label:String!
    public var body:some View{
        Text(label)
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .lineSpacing(10)
            .rotation3DEffect(
                .degrees(20),
                axis: (x: 1.0, y: 0.0, z: 0.0)
                )
            .shadow(color: .gray, radius: 2, x: 0, y: 15)
    }
}
public struct Page5View:View{
    
    public var body : some View{
        return GeometryReader{geometry in
            ZStack{
                Color.black
                MyText(label: "Congratulations! You finish all pages!\nWish you have learned how to make friend with everyone.\nShare your love, and let's make this world more friendly together!\n❤️🧡💛💚💙💜🖤🤍🤎\n\nThank you for playing\n\n\n“It is not our differences that divide us.\nIt is our inability to recognize, accept, and celebrate those differences.”\n\t\t\t\t\t\t\t\t\t\t– Audre Lorde")
                    .padding(.horizontal,80)
                    .padding(.bottom,40)
                    .frame(
                        maxWidth:geometry.size.width-30,
                        maxHeight: geometry.size.height-30)
            }
            .border(Color.gray,width:20)
            .onAppear(perform: {
                PlaygroundPage.current.assessmentStatus = .pass(message: "END?")
            })
        }
    }
}
