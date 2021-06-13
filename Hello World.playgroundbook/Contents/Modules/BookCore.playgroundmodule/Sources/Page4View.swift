//
//  Page4View.swift
//  PlaygroundBook
//
//  Created by 薛竣祐 on 2021/4/18.
//

import SwiftUI
import UIKit
import SpriteKit
import ARKit
import PlaygroundSupport
let ans4 = "👍👍🏻👍🏼👍🏽👍🏾👍🏿"
public struct Page4View: View {
    @State var thumbsUp:String
    @State var clear:Int = 0
    @State var opacity:Double = 0
    public var body: some View {
        return GeometryReader{geometry in
            ZStack{
                ARViewIndicator4(clear:$clear)
                VStack{
                    //from zh.pngtree.com
                    Image(uiImage: (UIImage(named: "rainbow.png")!))
                        .resizable()
                        .frame(idealHeight:geometry.size.height / 2.5,alignment: .center)
                        .scaledToFit()
                        .padding(.top,30)
                        .opacity(opacity)
                        .animation(
                            Animation
                                .easeInOut(duration: 1)
                                .repeatForever(autoreverses: true)
                        )
                    HStack{
                        VStack{
                            Spacer()
                            MyButton(action: {
                                clear += 1
                            }, label: "Reset AR")
                        }.frame(maxWidth: .infinity).padding(.bottom)
                        VStack{
                            Spacer()
                            MyButton(action: {
                                var correct = false
                                for i in ans4{
                                    correct = correct || thumbsUp.contains(i)
                                }
                                if correct{
                                    opacity = 1.0
                                    PlaygroundPage.current.assessmentStatus = .pass(message: "Great! You just thumbs up to Cook!\n [Next Page](@next)")
            //                        PlaygroundPage.current.navigateTo(page: .next)
                                }else{
                                    thumbsUp = "Try Hint->"
                                    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Type '👍🏼' or other same shape emoji in editable area."], solution: "var  character:String  =  \"👍🏼\"")
                                }
                            }, label: thumbsUp)
                        }.frame(maxWidth: .infinity).padding(.bottom)
                        VStack{}.frame(maxWidth: .infinity).padding(.bottom)
                    }
                }
            }
        }
    }
}

struct ARViewIndicator4: UIViewControllerRepresentable {
//    @Binding var is_acting:Bool
    @Binding var clear:Int
    typealias UIViewControllerType = ARView4
   
   func makeUIViewController(context: Context) -> ARView4 {
        let view = ARView4()
//        view.is_acting = is_acting
        view.clear = clear
        return view
   }
   func updateUIViewController(_ uiViewController:ARViewIndicator4.UIViewControllerType, context:UIViewControllerRepresentableContext<ARViewIndicator4>) {
    
//        if is_acting{
//            let node = uiViewController.sceneView.node(for:uiViewController.firstAnchor)
////            node?.run(SKAction.repeatForever(changeTexturesAction4))
//            uiViewController.is_acting = is_acting
//        }
        if(uiViewController.clear != clear){
            if let anchor = uiViewController.firstAnchor {
                uiViewController.sceneView.session.remove(anchor: anchor)
            }
            uiViewController.firstAnchor = nil
            uiViewController.clear = clear
        }
        
   }
}

class ARView4 : UIViewController, ARSKViewDelegate, ARSessionDelegate{
    
//    var is_acting:Bool = false
    var clear:Int!
    var sceneView: ARSKView!
    var firstAnchor: ARAnchor!
    override func loadView() {
        sceneView = ARSKView(frame:CGRect(x: 0.0, y: 0.0, width: 500.0, height: 600.0))
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
//        sceneView.showsFPS = true
//        sceneView.showsNodeCount = true
        
        // Load the SKScene from 'Scene.sks'
        sceneView.presentScene(SKScene(size: CGSize(width: 700, height: 800)))
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        // Playground note: You can't use the audio capture capabilities
        // of an ARSession with a Swift Playground.
        // config.providesAudioData = true
        
        // Now we'll get messages when planes were detected...
        sceneView.session.delegate = self
        
        self.view = sceneView
        sceneView.session.run(config)
    }
    // MARK: - ARSKViewDelegate
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        if(firstAnchor != nil){
            //old anchor
            sceneView.session.remove(anchor: firstAnchor)
        }
        //new anchor
        firstAnchor = anchor
        let spriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "TimCook"))
//        if is_acting{
//            spriteNode.run(SKAction.repeatForever(changeTexturesAction4))
//        }
        spriteNode.anchorPoint = CGPoint(x: 0.5, y: 0.35)
        return spriteNode;
    }
}


