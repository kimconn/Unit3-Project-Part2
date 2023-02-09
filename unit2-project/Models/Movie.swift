//
//  Movie.swift
//  unit2-project
//
//  Created by Kim Connolly on 2/8/23.
//

import Foundation


// TODO: Pt 1 - Create a Track model struct

//movies property
struct Movie {
    let original_title: String
    let overview: String
    let poster_path: URL
    
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
 
}

// TODO: Pt 1 - Create an extension with a mock tracks static var

extension Movie {

    /// An array of mock tracks
    static var mockMovies: [Movie]  = [
        Movie(original_title: "M3GAN",
              overview: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
              poster_path: URL(string:"https://dx35vtwkllhj9.cloudfront.net/universalstudios/megan/images/regions/us/onesheet.jpg")!,
              vote_average:7.6,
              vote_count:1368,
              popularity:2438.483 ),
        Movie(original_title: "Transfusion",
              overview: "Ryan Logan, a former Special Forces operative, is battling to cope with life after the loss of his wife.  He is thrusted into the criminal underworld to keep his only son from being taken from him.",
              poster_path: URL(string: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTFyij9307CpH8TU048gCQFiH6E2WnAt9uPlBZ176YavSc_n97q")!,
              vote_average:6.8,
              vote_count:38,
              popularity:2334.844 ),
        Movie(original_title: "Detective Knight: Independence",
              overview: "Detective James Knight 's last-minute assignment to the Independence Day shift turns into a race to stop an unbalanced ambulance EMT from imperiling the city's festivities. The misguided vigilante, playing cop with a stolen gun and uniform, has a bank vault full of reasons to put on his own fireworks show... one that will strike dangerously close to Knight's home.",
              poster_path: URL(string: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQfiWXmDdp8eo6aoscFXAAH1xZz_jVpPVvLghbFHZE5JnKeAMgO")!,
              vote_average:7,
              vote_count:27,
              popularity: 2321.607)
        
        
    ]

    // We can now access this array of mock tracks anywhere like this:
    // let tracks = Tracks.mockTracks
}//movie
