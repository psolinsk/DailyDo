//
//  SpaceViewController.swift
//  DailyDo
//
//  Created by Patryk Soliński on 27/08/2022.
//

import Foundation
import UIKit
import CoreData

class SpaceViewController:UIViewController {
    
    private lazy var tableView: GenericTableView<SpaceTableViewCell, Folder> = {
        let sortD = [NSSortDescriptor(key: "title", ascending: true)]
        let dataProvider = DataProvider<Folder>(managedObjectContex: CoreDataManager.shared.managedObjectContext, sortDescriptors: sortD)
        
        let v = GenericTableView<SpaceTableViewCell, Folder>(dataProvider: dataProvider) { (cell, folder) in cell.model = folder } selectionHandler: { [weak self] (folder) in guard let strongSelf = self, let folderTitle = folder.title else { return }
            // launch folder items view controller
            print(folderTitle)
        }
        return v
    }()
    
    private lazy var addNewButton: UIButton = {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    @IBOutlet weak var spaceTableView: UITableView!
    
    @IBAction func addSpacePlusButton(_ sender: UIBarButtonItem) {
        let vc = AddNewItemVC()
        vc.deleagte = self
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addSpacePlusButton(_:)))
        
        tableView.performFetch()
    }
}

extension SpaceViewController: AddNewItemVCDelegate {
    func saveNewItem(item: String) {
        CoreDataManager.shared.saveFolder(name: item)
        tableView.performFetch()
    }
}
