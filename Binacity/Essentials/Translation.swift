//
//  Translation.swift
//  Binacity
//
//  Created by mi11ion on 09.02.2024.
//

import Foundation

func convertToBinary(_ input: String) -> String {
    var result = ""
    for character in input {
        if let binaryString = dictionary[String(character)] {
            result += binaryString
        }
    }
    return result
}
