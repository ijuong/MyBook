//
//  BookListTableViewController.swift
//  MyBook
//
//  Created by ktds 02 on 2017. 8. 17..
//  Copyright © 2017년 cj. All rights reserved.
//

import UIKit
import Foundation

class BookListTableViewController: UITableViewController, AddBookDelegate {
    
    var books:[Book] = Array()
    
    func getFilePath(withFileName fileName:String) -> String {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir = dirPath[0] as NSString
        let filePath = docDir.appendingPathComponent(fileName)
        return filePath
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = self.getFilePath(withFileName: "books")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            if let books = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Book] {
                self.books.append(contentsOf: books)
            }
        } else {
            let book1 = Book(title: "핵심만 골라 배우는 iOS 9 프로그래밍",
                             writer: "닐 스미스",
                             publisher: "제이펍",
                             coverImage: UIImage(named:"001")!,
                             price: 32400,
                             desc: "핵심만 골라 배우는 iOS 9 프로그래밍]은 iOS 9 SDK와 Xcode 7, 그리고 스위프트 2 프로그래밍 언어를 이용하여 iOS 애플리케이션을 생성하는 데 필요한 기술을 가르치는 데목적을 둔다",
                             url:"http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791185890524&orderClick=LAG&Kc=")
            let book2 = Book(title: "iOS 해킹과 방어",
                             writer: "조나단 지드자스키",
                             publisher: "에이콘",
                             coverImage: UIImage(named:"002")!,
                             price: 31500,
                             desc: "보안 전문가와 아이폰 개발자를 위한『iOS 해킹과 방어』. iOS 보안의 불완전함을 알기 쉽게 설명하고 개발자 입장에서 이를 어떻게 보완할 수 있는지 친절하게 설명한 책이다.",
                             url:"http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788960773370&orderClick=LAG&Kc=")
            let book3 = Book(title: "예제가 가득한 iOS 프로그래밍",
                             writer: "Zhao Wenlai",
                             publisher: "정보문화사",
                             coverImage: UIImage(named:"003")!,
                             price: 18000,
                             desc: "[예제가 가득한 iOS 프로그래밍]은 현장에서 활약하는 iOS 앱 개발자 또는 초보자 탈출을 목표로 하는 개발자를 위해 iOS 애플리케이션 개발에서 조심해야 할 내용이나 알고 있는 내용을 쉽게 참고할 수 있는 내용을 중심으로 정리한 “팁 모음집”이다",
                             url:"http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788956746371&orderClick=LAG&Kc=")
            
            self.books.append(book1)
            self.books.append(book2)
            self.books.append(book3)
            
            let filePath = self.getFilePath(withFileName: "books")
            NSKeyedArchiver.archiveRootObject(self.books, toFile: filePath)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //기본cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        //bookcell
        if let bookCell = cell as? BookTableViewCell {
            let book = self.books[indexPath.row]
            
            let numFormatter:NumberFormatter = NumberFormatter()
            numFormatter.numberStyle = NumberFormatter.Style.decimal
            if let price = book.price {
                let priceStr = numFormatter.string(from: NSNumber(integerLiteral:price))
                bookCell.bookPriceLabel.text = priceStr
            } else {
                bookCell.bookPriceLabel.text = "가격없음"
            }
            bookCell.bookTitleLabel.text = book.title
            
            if let writer = book.writer {
                bookCell.bookWriterLabel.text = writer
            } else {
                bookCell.bookWriterLabel.text = "작가미상"
            }
            
            bookCell.bookImageView.image = book.coverImage
//            if let image = book.coverImage {
//                bookCell.bookImageView.image = image
//            } else {
//                bookCell.bookImageView.image = UIImage(named: "find")
//            }
            
            return bookCell
        }
        
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


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addvc" {
            if let addVC = segue.destination as? AddBookViewController {
                addVC.delegate = self
            }
        } else if segue.identifier == "detailvc" {
         
            let cell = sender as? UITableViewCell
            let vc = segue.destination as? BookDetailViewController
            
            guard let selectedCell = cell, let detailVC = vc else {
                return
            }
            
            if let idx = self.tableView.indexPath(for: selectedCell) {
                detailVC.book = self.books[idx.row]
            }
        }
    }
    
    func sendNewBook(book:Book) {
        self.books.append(book)
        self.tableView.reloadData()
    }
}

//cell에 대한 정보
class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookWriterLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
