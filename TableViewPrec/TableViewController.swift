//
//  TableViewController.swift
//  TableViewPrec
//
//  Created by LeeYongJin on 29/05/2019.
//  Copyright © 2019 vian. All rights reserved.
//

import UIKit

var items = ["책 구매", "고양이밥","코딩"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

//View에 넣을 자료 배열

class TableViewController: UITableViewController {


    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        // 바에 Edit button 생성
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
        
        //데이터 재호출. 추가된 내용 표시
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
        //섹션을 둘로 나눔 초기값은 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
        
        //배열 수 만큼 섹션 생성
    }

    //배열 안 사진과 내용 테이블뷰 섹션에 넣기
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = items[ (indexPath as NSIndexPath).row ]
        cell.imageView?.image = UIImage(named: itemsImageFile[ (indexPath as NSIndexPath).row ])

        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            
            
            // Delete the row from the data source
            // 왼쪽으로 밀어서 삭제하기
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        return "삭제"
    } //Delete 대신 삭제 로 표기
    

    
    // Override to support rearranging the table view.
    // 섹션 순서 변경. 임시공간을 사용하는 간단한 함수 사용
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let itemToMove =  items[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        // 이동할 텍스트와 이미지를 각각 임시 상수에 저장
        
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        //이동할 텍스트와 이미지를 삭제, 삭제 후 인덱스 재정렬
        
        
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        //위에서 삭제된 텍스트와 이미지를 이동할 위치로 다시 삽입

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            
            detailView.receiveItem(items[((indexPath as NSIndexPath?)?.row)!])
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
