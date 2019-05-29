//
//  DetailViewController.swift
//  TableViewPrec
//
//  Created by LeeYongJin on 29/05/2019.
//  Copyright © 2019 vian. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = "" //목록에서 텍스트 받아올 변수
    

    @IBOutlet var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblItem.text =  receiveItem
        
    }
    
    func receiveItem(_ item:String)
    {
        receiveItem = item
    }
    //목록에서 변수 받아올 함수. 클로저를 쓸수 있는 형태아닌가..?

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
