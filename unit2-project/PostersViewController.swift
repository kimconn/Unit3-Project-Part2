//
//  PostersViewController.swift
//  unit2-project
//
//  Created by Kim Connolly on 2/9/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell

            // Use the indexPath.item to index into the albums array to get the corresponding album
            let poster = posters[indexPath.item]

            // Get the artwork image url
            let imageUrl = URL(string: Poster.posterBaseURLString + poster.poster_path)!

            // Set the image on the image view of the cell
            Nuke.loadImage(with: imageUrl, into: cell.posterImageView)

            return cell
    }
    
    
    var posters: [Poster] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=d4d4a9743e8f2c0784bc4905a14d6704")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // Create a JSON Decoder
            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(PosterSearchResponse.self, from: data)
                let posters = response.results
                print(posters)
                
                DispatchQueue.main.async {
                    self?.posters = posters
                    self?.collectionView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }

        // Initiate the network request
        task.resume()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 0

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 0

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3
        let numberOfRows: CGFloat = 4

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        //let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        let width = (collectionView.bounds.width) / numberOfColumns
        let height = (collectionView.bounds.height) / numberOfRows

        // Set the size that each item/cell should display at
        layout.itemSize = CGSize(width: width, height: height)
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
}
