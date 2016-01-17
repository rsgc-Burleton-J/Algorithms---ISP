//
//  Sketch.swift
//  Animation
//
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation
import Darwin

class Sketch {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Declare any properties you need for your sketch below this comment, but before init()
    var x: Double = 0
    var x1: Double = 0
    var x2: Double = 0
    var x3: Double = 0
    var x4: Double = 0
    var x5: Double = 0
    var x6: Double = 0
    var x7: Double = 0
    var z : Double = 0
    var s = 10
    var y : Double = 0
    var colour : Float = 0
    //var D = 1
    
    var func1 = 0
    var func2 = 0
    var func3 = 0
    var func4 = 0
    var func5 = 0
    var func6 = 0
    var func7 = 0
    var func8 = 0
    
    var Size = 0
    var counter = 0
    var screen = 1
    var firstT = 1
    
    
    // This runs once, equivalent to setup() in Processing
    init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 1000, height: 500)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 100
        
        

        
        // background
        canvas.fillColor = Color(hue: 181, saturation: 0, brightness: 98, alpha: 100)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        canvas.fillColor = Color(hue: 181, saturation: 0, brightness: 0, alpha: 100)
        canvas.drawRectangle(bottomRightX: 300, bottomRightY: 350, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 300, bottomRightY: 300, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 300, bottomRightY: 250, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 300, bottomRightY: 200, width: 25 , height: 25)
        
        canvas.drawRectangle(bottomRightX: 700, bottomRightY: 350, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 700, bottomRightY: 300, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 700, bottomRightY: 250, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 700, bottomRightY: 200, width: 25 , height: 25)
        
        canvas.drawRectangle(bottomRightX: 450, bottomRightY: 25, width: 50 , height: 50)
        //Vertical
        
        for i in 0...40 {
            
            
            // draw vertical lines
            canvas.drawLine(fromX: i * 25, fromY: 0 , toX: i * 25, toY: 500)
            
            // draw horizontal lines
            canvas.drawLine(fromX: 0, fromY: i * 25 , toX: 1000, toY: i * 25)
            
        }
        
        canvas.textColor = Color(hue: 225, saturation: 100, brightness: 0, alpha: 100) //Black
        canvas.drawText(message: "Choose The Function Which You Would Like to View",size: 35, x: 100, y: 445)
        canvas.textColor = Color(hue: 225, saturation: 100, brightness: 0, alpha: 100) //Black
        canvas.drawText(message: "Sine Wave (normal)",size: 19, x: 100, y: 345)
        canvas.drawText(message: "Sine Wave (streched)",size: 19, x: 100, y: 295)
        canvas.drawText(message: "Sine Wave (Radial) ",size: 19, x: 100, y: 245)
        canvas.drawText(message: "Tan Function (Radial)",size: 19, x: 100, y: 195)
        
        canvas.drawText(message: "Unhappy Face (Parabola)",size: 19, x: 450, y: 345)
        canvas.drawText(message: "Happy Face (Parabola)",size: 19, x: 450, y: 295)
        canvas.drawText(message: "Tan Function (Radials)",size: 19, x: 450, y: 245)
        canvas.drawText(message: "Hack Colours",size: 19, x: 450, y: 195)
        
        canvas.drawText(message: "Draw Selected Functions",size: 30, x: 315, y: 95)
        

        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        if (screen == 1) {
           
            canvas.drawShapesWithBorders = false
            canvas.drawShapesWithFill = true
            canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 100, alpha: 100)
            canvas.drawEllipse(centreX: Int(canvas.mouseX), centreY: Int(canvas.mouseY), width: 5, height: 5)
            
            if (Int(canvas.mouseX) > 700 && Int(canvas.mouseX) < 725 && Int(canvas.mouseY) > 350 && Int(canvas.mouseY) < 375) {
               
                canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 100, alpha: 100)
                canvas.drawRectangle(bottomRightX: 700, bottomRightY: 350, width: 25 , height: 25)
                func5 = 1
            }
            if (Int(canvas.mouseX) > 700 && Int(canvas.mouseX) < 725 && Int(canvas.mouseY) > 300 && Int(canvas.mouseY) < 325) {
                
                canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 100, alpha: 100)
                canvas.drawRectangle(bottomRightX: 700, bottomRightY: 300, width: 25 , height: 25)
                func6 = 1
            }

            if (Int(canvas.mouseX) > 700 && Int(canvas.mouseX) < 725 && Int(canvas.mouseY) > 250 && Int(canvas.mouseY) < 275) {
                
                canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 100, alpha: 100)
                canvas.drawRectangle(bottomRightX: 700, bottomRightY: 250, width: 25 , height: 25)
                func7 = 1
            }
            //First Section
            if (Int(canvas.mouseX) > 300 && Int(canvas.mouseX) < 325 && Int(canvas.mouseY) > 350 && Int(canvas.mouseY) < 375) {
                
                canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 100, alpha: 100)
                canvas.drawRectangle(bottomRightX: 300, bottomRightY: 350, width: 25 , height: 25)
                func1 = 1
            }

            if (Int(canvas.mouseX) > 300 && Int(canvas.mouseX) < 325 && Int(canvas.mouseY) > 300 && Int(canvas.mouseY) < 325) {
                
                canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 100, alpha: 100)
                canvas.drawRectangle(bottomRightX: 300, bottomRightY: 300, width: 25 , height: 25)
                func2 = 1
            }

            if (Int(canvas.mouseX) > 300 && Int(canvas.mouseX) < 325 && Int(canvas.mouseY) > 250 && Int(canvas.mouseY) < 275) {
                
                canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 100, alpha: 100)
                canvas.drawRectangle(bottomRightX: 300, bottomRightY: 250, width: 25 , height: 25)
                func3 = 1
            }
            
            if (Int(canvas.mouseX) > 300 && Int(canvas.mouseX) < 325 && Int(canvas.mouseY) > 200 && Int(canvas.mouseY) < 225) {
                
                canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 100, alpha: 100)
                canvas.drawRectangle(bottomRightX: 300, bottomRightY: 200, width: 25 , height: 25)
                func4 = 1
            }
            
            //Continue Button
            
            if (Int(canvas.mouseX) > 450 && Int(canvas.mouseX) < 500 && Int(canvas.mouseY) > 25 && Int(canvas.mouseY) < 75) {
                
                screen = 2
            }
        }
        
        if (screen == 2) {
            
            if (firstT == 1){
            canvas.fillColor = Color(hue: 181, saturation: 0, brightness: 98, alpha: 100)
            canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
            
            
            for i in 0...40 {
                
                
                // draw vertical lines
                canvas.drawLine(fromX: i * 25, fromY: 0 , toX: i * 25, toY: 500)
                
                // draw horizontal lines
                canvas.drawLine(fromX: 0, fromY: i * 25 , toX: 1000, toY: i * 25)
                firstT = 2
            }
            }
        z = z + 1
        colour = colour + 0.35
        let radian = (2*M_PI*z)/360
    
        //for counter in -10...canvas.width {
        // }
        
        // Horizontal position of circle
        //x = x + s
        x1 = x1 + 1
        x2 = x2 + 1
        x3 = x3 + 1
        x4 = x4 + 1
        x5 = x5 + 1
        x6 = x6 + 1
        x7 = x7 + 1


        
        //y = (sin(z))
        
        // convert degrees (z) into radians
        //iplement formula
        
        if (func1 == 1) {
            Size = 5
            
            y = (sin(radian)) * 200 + 250
            canvas.drawEllipse (centreX: Int(x1), centreY: Int(y), width:Size, height: Size)
            
            if (x1 > 1000){
                x1 = 0
                counter = counter + 1
            }
            if (counter > 0){
                x1 = z - (1000)
                
                y = (sin(radian)) * 100 + 250
            }
        }
        
        if (func2 == 1){
            Size = 5
            y = ((1/4)*sin(radian)) * 200 + 250
            canvas.drawEllipse (centreX: Int(x2), centreY: Int(y), width:Size, height: Size)
            
            if (x2 > 1000){
                x2 = 0
                counter = counter + 1
            }
            if (counter > 0){
                x2 = z - (1000)
                
                y = ((1/2)*sin(radian)) * 200 + 250
            }
        }
        
        if (func3 == 1){
            Size = 20
            y = (sin(z)) * 400
            canvas.drawEllipse (centreX: Int(x3), centreY: Int(y), width:Size, height: Size)
            
            if (x3 > 1000){
                x3 = 0
                counter = counter + 1
            }
            if (counter > 0){
                x3 = z - (1000)
                
                y = ((1/2)*sin(z)) * 400
            }
            
        }
        if (func4 == 1){
            Size = 20
            y = (tan(z)) * 400
            canvas.drawEllipse (centreX: Int(x4), centreY: Int(y), width:Size, height: Size)
            
            if (x4 > 1000){
                x4 = 0
                counter = counter + 1
            }
            if (counter > 0){
                x4 = z - (1000)
                
                y = ((2)*tan(z)) * 400
            }
            
        }
        if (func5 == 1) {
            Size = 20
            y = 0.1*(x5-200)*(x5-200)+100
            if (y < 300) {
                y = -0.05*(x5-200)*(x5-200)+200
            }
            if (y > 400) {
                y = 0.01*(x5-200)*(x5-200)
            }
            canvas.drawEllipse (centreX: Int(x5), centreY: Int(y), width:Size, height: Size)
        }
        if (func6 == 1) {
            Size = 20
            y = 0.1*(x6-200)*(x6-200)+200
            if (y < 300) {
                y = 0.05*(x6-200)*(x6-200)+100
            }
            if (y > 400) {
                y = 0.01*(x6-200)*(x6-200)
            }
            canvas.drawEllipse (centreX: Int(x5), centreY: Int(y), width:Size, height: Size)        }
        if (func7 == 1) {
            Size = 10
            
            y = (tan(radian)) * 100 + 250
            canvas.drawEllipse (centreX: Int(x7), centreY: Int(y), width:Size, height: Size)

            
            if (x7 > 1000){
                x7 = 0
                counter = counter + 1
            }
            if (counter > 0){
                x7 = z - (1000)
                
                y = (tan(radian)) * 20 + 250
            }
        }
        
        
        
        
        // Bounce when hitting wall
        //        if (x > Double(canvas.width) || x < 0) {
        //            s *= -1
        //        }
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
       // canvas.drawEllipse (centreX: Int(x), centreY: Int(y), width:Size, height: Size)
        
        }
    }
}