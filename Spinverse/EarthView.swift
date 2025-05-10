//
//  Spinverse.swift
//  Spinverse
//
//  Created by mai khaled on 02/03/2025.
//


import SwiftUI
import SceneKit

struct EarthView: UIViewRepresentable {

    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.backgroundColor = .clear
        // Load the 3D earth scene
        if let scene = SCNScene(named: "Scene.usdz") {
            sceneView.scene = scene
            sceneView.autoenablesDefaultLighting = true
            sceneView.allowsCameraControl = false

            if let earth = scene.rootNode.childNodes.first {
                earth.name = "Earth"

                // Start a spin around Y axis
                let baseSpin = SCNAction.rotateBy(x: 1, y: 1, z: 1, duration: 5)
                let spinForever = SCNAction.repeatForever(baseSpin)
                earth.runAction(spinForever, forKey: "baseSpin")
            }
        }

        // Add pan gesture
        let panGesture = UIPanGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.handlePan(_:))
        )
        sceneView.addGestureRecognizer(panGesture)

        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject {
        var previousLocation = CGPoint.zero

        @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
            guard let scnView = gesture.view as? SCNView,
                  let earth = scnView.scene?.rootNode.childNode(withName: "Earth", recursively: true)
            else { return }

            let location = gesture.location(in: gesture.view)

            switch gesture.state {
            case .began:
                // Stop default spin when dragging starts
                earth.removeAction(forKey: "baseSpin")
                previousLocation = location

            case .changed:
                // Calculate finger movement
                let deltaX = Float(location.x - previousLocation.x)
                let deltaY = Float(location.y - previousLocation.y)

                let rotationSpeed: Float = 0.005
                earth.eulerAngles.y += deltaX * rotationSpeed // left/right
                earth.eulerAngles.x += deltaY * rotationSpeed // up/down

                previousLocation = location

            case .ended, .cancelled:
                // Calculate speed of swipe
                let velocity = gesture.velocity(in: gesture.view)
                let velocityX = Float(velocity.x) * 0.00005
                let velocityY = Float(velocity.y) * 0.00005

                let duration: TimeInterval = 2.0

                // keep spinning based on swipe speed
                let inertia = SCNAction.customAction(duration: duration) { node, elapsed in
                    let t = 1 - (Float(elapsed) / Float(duration)) // Smooth deceleration
                    earth.eulerAngles.y += velocityX * t
                    earth.eulerAngles.x += velocityY * t
                }
                

                earth.runAction(inertia)

                // Resume slow spin after inertia
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    let baseSpin = SCNAction.rotateBy(x: 1, y: 1, z: 1, duration: 5)
                    let spinForever = SCNAction.repeatForever(baseSpin)
                    earth.runAction(spinForever, forKey: "baseSpin")
                }

            default:
                break
            }
        }
    }
}
