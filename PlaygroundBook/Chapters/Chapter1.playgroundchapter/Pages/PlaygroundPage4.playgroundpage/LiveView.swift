import UIKit
import PlaygroundSupport
import SwiftUI
import BookCore


let viewController = UIHostingController(rootView: getLiveView())
//let viewController = UIHostingController(rootView: AlwaysLiveView())
PlaygroundPage.current.liveView = viewController
PlaygroundPage.current.needsIndefiniteExecution = true
