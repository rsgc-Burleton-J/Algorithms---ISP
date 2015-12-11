//
//  Sketch.swift
//  Animation
//
//  Created by Russell Gordon on 2015-12-05.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

class Sketch {

    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Declare any properties you need for your sketch below this comment, but before init()
    var x = 40
    var s = 1

    // This runs once, equivalent to setup() in Processing
    init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 700, height: 420)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 60
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
                
        // Horizontal position of circle
        x = x + s
        
        // Bounce when hitting wall
        if (x > canvas.width - 100 || x < 10) {
            s *= -1
        }
        
        // Clear the background
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 10)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        
        // Draw a circle that moves across the screen
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: Float(canvas.frameCount), saturation: 80, brightness: 90, alpha: 100)
        canvas.drawRectangle(bottomRightX: x, bottomRightY: (canvas.height / 2), width: 25, height: 25)
        canvas.drawRectangle(bottomRightX: x, bottomRightY: (canvas.height / 2 - 20), width: 25, height: 25)
        canvas.drawRectangle(bottomRightX: x, bottomRightY: (canvas.height / 2 - 40), width: 25, height: 25)
        canvas.drawRectangle(bottomRightX: x, bottomRightY: (canvas.height / 2 - 60), width: 25, height: 25)
        canvas.drawRectangle(bottomRightX: x, bottomRightY: (canvas.height / 2 - 80), width: 25, height: 25)
        canvas.drawRectangle(bottomRightX: x - 20, bottomRightY: (canvas.height / 2 - 80), width: 25, height: 25)
        //B parts of the signiture created
        canvas.drawRectangle(bottomRightX: x - 40, bottomRightY: (canvas.height / 2 - 80), width: 25, height: 25)
        canvas.drawRectangle(bottomRightX: x + 40, bottomRightY: (canvas.height / 2), width: 25, height: 25)
        canvas.drawRectangle(bottomRightX: x + 40, bottomRightY: (canvas.height / 2 - 20), width: 25, height: 25)
        canvas.drawRectangle(bottomRightX: x + 40, bottomRightY: (canvas.height / 2 - 40), width: 25, height: 25)
        canvas.drawRectangle(bottomRightX: x + 40, bottomRightY: (canvas.height / 2 - 60), width: 25, height: 25)
        canvas.drawRectangle(bottomRightX: x + 40, bottomRightY: (canvas.height / 2 - 80), width: 25, height: 25)
        //B Loops
        canvas.drawRectangle(bottomRightX: x + 90, bottomRightY: (canvas.height / 2 - 80), width: 15, height: 25)
         canvas.drawRectangle(bottomRightX: x + 90, bottomRightY: (canvas.height / 2 - 60), width: 15, height: 25)
        canvas.drawRectangle(bottomRightX: x + 90, bottomRightY: (canvas.height / 2 - 34), width: 15, height: 25)
        canvas.drawRectangle(bottomRightX: x + 90, bottomRightY: (canvas.height / 2 - 20), width: 15, height: 25)
        canvas.drawRectangle(bottomRightX: x + 90, bottomRightY: (canvas.height / 2), width: 15, height: 25)
         canvas.drawRectangle(bottomRightX: x + 72, bottomRightY: (canvas.height / 2) + 5, width: 20, height: 20)
        canvas.drawRectangle(bottomRightX: x + 72, bottomRightY: (canvas.height / 2) - 40, width: 32, height: 20)
        canvas.drawRectangle(bottomRightX: x + 72, bottomRightY: (canvas.height / 2) - 80, width: 20, height: 20)
        
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 20)
        canvas.drawRectangle(bottomRightX: x, bottomRightY: (canvas.height / 2) - 55, width: 25, height: 1)
        canvas.drawRectangle(bottomRightX: x - 3, bottomRightY: (canvas.height / 2) - 80, width: 1, height: 25)

        //canvas.drawEllipse (centreX: x + 82, centreY: canvas.height / 2 - 10, width: 20, height: 20)
        //canvas.drawEllipse (centreX: x + 82, centreY: canvas.height / 2 - 50, width: 20, height: 20)
    }
    
}