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
    var selectedNode: SKNode?
    var touchOffset = CGPoint.zero
    
    override func didMove(to view: SKView) {
        backgroundColor = .blue
        
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        sprite.size = CGSize(width: 100, height: 100)
        addChild(sprite)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the first touch
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            // Select node when touched
            if let node = nodes(at: location).first {
                selectedNode = node
                touchOffset = CGPoint(
                    x: location.x - node.position.x,
                    y: location.y - node.position.y
                )
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let node = selectedNode else { return }
        let location = touch.location(in: self)
        
        node.position = CGPoint(
            x: location.x - touchOffset.x,
            y: location.y - touchOffset.y
        )
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        selectedNode = nil
        touchOffset = .zero
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        selectedNode = nil
        touchOffset = .zero
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
