//
//  DiceSceneView.swift
//  Diciee
//
//  Created by mai khaled on 09/05/2025.
//

import Foundation
import SwiftUI
import SceneKit

struct DiceSceneView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = createScene()
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = .clear
        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}

    func createScene() -> SCNScene {
        let scene = SCNScene()

        // camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 5)
        scene.rootNode.addChildNode(cameraNode)

        // lighting
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.color = UIColor(white: 0.6, alpha: 1)
        let ambientNode = SCNNode()
        ambientNode.light = ambientLight
        scene.rootNode.addChildNode(ambientNode)

        let omniLight = SCNLight()
        omniLight.type = .omni
        omniLight.intensity = 800
        let omniNode = SCNNode()
        omniNode.light = omniLight
        omniNode.position = SCNVector3(3, 3, 5)
        scene.rootNode.addChildNode(omniNode)

        // create dice cube with slight chamfer
        let box = SCNBox(width: 2, height: 2, length: 2, chamferRadius: 0)
        let diceNode = SCNNode(geometry: box)

        // dice face materials
        let frontMat = SCNMaterial()
        frontMat.diffuse.contents = UIImage(named: "dice1")

        let rightMat = SCNMaterial()
        rightMat.diffuse.contents = UIImage(named: "dice2")

        let backMat = SCNMaterial()
        backMat.diffuse.contents = UIImage(named: "dice3")

        let leftMat = SCNMaterial()
        leftMat.diffuse.contents = UIImage(named: "dice4")

        let topMat = SCNMaterial()
        topMat.diffuse.contents = UIImage(named: "dice5")

        let bottomMat = SCNMaterial()
        bottomMat.diffuse.contents = UIImage(named: "dice6")

        // edge material (chamfer faces)
        let edgeMat = SCNMaterial()
        edgeMat.diffuse.contents = UIColor(hex: "#DA0037") // same as dice color
        edgeMat.lightingModel = .physicallyBased
        edgeMat.isDoubleSided = true
        edgeMat.transparency = 1.0
        edgeMat.shininess = 0
        edgeMat.specular.contents = UIColor.black

        // assign materials in order (6 faces + chamfer)
        box.materials = [frontMat, rightMat, backMat, leftMat, topMat, bottomMat, edgeMat]

        // rotation
        let rotate = SCNAction.repeatForever(
            SCNAction.rotateBy(x: 0.5, y: 1.0, z: 0, duration: 2)
        )
        diceNode.runAction(rotate)

        scene.rootNode.addChildNode(diceNode)
        return scene
    }
}
