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
    
    @IBOutlet weak var spaceTableView: UITableView!
    
    @IBAction func addSpacePlusButton(_ sender: UIBarButtonItem) {
        
        let newSpaceAlert = UIAlertController(title: "New Space", message: "Add name for Space", preferredStyle: .alert)
        
        let addSapceAction = UIAlertAction(title: "Add", style: .default) {
            [unowned self ] action in
            
            guard let textField = newSpaceAlert.textFields?.first,
                  let spaceToSave = textField.text else {
                      return
                  }
            self.save(name: spaceToSave)
            self.spaceTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        newSpaceAlert.addTextField()
        newSpaceAlert.addAction(addSapceAction)
        newSpaceAlert.addAction(cancelAction)
        
        present(newSpaceAlert, animated: true)
    }
    
    func save(name: String) {
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
      }

      let managedContext = appDelegate.persistentContainer.viewContext
      
      // 2
      let entity =
        NSEntityDescription.entity(forEntityName: "Spaces",
                                   in: managedContext)!
      
      let space = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
      
      // 3
      space.setValue(name, forKeyPath: "spaceName")
      
      // 4
      do {
        try managedContext.save()
        spacesCellName.append(space)
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
      }
    }

    
    var spacesCellName:[NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "dupa 123" MARK: tittle for VC display name
        
        spaceTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addSpacePlusButton(_:)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      //1
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
          return
      }
      
      let managedContext =
        appDelegate.persistentContainer.viewContext
      
      //2
      let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Spaces")
      
      //3
      do {
        spacesCellName = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
    }
}

extension SpaceViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spacesCellName.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let spaceName = spacesCellName[indexPath.row]
        let cell = spaceTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = spaceName.value(forKeyPath: "spaceName") as? String
        return cell
    }
}
