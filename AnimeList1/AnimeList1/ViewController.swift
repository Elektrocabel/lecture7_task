//
//  ViewController.swift
//  AnimeList1
//
//  Created by Sierra on 31.10.2018.
//  Copyright © 2018 Sergey Ovchinnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var item: Item?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descText: UITextView!
    @IBOutlet var nameImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            nameLabel.text = item.name
            descText.text = "Тип: " + item.type + "\nКоличество эпизодов: " + item.episodes + "\nДлительность: " +  item.episode_length + "\n\n" + item.description
           // nameImage.image = UIImage(named: item.image)
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

