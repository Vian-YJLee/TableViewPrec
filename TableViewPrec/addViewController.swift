//
//  addViewController.swift
//  TableViewPrec
//
//  Created by LeeYongJin on 29/05/2019.
//  Copyright © 2019 vian. All rights reserved.
//

import UIKit

class addViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        
        items.append(tfAddItem.text!)
        itemsImageFile.append("clock.png")
        tfAddItem.text = ""  //textfield 내용 초기화
        
        
        _ = navigationController?.popViewController(animated: true)
        // 완료 후 자동으로 목록으로 돌아가는 루트 뷰 컨트롤러 동작
        
        //add 버튼 동작. TableViewController 의 items 배열에 작성한 내용 보내기
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
