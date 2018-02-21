//
//  ViewController.swift
//  News Reader
//
//  Created by Manoj Kulkarni on 1/24/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var newDetails: NewsDetails!
    var newsDetailsArray = [NewsDetails]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        downloadNews{
            
        }
    }
    

    func downloadNews(completed: @escaping DownloadComplete) {
        
        Alamofire.request(BASE_URL).responseJSON { (response) in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let newsDetailsList = dict["articles"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in newsDetailsList {
                        let newsDetails = NewsDetails(newsDetailsDict: obj)
                        self.newsDetailsArray.append(newsDetails)
                        //print(obj)
                        //print(self.newsDetailsArray.count)
                    }
                    self.tableView.reloadData()
                }
                
            }
            
        }
        completed()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsDetailsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell{
           let newsTitle = newsDetailsArray[indexPath.row]
            cell.configureCell(newsDetails: newsTitle)
            return cell
        }
        return NewsCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var news: NewsDetails!
        news = newsDetailsArray[indexPath.row]
        self.performSegue(withIdentifier: "newsDetailsSegue", sender: news)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsDetailsSegue" {
            if let newsDetailsVC = segue.destination as? NewsDetailsVC {
                if let news = sender as? NewsDetails {
                    newsDetailsVC.newsDetails = news
                }
            }
        }
    }
    
}

