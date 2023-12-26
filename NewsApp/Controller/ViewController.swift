//
//  ViewController.swift
//  NewsApp
//
//  Created by Hüseyin Kaya on 25.12.2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    var model : [Model] = []
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getData()
    }

    func getData() {
        
        WebServices.shared.fetchNews { model in
            
            if let model = model { // veriler geliyorsa
                DispatchQueue.main.async {
                    self.model = model // geliyorsa doldur
                    self.tableView.reloadData()
                }
            } else {
                print("Veri gelmedi")
            }
            
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        let item = model[indexPath.row]
        cell.newsTitle.text = item.title
        cell.newsDescription.text = item.description
        cell.newsImageView.sd_setImage(with: URL(string: item.urlToImage ?? "nil"))
        
        return cell
    }
    
    
}

