//
//  DiscountOfferTableViewCell.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import UIKit
import ImageSlideshow
import AlamofireImage

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var slideshow: ImageSlideshow!
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var headers: UIView!
    @IBOutlet weak var filters: UIView!

    func setup(_ offers: [Offer]) {
        
        slideshow.slideshowInterval = 2.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .customBottom(padding: 20))
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.pageIndicator = pageControl
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self
        
        if offers.count == 0 {
            slideshow.setImageInputs([
                ImageSource(image: UIImage(named: "offer")!)
            ])
        }else {
            // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
            slideshow.setImageInputs(offers.map { AlamofireSource(urlString:$0.imageUrl!)} as! [InputSource])
        }
        
        
        headerContainer.roundCorners([.topLeft, .topRight], radius: 15)
        
    }

}

extension HeaderTableViewCell: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
    }
}
