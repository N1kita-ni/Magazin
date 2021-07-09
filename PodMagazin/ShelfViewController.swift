//
//  ShelfViewController.swift
//  PodMagazin
//
//  Created by Никита Ничепорук on 6/7/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import UIKit

class ShelfViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var arrayOfShelf: Array<String> = []
    var shopShelf: Magazin?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let shopShelf = shopShelf {
            arrayOfShelf = shopShelf.getShelfContent()
        }
        textField.delegate = self
    }
    
    func addFromShelf() {
        guard let itemToAdd = textField.text,
            itemToAdd != "" else {
                let alert = UIAlertController(title: "Error",
                                              message: "Please enter item name",
                                              preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK",
                                       style: .default,
                                       handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                return
        }
        shopShelf?.shelfAssortiment.append(itemToAdd)
        UserDefaults.standard.set(shopShelf?.shelfAssortiment, forKey: "ShopShelf")
        textField.text = ""
    }
    
    
    @IBAction func buttonAddFromShelf(_ sender: Any) {
        guard let itemToAdd = textField.text,
            itemToAdd != "" else {
                let alert = UIAlertController(title: "Error",
                                              message: "Please enter item name",
                                              preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK",
                                       style: .default,
                                       handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                return
        }
        shopShelf?.shelfAssortiment.append(itemToAdd)
        UserDefaults.standard.set(shopShelf?.shelfAssortiment, forKey: "ShopShelf")
    }
}

extension ShelfViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonAddFromShelf(self)
        view.endEditing(true)
        return true
    }
}

