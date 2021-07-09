//
//  ViewController.swift
//  PodMagazin
//
//  Created by Никита Ничепорук on 5/6/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var labelOfProducts: UILabel!
    
    @IBOutlet weak var imageSigaretNet: UIImageView!
    @IBOutlet private weak var labelOfMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedStorage = UserDefaults.standard.array(forKey: "ShopStorage") as? [String] {
            magazin.storageAssortiment = savedStorage
        }
        
        if let savedShelf = UserDefaults.standard.array(forKey: "ShopShelf") as? [String] {
            magazin.shelfAssortiment = savedShelf
        }
        
        labelOfProducts.text = ""
        labelOfMessage.text = ""
        imageSigaretNet.image = UIImage(named: "SigaretNetLogo")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel()
    }

    @IBAction func buttonOfProducts(_ sender: Any) {
        labelOfProducts.text = "\(magazin.description)"
    }
    
    @IBAction func buttonAddFromStorage(_ sender: Any) {
        labelOfProducts.text = "\(magazin.updateProductFromStorage())"
        labelOfMessage.text = ""
    }
    
    @IBAction func buttonSaleProducts(_ sender: Any) {
        labelOfProducts.text = "\(magazin.sell())"
        if magazin.assortiment.isEmpty {
          labelOfMessage.text = "Вы продали все товары в магазине"
//            _ = UIAlertController(title: "Товары проданы",
//                                          message: nil,
//                                          preferredStyle: .alert)
//            _ = UIAlertAction(title: "OK",
//                                   style: .cancel,
//                                   handler: nil)
            }
        }
    func updateLabel() {
        labelOfProducts.text = "\(magazin.description)"
    }
    
    @IBAction func buttonMove(_ sender: Any) {
        magazin.moveItemToShelf()
        updateLabel()
    }
    @IBAction func buttonShelfMove(_ sender: Any) {
        magazin.addFromShelf()
        updateLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let storageVC = segue.destination as? StorageViewController {
//            storageVC.arrayOfStorage = magazin.getStorageContent()
            storageVC.shop = magazin
           // storageVC.shopShelf = magazin
        }
    }
}

