//
//  ArticleTableViewCell.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtCreateAt: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var title: String?{
        didSet{
            self.txtTitle.text = title
        }
    }
    
    var createAt: String?{
        didSet{
            self.txtCreateAt.text = createAt
        }
    }
}
