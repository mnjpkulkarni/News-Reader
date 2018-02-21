//
//  NewsCell.swift
//  News Reader
//
//  Created by Manoj Kulkarni on 1/31/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    func configureCell(newsDetails: NewsDetails){
        titleLbl.text = newsDetails.title
    }

}
