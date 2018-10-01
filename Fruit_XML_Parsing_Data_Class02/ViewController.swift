//
//  ViewController.swift
//  Fruit_XML_Parsing_Data_Class02
//
//  Created by D7702_10 on 2018. 10. 1..
//  Copyright © 2018년 jik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {

    var myFruitData = [FruitData]()
    var fName = ""
    var fColor = ""
    var fCost = ""
    var currentElement = ""
    //데이터 객체 초기화
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let path = Bundle.main.url(forResource: "Fruit", withExtension: "xml"){
            if let myParser = XMLParser(contentsOf: path){
                myParser.delegate = self
                
                //파싱 시작
 
                if myParser.parse() {
                    print("Parsing succeed!")
                    
                    for i in 0 ..< myFruitData.count {
                        print(myFruitData[i].name)
                    }
                    
                } else {
                    print("Parsing failed")
                }
                
            } else {
                print("path error")
            }
            
        } else {
            print("file error")
        }

    }

    // XMLParserDelegate 메소드 호출
    

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
    }
    
    // <tag>를 만날때
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        //공백 제거
        
        if !data.isEmpty {
            switch currentElement {
            case "name" : fName = data
            case "color" : fColor = data
            case "cost" : fCost = data
            default : break
            }
        }
        
    }
    
    // tag 다음에 문자열을 만날때
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let myItem = FruitData()
            myItem.name = fName
            myItem.color = fColor
            myItem.cost = fCost
            myFruitData.append(myItem)
            
        }
    }
    
    // <tag>를 만날때
    
    
}








