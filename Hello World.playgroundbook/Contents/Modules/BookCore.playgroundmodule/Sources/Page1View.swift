//
//  Page1View.swift
//  PlaygroundBook
//
//  Created by 薛竣祐 on 2021/4/12.
//

import SwiftUI
import UIKit
import SpriteKit
import ARKit
import PlaygroundSupport
let animateTexture1:[SKTexture] = [
    SKTexture(imageNamed:"page1_1.png"),
    SKTexture(imageNamed:"page1_2.png"),
    SKTexture(imageNamed:"page1_3.png"),
    SKTexture(imageNamed:"page1_2.png"),
]
let changeTexturesAction1 = SKAction.animate(with:animateTexture1, timePerFrame: 0.15)
let ans1 = "👋👋🏻👋🏼👋🏽👋🏾👋🏿"
public struct Page1View: View {
    @State var is_acting = false
    @State var wave:String
    @State var clear:Int = 0
    public var body: some View {
        return GeometryReader{geometry in
            ZStack{
                ARViewIndicator1(is_acting:$is_acting,clear:$clear)
                
                HStack{
                    VStack{
                        Spacer()
                        MyButton(action: {
                            clear+=1
                        }, label: "Reset AR")
                    }.frame(maxWidth: .infinity).padding(.bottom)
                    VStack{
                        Spacer()
                        MyButton(action: {
                            for i in ans1{
                                is_acting = is_acting || wave.contains(i) 
                            }
                            if is_acting{
                                PlaygroundPage.current.assessmentStatus = .pass(message: "Great! You just wave hand with him!\n [Next Page](@next)")
        //                        PlaygroundPage.current.navigateTo(page: .next)
                                
                            }else{
                                wave = "Try Hint->"
                                PlaygroundPage.current.assessmentStatus = .fail(hints: ["Type '👋🏾' or other same shape emoji in editable area."], solution: "var  character:String  =  \"👋🏾\"")
                            }
                        }, label: wave)
                    }.frame(maxWidth: .infinity).padding(.bottom)
                    VStack{}.frame(maxWidth: .infinity).padding(.bottom)
                }
            }
        }
    }
}

struct ARViewIndicator1: UIViewControllerRepresentable {
    @Binding var is_acting:Bool
    @Binding var clear:Int
    typealias UIViewControllerType = ARView1
   
   func makeUIViewController(context: Context) -> ARView1 {
    let view = ARView1()
        view.is_acting = is_acting
        view.clear = clear
        return view
   }
   func updateUIViewController(_ uiViewController:ARViewIndicator1.UIViewControllerType, context:UIViewControllerRepresentableContext<ARViewIndicator1>) {
        if is_acting{
            if let anchor:ARAnchor = uiViewController.firstAnchor  {
                let node:SKNode = uiViewController.sceneView.node(for:anchor)!
                node.run(SKAction.repeatForever(changeTexturesAction1))
                uiViewController.is_acting = is_acting
            }
        }
        if(uiViewController.clear != clear){
            if let anchor = uiViewController.firstAnchor {
                uiViewController.sceneView.session.remove(anchor: anchor)
            }
            uiViewController.firstAnchor = nil
            uiViewController.clear = clear
        }
        
   }
}

class ARView1 : UIViewController, ARSKViewDelegate, ARSessionDelegate{
    
    var is_acting:Bool = false
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
        let spriteNode = SKSpriteNode(texture: animateTexture1[0])
        if is_acting{
            spriteNode.run(SKAction.repeatForever(changeTexturesAction1))
        }
        spriteNode.anchorPoint = CGPoint(x: 0.5, y: 0.35)
        return spriteNode;
    }
}
