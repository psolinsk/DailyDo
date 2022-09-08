//
//  SpaceViewController.swift
//  DailyDo
//
//  Created by Patryk Soliński on 27/08/2022.
//

import Foundation
import UIKit

class SpaceViewController:UIViewController, UITableViewDataSource {
    
    @IBOutlet var spaceTableView: UITableView!
    
    private func setRightNavigationBarItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(action(sender:))
        )
    }
    // MARK: tableView source: https://www.youtube.com/watch?v=R2Ng8Vj2yhY
    
    struct SpaceCellStruct {
        let title: String
    }
    
    let SpaceCellData: [SpaceCellStruct] = [
        SpaceCellStruct(title: "dupa123"),
        SpaceCellStruct(title: "dupa"),
        SpaceCellStruct(title: "dupa12assssd3"),
        SpaceCellStruct(title: "dupa12asd3"),
        SpaceCellStruct(title: "dupa123sdfd"),
        SpaceCellStruct(title: "dupa12"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRightNavigationBarItem()
        
        spaceTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SpaceCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let spaceCell = SpaceCellData[indexPath.row]
        let cell = spaceTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpaceTableViewCell
        cell.label.text = spaceCell.title
        return cell
    }
    
    @objc func action(sender: UIBarButtonItem!) {
        GlobalValues.tableViewCellIndicator += 1
        print(GlobalValues.tableViewCellIndicator)
    } /* MARK: actions for NavBar right item */
}
