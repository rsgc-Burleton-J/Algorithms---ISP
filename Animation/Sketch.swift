//
//  Sketch.swift
//  Animation
//
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//  Author: Jeremy Burleton
//  Date: Jan 17


//Import Required libraries
import Foundation
import Darwin

//Declare the class to be a sketch
class Sketch {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Declare any properties you need for your sketch below this comment, but before init()
    // Declare Variables that can be used anywhere in the document
    // The majority of these variables are used to track and create the circles used to create the drawings
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
    var c2 : Float = 0
    
    //create functions that will be drawn on screen if selected
    var func1 = 0
    var func2 = 0
    var func3 = 0
    var func4 = 0
    var func5 = 0
    var func6 = 0
    var func7 = 0
    var func8 = 0
    
    //declare other useful functions
    var Size = 0
    var counter = 0
    var screen = 1
    var firstT = 1
    
    
    // This runs once, equivalent to setup() in Processing
    // Create the screen on which I want my first screen to be based.
    init() {
        
        // Create canvas object – 1000 Wide, 500 Tall.
        canvas = Canvas(width: 1000, height: 500)
        
        // The frame rate can be adjusted; the default is 60 fps
        // Keep at 100 FPS so program doesn't take forever to run
        canvas.framesPerSecond = 100
        
        
        //Background (including the squares used for selecting functions
        //Declare them to be black, and space them specifically.
        canvas.fillColor = Color(hue: 181, saturation: 0, brightness: 98, alpha: 100)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        canvas.fillColor = Color(hue: 181, saturation: 0, brightness: 0, alpha: 100)
        
        //Left Squares
        canvas.drawRectangle(bottomRightX: 300, bottomRightY: 350, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 300, bottomRightY: 300, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 300, bottomRightY: 250, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 300, bottomRightY: 200, width: 25 , height: 25)
        
        //Right Squares
        canvas.drawRectangle(bottomRightX: 700, bottomRightY: 350, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 700, bottomRightY: 300, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 700, bottomRightY: 250, width: 25 , height: 25)
        canvas.drawRectangle(bottomRightX: 700, bottomRightY: 200, width: 25 , height: 25)
        
        //Continue Square
        canvas.drawRectangle(bottomRightX: 450, bottomRightY: 25, width: 50 , height: 50)
        
        
        //Show text for choosing animations
        //Select Colour and Sizing
        canvas.textColor = Color(hue: 225, saturation: 100, brightness: 0, alpha: 100) //Black
        canvas.drawText(message: "Select The Function(s) Which You Would Like to View",size: 35, x: 100, y: 445) //Title
        canvas.textColor = Color(hue: 225, saturation: 100, brightness: 0, alpha: 100) //Black
        
        //Left side messages
        canvas.drawText(message: "Sine Wave (normal)",size: 19, x: 100, y: 345)
        canvas.drawText(message: "Sine Wave (streched)",size: 19, x: 100, y: 295)
        canvas.drawText(message: "Sine Wave (Radial) ",size: 19, x: 100, y: 245)
        canvas.drawText(message: "Tan Function (Radial)",size: 19, x: 100, y: 195)
        
        //Right side messages
        canvas.drawText(message: "Unhappy Face (Parabola)",size: 19, x: 450, y: 345)
        canvas.drawText(message: "Happy Face (Parabola)",size: 19, x: 450, y: 295)
        canvas.drawText(message: "Tan Function (Degrees)",size: 19, x: 450, y: 245)
        canvas.drawText(message: "Hack Colours",size: 19, x: 450, y: 195)
        
        //Select feature message
        canvas.drawText(message: "Draw Selected Functions",size: 30, x: 315, y: 95)
        
    }
    
    //Runs repeatedly, equivalent to draw() in Processing
    //Run all my algorithms through draw
    func draw() {
        
        //Setup an if statement to declare if the screen is still 1, make selecting features options possible.
        if (screen == 1) {
           
            //Declare how you want the mouseclick to be drawn (dont show)
            canvas.drawShapesWithBorders = false
            canvas.drawShapesWithFill = true
            canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 0)
            canvas.drawEllipse(centreX: Int(canvas.mouseX), centreY: Int(canvas.mouseY), width: 5, height: 5)
            
            //Make If statement to declare if mousclicked in one of the boxes, turn its respective function on, and show a red box rather than remainaing black (for all 8 normal boxes)
            //Second section (right boxes)
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
            
            if (Int(canvas.mouseX) > 700 && Int(canvas.mouseX) < 725 && Int(canvas.mouseY) > 200 && Int(canvas.mouseY) < 225) {
                
                canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 100, alpha: 100)
                canvas.drawRectangle(bottomRightX: 700, bottomRightY: 200, width: 25 , height: 25)
                func8 = 1
            }
            
            //First Section (left boxes)
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
    
            //Continue Button to allow screen to change to screen 2, where the animations take place
            if (Int(canvas.mouseX) > 450 && Int(canvas.mouseX) < 500 && Int(canvas.mouseY) > 25 && Int(canvas.mouseY) < 75) {
                
                screen = 2
            }
            //conclude first screen if statment
        }
        
        //create if statement to declare if screen = 2, draw the functions that have been selected on screen 1
        if (screen == 2) {
            
            //Draw a new background with a grid sytem once, so that the animation isnt repeatedly covered by new background (so you can view the entirety of the animation)
            
            if (firstT == 1){
            canvas.fillColor = Color(hue: 181, saturation: 0, brightness: 98, alpha: 100)
            canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
            
            //create a for loop taking lines to create a grid system
            //40 lines covers the whole screen, as 1000 (height) / 25 = 40)
            for i in 0...40 {
                
                // draw vertical lines
                canvas.drawLine(fromX: i * 25, fromY: 0 , toX: i * 25, toY: 500)
                
                // draw horizontal lines
                canvas.drawLine(fromX: 0, fromY: i * 25 , toX: 1000, toY: i * 25)
                //set firstT to 2 so the background doesnt re-draw
                firstT = 2
            }
            }
            //Add to z, which will be used as a tool in order to allow some of the functions to loop twice
            //If the functions loop to infinite, the program cant handel the large numbers in interger form, and will crash.  If it runs twice, the program runs fine
            
        z = z + 1
            //Create if statement declaring if "Hack Colour" hasn't been selected, change the colour by .35 every pixel
            if (func8 == 0){
        colour = colour + 0.35
            }
            //let statement converting mathematically radial's into degrees
        let radian = (2*M_PI*z)/360
        
        //in order to run all the function at the same time, we need 7 different X values
        //Add 1 to each value to move functions across the screen
        x1 = x1 + 1
        x2 = x2 + 1
        x3 = x3 + 1
        x4 = x4 + 1
        x5 = x5 + 1
        x6 = x6 + 1
        x7 = x7 + 1

        //If statements declaring if functions have been selected on screen one, display the describes function.
        //All statements decalre size, then formula, then re-draw a second time
            
        //First Function: Draws basic sine wave (include radian to degree change formular from above)
        if (func1 == 1) {
            Size = 5
            
            y = (sin(radian)) * 200 + 250
            //draw circle based on given values of y and respective x
            canvas.drawEllipse (centreX: Int(x1), centreY: Int(y), width:Size, height: Size)
            
            //Reset feature in all functions, using respective x values
            if (x1 > 1000){
                x1 = 0
                counter = counter + 1
            }
            if (counter > 0){
                x1 = z - (1000)
                y = (sin(radian)) * 200 + 250
            }
        }
            
        //Second Function: Draws basic sine wave, that has been streched by a factor of 4 (include radian to degree change formular from above)
        if (func2 == 1){
            Size = 5
            y = ((1/4)*sin(radian)) * 200 + 250
            //draw circle based on given values of y and respective x
            canvas.drawEllipse (centreX: Int(x2), centreY: Int(y), width:Size, height: Size)
            
            //Reset feature in all functions, using respective x values
            if (x2 > 1000){
                x2 = 0
                counter = counter + 1
            }
            if (counter > 0){
                x2 = z - (1000)
                
                y = ((1/4)*sin(radian)) * 200 + 250
            }
        }
        
        //Third Fucntion: Draws a sine wave using radial values (mathematical pattern)
        if (func3 == 1){
            Size = 20
            y = (sin(z)) * 400
            //draw circle based on given values of y and respective x
            canvas.drawEllipse (centreX: Int(x3), centreY: Int(y), width:Size, height: Size)
            
            //Reset feature in all functions, using respective x values
            if (x3 > 1000){
                x3 = 0
                counter = counter + 1
            }
            if (counter > 0){
                x3 = z - (1000)
                
                y = (sin(z)) * 400
            }
            
        }
            
        //Function 4: Draws Tan function (using Radials)
        if (func4 == 1){
            Size = 20
            y = (tan(z)) * 400
            //draw circle based on given values of y and respective x
            canvas.drawEllipse (centreX: Int(x4), centreY: Int(y), width:Size, height: Size)
            
            //Reset feature in all functions, using respective x values
            if (x4 > 1000){
                x4 = 0
                counter = counter + 1
            }
            if (counter > 0){
                x4 = z - (1000)
                
                y = (tan(z)) * 400
            }
            
        }
        
        //Create unhappy face using 1 parabola, and manipulating it based off of height.
        if (func5 == 1) {
            Size = 20
            y = 0.1*(x5-200)*(x5-200)+100
            
            //Manipulation of the parabola in order to create Unhappy face
            if (y < 300) {
                y = -0.05*(x5-200)*(x5-200)+200
            }
            //Manipulation of the parabola in order to create Unhappy face
            if (y > 400) {
                y = 0.01*(x5-200)*(x5-200)
            }
            //draw circle based on given values of y and respective x
            canvas.drawEllipse (centreX: Int(x5), centreY: Int(y), width:Size, height: Size)
        }
            
        //Create happy face using 1 parabola, and manipulating it based off of height.
        if (func6 == 1) {
            Size = 20
            y = 0.1*(x6-200)*(x6-200)+200
            //Manipulation of the parabola in order to create Unhappy face
            if (y < 300) {
                y = 0.05*(x6-200)*(x6-200)+100
            }
            //Manipulation of the parabola in order to create Unhappy face
            if (y > 400) {
                y = 0.01*(x6-200)*(x6-200)
            }
            //draw circle based on given values of y and respective x
            canvas.drawEllipse (centreX: Int(x5), centreY: Int(y), width:Size, height: Size)
        }
            
        //Function 7: Draw tan function using degrees
        if (func7 == 1) {
            Size = 10
            
            y = (tan(radian)) * 100 + 250
            
            if(x7 > 1000){
                y = (tan(radian)) + 250
                x7 = z - (1000)
            }
            //draw circle based on given values of y and respective x
            canvas.drawEllipse (centreX: Int(x7), centreY: Int(y), width:Size, height: Size)
        }
            //random colours Function
            //if statement to declare if hack colours has been selected, choose random colour
            if (func8 == 1) {
                let c2 = arc4random_uniform(360)
                //converting UInt32 into a float value
                colour = Float (c2)
                print(colour)
                }
        
        // Draw Shapes without borders, and determine the colours.  If "Hack Colours" has been selected, then colours are random
        canvas.drawShapesWithBorders = false
        //Determine colour of shapes
        canvas.fillColor = Color(hue: colour, saturation: 100, brightness: 100, alpha: 100)
        }
    }
}