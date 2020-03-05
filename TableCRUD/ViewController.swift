//
//  ViewController.swift
//  TableCRUD
//
//  Created by zino-mac on 2020/03/05.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var t_name: UITextField!
    
    @IBOutlet weak var t_gender: UITextField!
    
    @IBOutlet weak var t_age: UITextField!
    
    @IBAction func btnClick(_ sender: Any) {
        regist()
    }
    
    //테이블 리스트의 레퍼런스
    var memberListController:MemberListController!
    
    
    //회원1명을 담을 구조체 인스턴스 생성 후 배열에탑재
    func regist(){
        var name = t_name.text!
        var gender = t_gender.text!
        var age = Int(t_age.text!)!
        
        //구조체 생성
        let member = Member(name: name, gender: gender, age: age)
        
        
        //배열에 담자!!
    memberListController.memberArray.append(member)
        
        print("누적회원수는 ", memberListController.memberArray.count)
        
        //tableView 갱신
    memberListController.tableView.reloadData()
        
        //등록 후 목록, 프로그래밍적으로 이동하기
    self.navigationController?.popToRootViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //뷰가 보여질때 한번 해놓자!!
        //그래야 나중에 두고 두고 써먹는다
        memberListController = self.navigationController?.viewControllers[0] as! MemberListController
        
    }


}

