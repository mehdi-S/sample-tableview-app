//
//  Post.swift
//  my-hood
//
//  Created by Mehdi Silini on 25/05/2016.
//  Copyright © 2016 Mehdi Silini. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    private var _imagePath: String!
    private var _postTitle: String!
    private var _postDescription: String!
    
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
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._postTitle = aDecoder.decodeObjectForKey("title") as? String
        self._postDescription = aDecoder.decodeObjectForKey("description") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._postTitle, forKey: "title")
        aCoder.encodeObject(self._postDescription, forKey: "description")
    }
}