//
//  DetailViewController.swift
//  unit2-project
//
//  Created by Kim Connolly on 2/8/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    //top:title -- left: vote average, total votes -- right: popularity -- bottom:description
    var movie: Movie!
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var votesAverageLabel: UILabel!
    @IBOutlet weak var votesCountLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var OverviewLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Pt 1 - Configure the UI elements with the passed in movie
        // Load the image located at the img URL and set it on the image view.
        Nuke.loadImage(with: movie.poster_path, into: posterImageView)
//
        //Set labels with the associated movie values.
        TitleLabel.text = movie.original_title
        votesAverageLabel.text = String("\(movie.vote_average) Vote Average")
        votesCountLabel.text = String("\(movie.vote_count) Votes")
        popularityLabel.text = String("\(movie.popularity) Popularity")
        OverviewLabel.text = movie.overview

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
