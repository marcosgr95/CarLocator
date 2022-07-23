//
//  CarListTableViewCell.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 23/7/22.
//

import UIKit

class CarListTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet var activenessIndicator: UIView!
    @IBOutlet var activenessLabel: UILabel!
    @IBOutlet var mainView: UIView!
    @IBOutlet var carInfoLabel: UILabel!
    @IBOutlet var labels: [UILabel]!

    // MARK: - Methods

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8))
    }

    func setUp(_ car: CarViewModel) {
        mainView.backgroundColor = UIColor.bgColor
        mainView.layer.cornerRadius = 8
        
        activenessIndicator.layer.cornerRadius = activenessIndicator.frame.width / 2
        activenessIndicator.backgroundColor = car.active ? .green : .red
        activenessLabel.text = car.active ? CarState.active.rawValue : CarState.inactive.rawValue
        carInfoLabel.text = String(type: car.type, location: (car.location.0, car.location.1))

        activenessLabel.textColor = .gray
        carInfoLabel.textColor = .white

        labels.forEach { $0.font = UIFont.muktaMedium() }
    }
    
}
