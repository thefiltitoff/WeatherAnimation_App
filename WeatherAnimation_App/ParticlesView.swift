//
//  ParticlesView.swift
//  WeatherAnimation_App
//
//  Created by Felix Titov on 7/2/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import SpriteKit

class ParticlesView: SKView {
    override func didMoveToSuperview() {
        let scene  = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        
        if let particles = SKEmitterNode(fileNamed: "ParticleScene.sks") {
            particles.position = CGPoint(
                x: self.frame.size.width / 2,
                y: self.frame.size.height
            )
            
            particles.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            
            addChild(for: scene, with: particles)
            
        }
    }
    
    private func addChild(for scene: SKScene, with child: SKEmitterNode) {
        scene.addChild(child)
    }
}
