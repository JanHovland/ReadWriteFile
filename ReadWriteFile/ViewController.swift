//
//  ViewController.swift
//  ReadWriteFile
//
//  Created by Jan  on 21/12/2018.
//  Copyright © 2018 Jan . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var readString = ""
    
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let filename = "Test"
        let DocumentDirURL =  try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(filename).appendingPathExtension("txt")
    
        print("File Path: \(fileURL.path)")
        
        let writeString = "Write this text to the file in Swift"
        do {
            // Write to the file
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to write to URL")
            print(error)
        }
    
        do {
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed to read file")
            print(error)
        }
    
        print("Contents of this file: \(readString)")
        
    }
}

