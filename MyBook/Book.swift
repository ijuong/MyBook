//
//  Book.swift
//  MyBook
//
//  Created by ktds 02 on 2017. 8. 17..
//  Copyright © 2017년 cj. All rights reserved.
//

import Foundation
import UIKit

class Book:NSObject, NSCoding {
    var title:String
    var writer:String?
    var publisher:String?
    var coverImage:UIImage?
    var price:Int?
    var desc:String?
    var url:String?
    
    init(title:String,
         writer:String?,
         publisher:String?,
         coverImage:UIImage?,
         price:Int?,
         desc:String?,
         url:String?) {
        self.title = title
        self.writer = writer
        self.publisher = publisher
        self.coverImage = coverImage
        self.price = price
        self.desc = desc
        self.url = url
    }
    
    convenience init(title:String,
         writer:String) {
        self.init(title: title, writer: writer, publisher: nil, coverImage: nil, price:nil, desc: nil, url: nil)
    }
    
    //파일 >> 인스턴스
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.writer = aDecoder.decodeObject(forKey: "writer") as! String
        self.publisher = aDecoder.decodeObject(forKey: "publisher") as! String
        self.coverImage = aDecoder.decodeObject(forKey: "coverImage") as! UIImage
        self.price = aDecoder.decodeObject(forKey: "price") as! Int
        self.desc = aDecoder.decodeObject(forKey: "desc") as! String
        self.url = aDecoder.decodeObject(forKey: "url") as! String
    }
    
    //인스턴스 >> 파일
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.writer, forKey: "writer")
        aCoder.encode(self.publisher, forKey: "publisher")
        aCoder.encode(self.coverImage, forKey: "coverImage")
        aCoder.encode(self.price, forKey: "price")
        aCoder.encode(self.desc, forKey: "desc")
        aCoder.encode(self.url, forKey: "url")
    }
}
