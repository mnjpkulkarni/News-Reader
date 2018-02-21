//
//  NewsDetails.swift
//  News Reader
//
//  Created by Manoj Kulkarni on 1/24/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import Foundation

class NewsDetails {
    
    var _author: String!;
    var _title: String!;
    var _description: String!;
    var _url: String!;
    var _urlToImage: String!;
    
    var author: String{
        if _author == nil {
            return ""
        }
        return _author!
    }
    
    var title: String{
        if _title == nil {
            return ""
        }
        return _title
    }
    
    var description: String{
        if _description == nil {
            return ""
        }
        return _description
    }
    
    var url: String{
        if _url == nil {
            return ""
        }
        return _url
    }
    
    var urlToImage: String{
        if _urlToImage == nil {
            return ""
        }
        return _urlToImage
    }
    
    
    init(newsDetailsDict: Dictionary<String, AnyObject>) {
      
        if let author = newsDetailsDict["author"] as? String {
            self._author = author
        }
        
        if let title = newsDetailsDict["title"] as? String {
            self._title = title
        }
        
        if let description = newsDetailsDict["description"] as? String {
            self._description = description
        }
        
        if let url = newsDetailsDict["url"] as? String {
            self._url = url
        }
        
        if let urlToImage = newsDetailsDict["urlToImage"] as? String {
            self._urlToImage = urlToImage
        }
        
    }
    
}

