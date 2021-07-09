//
//  StorageViewController.swift
//  PodMagazin
//
//  Created by Никита Ничепорук on 5/6/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import UIKit

class StorageViewController: UIViewController {
    @IBOutlet weak var itemToAddTextField: UITextField!
    @IBOutlet private weak var labelOfStorage: UILabel!
    var arrayOfStorage: Array<String> = []
    var shop: Magazin?
    override func viewDidLoad() {
        super.viewDidLoad()
        showStorageContent()
        addGuesture()
        
        if let shop = shop {
            arrayOfStorage = shop.getStorageContent()
        }
        itemToAddTextField.delegate = self
        
    }
    
    func addGuesture() {
        let swipe = UISwipeGestureRecognizer(target: self,
                                             action: #selector(closeScreen))
        swipe.direction = .right
        view.addGestureRecognizer(swipe)
    }
    @objc func closeScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    func showStorageContent() {
        var storageContentString = "Содержимое хранилища:"
        
        for item in arrayOfStorage {
            storageContentString.append("\n\(item)")
        }
        labelOfStorage.text = storageContentString
    }
    

    
    @IBAction func buttonToAddStorage(_ sender: Any) {
        guard let itemToAdd = itemToAddTextField.text,
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
        shop?.storageAssortiment.append(itemToAdd)
        showStorageContent()
        UserDefaults.standard.set(shop?.storageAssortiment, forKey: "ShopStorage")
        itemToAddTextField.text = ""
    }
}

extension StorageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonToAddStorage(self)
        view.endEditing(true)
        return true
    }
}

