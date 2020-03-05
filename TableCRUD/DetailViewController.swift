//
//  DetailViewController.swift
//  TableCRUD
//
//  Created by zino-mac on 2020/03/05.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //구조체를 하나 선언해 두고, 이 구조체의 값은
    //외부에서 주입받자!!( injection 받자)
    var member:Member!
    
    var memberListController:MemberListController!
    
    @IBOutlet weak var t_name: UITextField!
    
    @IBOutlet weak var t_gender: UITextField!
    
    @IBOutlet weak var t_age: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memberListController = self.navigationController?.viewControllers[0] as! MemberListController
                
        //이 뷰로 넘어오기 전에 미리
        //prepare메서드를 재정의했으므로
        //구조체 값은 채워져있는 상태임
        t_name.text = member.name
        t_gender.text = member.gender
        t_age.text = String(member.age)
    }

    
    @IBAction func bt_edit(_ sender: Any) {
        //구조체와 클래스는 값과 레퍼런스라
        //는 차이점이 있따..
        
        //현재 보고있는 구조체 변경
        member.name = t_name.text!
        member.gender = t_gender.text!
        member.age = Int(t_age.text!)!
        
        //memberListController
        memberListController.tableView.reloadData()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func bt_del(_ sender: Any) {
        //현재 사용중인 클래스 인스턴스를 배열에서 삭제
        memberListController.memberArray.remove(at: memberListController.selectedIndex)
        
            //데이터 갱신 후 리스트로 이동!!
        memberListController.tableView.reloadData()
        self.navigationController?.popToRootViewController(animated: true)
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
