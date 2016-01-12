//
//  Sketch.swift
//  Animation
//
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

class Sketch {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Declare any properties you need for your sketch below this comment, but before init()
    var x : Double = 0
    var z : Double = 0
    var s = 10
    var y : Double = 0
    var colour : Float = 0
    
    
    // This runs once, equivalent to setup() in Processing
    init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 1000, height: 500)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 100
        
        // background
        canvas.fillColor = Color(hue: 181, saturation: 0, brightness: 98, alpha: 100)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        //Vertical
        
        for i in 0...40 {
            
            
            // draw vertical lines
            canvas.drawLine(fromX: i * 25, fromY: 0 , toX: i * 25, toY: 500)
            
            // draw horizontal lines
            canvas.drawLine(fromX: 0, fromY: i * 25 , toX: 1000, toY: i * 25)
            
        }
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        z = z + 1
        colour = colour + 0.3
        
        // Horizontal position of circle
        //x = x + s
        x = Double(canvas.frameCount)
   
        y = (sin (z)) * 400
        
//        y = 0.05*(x-200)*(x-200)+100
        
        
        // Bounce when hitting wall
        if (x > Double(canvas.width) || x < 0) {
            s *= -1
        }
//        
//        if (y < 300) {
//           y = (sin (z)) * 10
        // y = -0.05*(x-200)*(x-200)+200
//        }
//        if (y > 400) {
//            y = 0.01*(x-200)*(x-200)
//        }
//
        //draw a rect with no fill
        //canvas.drawRectangle(bottomRightX: 50, bottomRightY: 50, width: 200, height: 200)
        
        
        //        // Clear the background
        //        canvas.drawShapesWithBorders = true
        
        // Draw a circle that moves across the screen
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: colour, saturation: 100, brightness: 100, alpha: 100)
        canvas.drawEllipse (centreX: Int(x), centreY: Int(y), width: 30, height: 30)
        
        
    }
    
}