//
//  DeleteСonfirmationViewController.swift
//  GymLog
//
//  Created by Вика on 8/24/22.
//

import UIKit

class DeleteConfirmationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //half screen presentation
        self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 5 * 3, width: self.view.bounds.width, height: UIScreen.main.bounds.height / 5 * 2)
                        self.view.layer.cornerRadius = 20
                        self.view.layer.masksToBounds = true
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Are you sure?"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "This action cannot be undone"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .lightGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cancelButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("Cancel", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        
        btn.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        btn.layer.cornerRadius = 15
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let deleteButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("Delete", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        
        btn.backgroundColor = .systemRed
        
        btn.layer.cornerRadius = 15
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setup(){
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        view.addSubview(cancelButton)
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 45),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            cancelButton.heightAnchor.constraint(equalToConstant: 70),
            cancelButton.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        view.addSubview(deleteButton)
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 45),
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            deleteButton.heightAnchor.constraint(equalToConstant: 70),
            deleteButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    @objc func cancelButtonTapped(){
        self.dismiss(animated: true)
    }
    
    @objc func deleteButtonTapped(){
        self.dismiss(animated: true)
    }
}
