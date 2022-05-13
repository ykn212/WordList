//
//  ListTableViewController.swift
//  WordList
//
//  Created by 中村薫乃 on 2022/05/12.
//

import UIKit

class ListTableViewController: UIViewController {
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        
        tableView.reloadData()
        
    }
    
    //MARK: - Table view data source
    
    //セクション数を指定します。
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの個数を指定します。
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:
                            Int) -> Int {
        return wordArray.count
    }
    
    //セルの中身の表示の仕方を設定します
    override func tableView(_ tableView: UITableView, cellForRowAt  indexPath: IndexPath)
    -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as!  ListTableTableViewCell
        
        let nowIndexPathDictionary = wordArray[indexPath.row]
        
        cell.englishLabel.text = nowIndexPathDictionary["english"]
        cell.japaneseLabel.text = nowIndexPathDictionary["japanese"]
        
        retuen cell
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
