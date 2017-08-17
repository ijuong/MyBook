//
//  BookDetailViewController.swift
//  MyBook
//
//  Created by ktds 02 on 2017. 8. 17..
//  Copyright © 2017년 cj. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var book:Book?

    @IBOutlet weak var bookCoverImageView: UIImageView!
    @IBOutlet weak var bookWriterLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!
    @IBOutlet weak var bookDescriptTextView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let newBook = self.book else {
            return
        }
        
        self.bookWriterLabel.text = newBook.writer
        self.bookCoverImageView.image = newBook.coverImage
        self.bookPublisherLabel.text = newBook.publisher
        self.bookPriceLabel.text = String(newBook.price)
        self.bookDescriptTextView.text = newBook.description
        
        //title
        self.navigationItem.title = newBook.title
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let webVC = segue.destination as? WebViewController {
            webVC.shopURL = self.book?.url
        }
    }

}
