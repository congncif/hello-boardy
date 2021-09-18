//
//  GHUserTableViewCell.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//

import SDWebImage
import UIKit

final class GHUserTableViewCell: UITableViewCell {
    @IBOutlet private var thumbnailView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension GHUserTableViewCell {
    func bind(_ viewModel: UserViewModel) {
        thumbnailView.sd_setImage(with: viewModel.avatarURL, completed: nil)
        titleLabel.text = viewModel.name
        descLabel.text = viewModel.homePage
    }
}
