//
//  MovieCell.swift
//  unit2-project
//
//  Created by Kim Connolly on 2/8/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var OverviewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    /// Configures the cell's UI for the given movie.
    func configure(with movie: Movie) {
        TitleLabel.text = movie.original_title
        OverviewLabel.text = movie.overview
//        posterImageView = movie.poster_path
        
        
        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString + movie.poster_path)!, into: posterImageView)

    }
}
