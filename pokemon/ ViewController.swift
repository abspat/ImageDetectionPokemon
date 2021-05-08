//
//  ViewController.swift
//  pokemon
//
//  Created by Riddhi Patel on 5/7/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.autoenablesDefaultLighting = true
        
        // Set the view's delegate
        sceneView.delegate = self
        
        
        
    }
    
     
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        if let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "Pokemon Group", bundle: Bundle.main) {
        
        configuration.detectionImages = referenceImages
            
        configuration.maximumNumberOfTrackedImages = 2
        
        
        print("Images have been successfully loaded")
        
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    
    
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        
        if let anchor = anchor as? ARImageAnchor {
            
            let plane = SCNPlane(width: anchor.referenceImage.physicalSize.width, height: anchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial.diffuse.contents = UIColor(white: 1, alpha: 0.5)
            
            let planeNode = SCNNode(geometry: plane)
            
            
            
            planeNode.eulerAngles.x = -.pi / 2
            
            
            node.addChildNode(planeNode)
            
            if anchor.referenceImage.name == "charizard" {
                
                if let pokeScene = SCNScene(named : "art.scnassets/Charizard.scn"){
                    
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        
                        
                        pokeNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(pokeNode)
                        
                    }
                    
                    
                    
                    
                    
                }
                
                
            }
            
            
            if anchor.referenceImage.name == "pikachu" {
                
                if let pokeScene = SCNScene(named : "art.scnassets/pikachu.scn"){
                    
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        
                        
                        pokeNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(pokeNode)
            
           
            
            
        }
        
        
        
        return node
    }
    
    
    
    
    
    
    
                func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }

}
        
    }
    }
