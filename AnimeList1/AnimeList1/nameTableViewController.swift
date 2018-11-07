//
//  nameTableViewController.swift
//  AnimeList1
//
//  Created by Sierra on 31.10.2018.
//  Copyright © 2018 Sergey Ovchinnikov. All rights reserved.
//

import UIKit

class nameTableViewController: UITableViewController {
    
    var items = [Item]()
    let urls = ["https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/attack_on_titan.json",
                "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/beck.json",
                "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/clannad.json",
                "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/code_geass.json",
                "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/fma.json",
                "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/gto.json",
                "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/monster.json",
                "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/opm.json",
                "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/steinsgate.json",
                "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/usagi.json"]
    let image_urls = ["https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/attack_on_titan.jpg",
                      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/beck.jpg",
                      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/clannad.jpg",
                      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/code_geass.jpg",
                      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/fma.jpg",
                      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/gto.jpg",
                      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/monster.jpg",
                      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/opm.jpg",
                      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/steinsgate.jpg",
                      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/usagi.jpg"]
    
    func getItem(some_url: String) {
        let urlString = some_url
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                self.parseItem(from: json)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
            
            }.resume()
    }
    
    func parseItem(from json: Any) {
        guard let itemDict = json as? NSDictionary,
            let item = Item(dict: itemDict) else {
                print("Parse error")
                return
        }
        self.items.append(item)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for u in urls {
            getItem(some_url: u)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameTableViewCell", for: indexPath)
        if let castedCell = cell as? nameTableViewCell {
            let item = items[indexPath.row]
            castedCell.nameLabel.text = item.name
            castedCell.epicouLabel.text = "Количество эпизодов: " + item.episodes
       //     castedCell.nameImage.image = UIImage(named: item.image)
        } else { print("smth wrong") }
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! ViewController
        if let selectedCell = sender as? nameTableViewCell {
            let indexPath = tableView.indexPath(for: selectedCell)!
            let selectedItem = items[indexPath.row]
            detailVC.item = selectedItem
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
