//
//  ViewController.swift
//  Silly Song
//
//  Created by Melike Ertekin on 10/5/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    // MARK: Lifecylce Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    
    // MARK: Button Actions
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = String(lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text ?? ""))
    }
    
    // Template to use in lyricsForName
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    
    func shortNameFromName(name: String) -> String {
        let lowercaseName = name.lowercased()
        let vowelSet = CharacterSet(charactersIn: "aeiou")
               
        let index = lowercaseName.rangeOfCharacter(from: vowelSet)!.lowerBound
        return String(lowercaseName[index...])
    }

    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        
        let shortName = shortNameFromName(name: fullName)
        
         let lyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        return lyrics
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
