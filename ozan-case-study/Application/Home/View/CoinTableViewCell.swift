//
//  CoinTableViewCell.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

import UIKit
import WebKit

final class CoinTableViewCell: UITableViewCell {

    static let reuseId = String(describing: CoinTableViewCell.self)
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    var viewModel: CoinCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        containerView.layer.cornerRadius = 8
    }
    
    func configure(with viewModel: CoinCellViewModel?) {
        guard let viewModel = viewModel else { return }
        self.viewModel = viewModel
        symbolLabel.text = viewModel.symbolText
        nameLabel.text = viewModel.nameText
        priceLabel.text = viewModel.formattedPriceText
        changeLabel.attributedText = viewModel.changeText
    }
}
