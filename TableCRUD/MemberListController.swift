//
//  MemberListController.swift
//  TableCRUD
//
//  Created by zino-mac on 2020/03/05.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

//회원을 표현한 구조체 정의!!
//이 구조체의 인스턴스 1개가 회원 1명을 담는다
class Member{
    var name:String
    var gender:String
    var age:Int
    
    //구조체와는 달리, 클래스는 개발자가 초기화 메서드를
    //정의해야 함!!
    init(name:String, gender:String,age:Int){
        self.name = name
        self.gender = gender
        self.age = age
    }
}

class MemberListController: UITableViewController {
    
    //구조체 인스턴스를 담게될 배열
    var memberArray:Array=Array<Member>()
    var selectedIndex:Int = 0//유저가 선택한 인덱스
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memberArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        //구조체 인스턴스 1개 반환됨..여기서 이름만
        //선택하여 출력
        let member = memberArray[indexPath.row]
        
        cell.textLabel!.text=member.name;
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //매개변수 sender는 이벤트를 일으킨 이벤트소스
        //즉 이벤트 일으킨 컴포넌트이다..여기선 셀이다
        print("셀 선택햇어?")
        
        if segue.identifier == "detailSeg"{
            let cell = sender as! UITableViewCell
            //몇번째 셀인지 , 셀의 index를 조사해서
            //배열중 몇번째 구조체를 끄집어 낼지 결정
            
            //선택한 셀의 인덱스 구하기!!
            let indexPath = self.tableView.indexPath(for: cell)
            
            print("당신이 선택한 셀의 인덱스는", indexPath!.row)
            
            selectedIndex = indexPath!.row
            
            //배열에서 구조체 하나 꺼내기
            let member = memberArray[indexPath!.row]
            
            //꺼낸 구조체를 상세보기 컨트롤러에 전달
            let detailViewController = segue.destination as! DetailViewController
            
            detailViewController.member = member
        }
    }
    

}
