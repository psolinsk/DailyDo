//
//  AddItemViewController.swift
//  DailyDo
//
//  Created by Patryk Soliński on 21/09/2022.
//

import Foundation
import UIKit
import CoreData

protocol AddNewItemVCDelegate: class {
    func saveNewItem(item: String)
}

final class AddNewItemVC: UIViewController {
    
    weak var deleagte: AddNewItemVCDelegate?
    
    private lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        v.text = "Add New"
        v.textColor = .darkGray
        v.numberOfLines = 0
        return v
    }()
    
    private lazy var titleField: UITextField = {
        let v = UITextField()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.borderStyle = .roundedRect
        v.placeholder = "Add new item"
        return v
    }()
    
    private lazy var saveButton: UIButton = {
       let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.setTitle("Save", for: .normal)
        v.addTarget(self, action: #selector(didTapSave(_:)), for: .touchUpInside)
        v.setTitleColor(.white, for: .normal)
        v.backgroundColor = .blue
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        [titleLabel, titleField, saveButton].forEach{(v) in view.addSubview(v)}
        setupConstrains()
    }
    
    private func setupConstrains(){
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                     titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32)
                                    ])
        
        NSLayoutConstraint.activate([titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                     titleField.topAnchor.constraint(equalTo: view.topAnchor, constant: 8)
                                    ])
        
        NSLayoutConstraint.activate([saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                     saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
                                     saveButton.heightAnchor.constraint(equalToConstant: 50)
                                    ])
    }
    
    @objc private func didTapSave(_ sender: UIButton) {
        guard let text = titleField.text, !text.isEmpty else {
            return
        }
        
        deleagte?.saveNewItem(item: text)
        dismiss(animated: true, completion: nil)
    }
}
