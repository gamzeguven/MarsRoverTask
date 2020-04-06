//
//  main.swift
//  MarsRoverTask
//
//  Created by Gamze Güven on 6.04.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import Foundation

var maxValue = readLine()!
var cuurentPosition = readLine() ?? ""
var actionCommand = readLine()!

var maxValueArray = maxValue.compactMap{ $0.wholeNumberValue }
var cuurentPositionArray = cuurentPosition.compactMap{ $0.wholeNumberValue }
var actionCommandArray =  actionCommand.map(String.init)
var positionCoordinate = cuurentPosition.map(String.init)
var coordinate = positionCoordinate.last!

var X = cuurentPositionArray[0]
var Y = cuurentPositionArray[1]

func turnRight() {
    if coordinate == "N" {
        coordinate = "E"
    }
    else if coordinate == "E" {
        coordinate = "S"
    }
    else if coordinate == "W" {
        coordinate = "N"
    }
    else if coordinate == "S" {
        coordinate = "W"
    }
}

func turnLeft() {
    if coordinate == "N" {
        coordinate = "W"
    }
    else if coordinate == "E" {
        coordinate = "N"
    }
    else if coordinate == "W" {
        coordinate = "S"
    }
    else if coordinate == "S" {
        coordinate = "E"
    }
}

func goAhead() {
    if coordinate == "N" {
        cuurentPositionArray[1] += 1
    }
    else if coordinate == "E" {
        cuurentPositionArray[0] += 1
    }
    else if coordinate == "W" {
        cuurentPositionArray[0] -= 1
    }
    else if coordinate == "S"{
        cuurentPositionArray[1] -= 1
    }
}

func action(item: String) {
    
    for item in actionCommandArray {
        if (cuurentPositionArray[0] > maxValueArray[0]) || cuurentPositionArray[1] > maxValueArray[1] {
            print("Lütfen belirtilen aralıkta değer giriniz.")
            break
        }
        if item.contains("L"){
            turnLeft()
        }
        else if item.contains("R"){
            turnRight()
        }
        else if item.contains("M"){
            goAhead()
        }
    }
    
}

action(item: actionCommand)

print(cuurentPositionArray[0], cuurentPositionArray[1], coordinate)

