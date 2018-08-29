//
//  Post.swift
//  my-hood
//
//  Created by Mehdi Silini on 25/05/2016.
//  Copyright © 2016 Mehdi Silini. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    fileprivate var _imagePath: String!
    fileprivate var _postTitle: String!
    fileprivate var _postDescription: String!
    
    var imagePath: String {
        return _imagePath
    }
    
    var postTitle: String {
        return _postTitle
    }
    
    var postDescription: String {
        return _postDescription
    }
    
    init(imagePath: String, title: String, description: String) {
        self._imagePath = imagePath
        self._postTitle = title
        self._postDescription = description
        
    }
    
    override init() {
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObject(forKey: "imagePath") as? String
        self._postTitle = aDecoder.decodeObject(forKey: "title") as? String
        self._postDescription = aDecoder.decodeObject(forKey: "description") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._imagePath, forKey: "imagePath")
        aCoder.encode(self._postTitle, forKey: "title")
        aCoder.encode(self._postDescription, forKey: "description")
    }
}
