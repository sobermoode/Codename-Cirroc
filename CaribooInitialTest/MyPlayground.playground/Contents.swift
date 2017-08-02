//: Playground - noun: a place where people can play

import PlaygroundSupport
import SpriteKit

/*protocol ButtonPress {
    func buttonPress(_ buttonNode: ButtonNode)
}

class ButtonNode: SKNode {
    
    override init() {
        super.init()
    }
    
    convenience init(withLabel label: String) {
        self.init()
        
        zPosition = 5
        
        let newLabel = SKLabelNode(fontNamed: "Avenir")
        newLabel.alpha = 1
        newLabel.fontSize = 36
        newLabel.text = label
        newLabel.zPosition = 6
        
        addChild(newLabel)
    }
    
    convenience init(withSprite sprite: String) {
        self.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ButtonNode {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPress(self)
    }
}

extension ButtonNode: ButtonPress {
    func buttonPress(_ buttonNode: ButtonNode) {
        print("HI!!!")
    }
}*/

let view = SKView(frame: CGRect(x: 150, y: 150, width: 1024, height: 768))
let scene = SKScene(size: CGSize(width: 1024, height: 768))
scene.backgroundColor = .yellow
//scene.scaleMode = .aspectFit
view.presentScene(scene)

PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true

//let startButton = ButtonNode(withLabel: "Start!!!")
let blues = SKSpriteNode(texture: nil, color: .blue, size: CGSize(width: 150, height: 150))
blues.alpha = 1
blues.zPosition = 10
scene.addChild(blues)

//view.presentScene(scene)
//scene.children
//PlaygroundPage.current.finishExecution()
