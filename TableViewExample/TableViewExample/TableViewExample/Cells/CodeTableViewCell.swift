//
//  CodeTableViewCell.swift
//  TableViewExample
//
//  Created by Andrey Korotkov on 12.10.2021.
//

import UIKit

final class CodeTableViewCell: UITableViewCell {

    private var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.random
        view.layer.cornerRadius = 8
        return view
    }()
    
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configurre(with title: String) {
        infoLabel.text = title
    }

    func setupUI() {
        selectionStyle = .none
        colorView.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(colorView)
        colorView.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            colorView.heightAnchor.constraint(equalToConstant: 72),
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            infoLabel.heightAnchor.constraint(equalToConstant: 56),
            infoLabel.topAnchor.constraint(equalTo: colorView.topAnchor, constant: 8),
            infoLabel.bottomAnchor.constraint(equalTo: colorView.bottomAnchor, constant: -8),
            infoLabel.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 8),
            infoLabel.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -8)
        ])
    }
}
