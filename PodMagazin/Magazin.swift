//
//  Magazin.swift
//  PodMagazin
//
//  Created by Никита Ничепорук on 5/6/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import UIKit

class Magazin: NSObject {
    var assortiment: Array<String>
    var storageAssortiment: Array<String>
    var shelfAssortiment: Array<String>
    
    init(assortiment: [String], storageAssortiment: [String], shelfAssortiment: [String]) {
        self.assortiment = assortiment
        self.storageAssortiment = storageAssortiment
        self.shelfAssortiment = shelfAssortiment
    }
    override var description: String{
        return assortiment.joined(separator: ", ")
    }
    
    func sell() -> String {
        if assortiment.count != 0 {
            assortiment.remove(at: 0)
        }
        return description
    }
    
    private func addFromStorage() {
        assortiment.append(storageAssortiment[0])
        storageAssortiment.remove(at: 0)
    }
    
    func updateProductFromStorage() -> String {
        if storageAssortiment.count != 0 {
            addFromStorage()
        }
        return description
    }
    func moveItemToShelf() {
        assortiment.append(contentsOf: storageAssortiment)
        storageAssortiment = []
    }
    
    func getStorageContent() ->[String] {
        return storageAssortiment
    }
    
    func getShelfContent() -> [String] {
        return shelfAssortiment
    }
    func addFromShelf() {
        assortiment.append(contentsOf: shelfAssortiment)
        shelfAssortiment = [] 
    }
    
}

let magazin: Magazin = Magazin(assortiment: ["Minifit","Vaporesso XROS","eGo AIO","Battlestar"], storageAssortiment: [], shelfAssortiment: [])

//"Terros One","Elf Bar RF350","","Smoant Pasito","Elven POD","Smoant VIKII"
