//
//  BoardView.swift
//  Snake
//
//  Created by Evan Rinehart on 12/13/24.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    let sprite = SKSpriteNode(imageNamed: "image")
    
    override func didMove(to view: SKView) {
        backgroundColor = .blue
        
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        sprite.size = CGSize(width: 100, height: 100)
        addChild(sprite)
        
        // Add an action (e.g., rotation)
        /*let rotateAction = SKAction.rotate(byAngle: .pi, duration: 1)
        let repeatAction = SKAction.repeatForever(rotateAction)
        sprite.run(repeatAction)*/
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    //TODO: Put in actual logic here for handling touches.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the first touch
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            // Move the sprite to the touch location
            sprite.position = location
            print("Moved sprite to:", sprite.position)
        }
    }
}

struct BoardView: View {
    var scene: SKScene {
        let scene = GameScene(size: CGSize(width: 300, height: 500))
        scene.scaleMode = .aspectFit
        return scene
    }
    
    var body: some View {
        VStack {
            Text("Snake Game")
                .font(.largeTitle)
            SpriteView(scene: scene)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    BoardView()
}
