//
//  FileLoader.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/26/22.
//

import Foundation

//JSON data is added to the app. Loading the JSON file is split into two functions;
//(1) The first locates the file and loads the contents into a Data object;
//(2) the second uses JSONDecoder to decode the JSON data into a CharacterData object.

class FileLoader {
   
    //(1)
    static func readLocalJSONFile(_ filename: String) -> Data? {
        guard let file = Bundle.main.path(forResource: filename, ofType: "json") else {
            //TODO: - create an alert saying no data found or app is doing maintenance
            fatalError("Unable to locate file \(filename).json in the main bundle")
        }
        do {
            return try String(contentsOfFile: file).data(using: .utf8)
        } catch {
            fatalError("Unable to locate file \(filename).json in the main bundle")
        }
    }
    
    //(2)
    static func loadJson(_ data: Data) -> CharacterDetailData {
        do {
            return try JSONDecoder().decode(CharacterDetailData.self, from: data)
        } catch {
            fatalError("Unable to decode \"\(data)\" as \(CharacterDetailData.self):\n\(error)")
        }
    }
}
