/*:
 # Wellcome to Hello World!
 My name is CHUN-YU,HSUEH from Taiwan. And this is my First PlaygroundBook. There are lots of lifes on Earth, and I think we should be **KIND** and **FRIENDLY** to **EVERYTHING** ! No matter what Species, Color, Country, Gender, Status, Jobs... So I decided to make this PlaygroundBook. Let's learn how to **HELLO** to the **World**.
 
 - - -
 # How To Play?
 Every pages have **SOMETHING** hello to you after you run the code and find a surface. You need to hello back the way you just saw.
 1. Run the code and see who hello to you.(If AR scene go crazy, you can use Reset button!)
 2. Text the **Emoji** you want to hello back in the editable area!
 3. Rerun the code and use hello button on the screen after character show up!
 - - -
 # Tips
 1. Landscape screen will be better.
 2. Enlarge the game screen if you need.
 3. If you put and use the wrang answer, it will pop out tips at the buttom right corner.
 4. All pages' answer are a single emoji.
 5. Different color of emoji is ok.
 */

var character:String = /*#-editable-code Type Emoji 'Wave Hand' Here*/""/*#-end-editable-code*/
//#-hidden-code
import BookCore
import PlaygroundSupport
import SwiftUI
if character == "" {
    character = "Emoji Show Here"
}
let viewController = UIHostingController(rootView: getPage1View(s:character))
PlaygroundPage.current.liveView = viewController
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code
