//
//  addViewController.swift
//  TableViewPrec
//
//  Created by LeeYongJin on 29/05/2019.
//  Copyright © 2019 vian. All rights reserved.
//

import UIKit

class addViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_CULUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 40
    var imageArray = [UIImage?]()
    var fileName = ""
    //이미지 배열은 TableViewController 에서 전역선언된 배열을 가져와 사용

    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet var pickedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<MAX_ARRAY_NUM {
            let image = UIImage(named: itemsImageFile[i])
            
            imageArray.append(image!)
        }
        
        pickedImageView.image = imageArray[0]
        fileName = itemsImageFile[0]

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    //PickerView로 아이콘 선택하기
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_CULUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsImageFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let ImageView = UIImageView(image:imageArray[row])
        ImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        return ImageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickedImageView.image = imageArray[row]
        fileName = itemsImageFile[row]
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        
        items.append(tfAddItem.text!)
        itemsImageFile.append(fileName)
        tfAddItem.text = ""  //textfield 내용 초기화
        
        
        _ = navigationController?.popViewController(animated: true)
        // 완료 후 자동으로 목록으로 돌아가는 루트 뷰 컨트롤러 동작
        
        //add 버튼 동작. TableViewController 의 items 배열에 작성한 내용 보내기
    }
    
    

}
