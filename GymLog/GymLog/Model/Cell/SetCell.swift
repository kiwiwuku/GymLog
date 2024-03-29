//
//  WorkoutCell.swift
//  GymLog
//
//  Created by Вика on 8/15/22.
//

import Foundation
import UIKit

class SetCell: UITableViewCell {
    
    public var setWorkout: WorkoutSet? {
        didSet {
            weightTextField.text = String(setWorkout?.weight ?? 0)
            repsTextField.text = String(setWorkout?.reps ?? 0)
        }
    }

    private let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        return v
    }()
    
    private let weightTextField: UITextField = {
        let tf = UITextField()
        tf.tintColor = .black
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 24)
        tf.textAlignment = .center
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let repsTextField: UITextField = {
        let tf = UITextField()
        tf.tintColor = .black
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 24)
        tf.textAlignment = .center
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let xLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "x"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(container)
        container.addSubview(weightTextField)
        container.addSubview(repsTextField)
        
        container.addSubview(xLabel)

        weightTextField.isUserInteractionEnabled = false
        repsTextField.isUserInteractionEnabled = false
        
        weightTextField.keyboardType = .numberPad
        repsTextField.keyboardType = .numberPad
        
        weightTextField.delegate = self
        repsTextField.delegate = self
        
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func turnOnEditing(){
        weightTextField.isUserInteractionEnabled = true
        repsTextField.isUserInteractionEnabled = true
    }
    
    private func setConstrains(){
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            container.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            xLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            weightTextField.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            weightTextField.centerXAnchor.constraint(equalTo: xLabel.leadingAnchor, constant: -70),
            weightTextField.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            repsTextField.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            repsTextField.centerXAnchor.constraint(equalTo: xLabel.trailingAnchor, constant: 70),
            repsTextField.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SetCell: UITextFieldDelegate {
    // auto selection of text in textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.selectAll(nil)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if setWorkout != nil {
            CoreDataManager.shared.updateWorkoutSet(set: setWorkout!, weight: Int(weightTextField.text ?? "0") ?? 0, reps: Int(repsTextField.text ?? "0") ?? 0)
        }
    }
}
