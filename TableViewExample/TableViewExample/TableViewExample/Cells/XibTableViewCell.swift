//
//  XibTableViewCell.swift
//  TableViewExample
//
//  Created by Andrey Korotkov on 12.10.2021.
//

import UIKit

final class XibTableViewCell: UITableViewCell {

    @IBOutlet private var colorView: UIView!
    @IBOutlet private var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configurre(with title: String) {
        infoLabel.text = title
    }

    func setupUI() {
        selectionStyle = .none
        colorView.backgroundColor = Color.random
        colorView.layer.cornerRadius = 8
        
        infoLabel.textColor = .white
        infoLabel.textAlignment = .center
        infoLabel.font = .systemFont(ofSize: 22)
    }
}
