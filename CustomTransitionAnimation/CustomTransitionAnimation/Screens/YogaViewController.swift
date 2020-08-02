//
//  ViewController.swift
//  CustomTransitionAnimation
//
//  Created by Ravi Raja Jangid on 29/07/20.
//  Copyright © 2020 Ravi Raja Jangid. All rights reserved.
//

import UIKit
protocol TransiningDelegate: UIViewController {
    var animatableRatingViewWidthConstraint: NSLayoutConstraint? {get}
    var startingRatingViewWidthConstraint:CGFloat {get}
    var endRatingViewWidthConstraint:CGFloat {get}
    
    var startingImageHeightConstraint:CGFloat {get}
    var endImageHeightConstraint:CGFloat {get}
    var animatableImageHeightConstraint: NSLayoutConstraint? {get}
}

class YogaViewController: UIViewController {
    
    @IBOutlet weak var constraintHeaderImageHeight: NSLayoutConstraint!
    
    @IBOutlet weak var constraintRatingViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var navBar: UIView!{
        didSet {
            navBar.addGradientBackground(firstColor: UIColor.black.withAlphaComponent(0.1), secondColor: UIColor.clear, cornerRadius: 30.0)
        }
    }
    
    @IBOutlet weak var imageViewHeaderImage: UIImageView!{
        didSet {
            imageViewHeaderImage.roundBottomCorner(cornerRadius: 62)
            imageViewHeaderImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var viewRating: UIView!{
        didSet {
            viewRating.layer.cornerRadius = viewRating.frame.size.height/2
            viewRating.addShadow(shadowOffset:  CGSize(width: 0, height: 8))
        }
    }
    
    @IBOutlet weak var labelRating: UILabel!{
        didSet {
            labelRating.font = UIFont.Ubantu( size: 14)
            labelRating.textColor = AppColor.black
        }
    }
    @IBOutlet weak var labelRatingValue: UILabel!{
        didSet {
            labelRatingValue.font = UIFont.Ubantu( size: 15)
            labelRatingValue.textColor = AppColor.Brown
        }
    }
    
    @IBOutlet weak var labelResortName: UILabel!{
        didSet {
            labelResortName.font = UIFont.Ubantu(.bold, size: 20)
            labelResortName.textColor = AppColor.black
        }
    }
    
    @IBOutlet weak var labelResortAddress: UILabel!{
        didSet {
            labelResortAddress.font = UIFont.Ubantu(.light, size: 14)
            labelResortAddress.textColor = AppColor.lightBrown
        }
    }
    @IBOutlet weak var buttonResortOnMap: UIButton!{
        didSet {
            buttonResortOnMap.titleLabel?.font = UIFont.Ubantu( size: 14)
            buttonResortOnMap.setTitleColor(AppColor.Brown, for: .normal )
        }
    }
    
    @IBOutlet weak var labelWeekDays: UILabel!{
        didSet {
            labelWeekDays.font = UIFont.Ubantu( size: 14)
            labelWeekDays.textColor = AppColor.black
        }
    }
    @IBOutlet weak var labelWeekDaysTime: UILabel!{
        didSet {
            labelWeekDaysTime.font = UIFont.Ubantu( size: 14)
            labelWeekDaysTime.textColor = AppColor.darkBrown
        }
    }
    @IBOutlet weak var labelWeekend: UILabel!{
        didSet {
            labelWeekend.font = UIFont.Ubantu( size: 14)
            labelWeekend.textColor = AppColor.black
        }
    }
    @IBOutlet weak var labelWeekendTime: UILabel!{
        didSet {
            labelWeekendTime.font = UIFont.Ubantu( size: 14)
            labelWeekendTime.textColor = AppColor.darkBrown
        }
    }
    
    @IBOutlet weak var labelOpenNow: UILabel!{
        didSet {
            labelOpenNow.font = UIFont.Ubantu(.bold ,size: 21)
            labelOpenNow.textColor = AppColor.darkBrown
        }
    }
    
    @IBOutlet weak var labelResortDescritopn: UILabel!{
        didSet {
            labelResortDescritopn.font = UIFont.Ubantu( size: 14)
            labelResortDescritopn.textColor = AppColor.black
        }
    }
    
    
    @IBOutlet weak var labelResortDescriptionText: UILabel!{
        didSet {
            labelResortDescriptionText.font = UIFont.Ubantu( size: 14)
            labelResortDescriptionText.textColor = AppColor.lightBrown
            labelResortDescriptionText.numberOfLines = 0
        }
    }
    @IBOutlet weak var buttonReviews: UIButton! {
        didSet {
            buttonReviews.titleLabel?.font = UIFont.Ubantu(.bold ,size: 16)
        }
    }
    var resort: Resort?
    override func viewDidLoad() {
        super.viewDidLoad()
         resort = Resort(name: "Efficitur Resort Yoga centre", address: "755 Brickyard St., Lake Zurich, IL 60047", weekDaysTime: "09.00 - 18.00", weekendTime: "09.00 - 18.00", description: "Integer ac interdum lacus. Nunc porta semper lacus a varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis", rating: "5.0")
        
        labelRatingValue.text = resort?.rating
        labelResortName.text = resort?.name
        labelResortAddress.text = resort?.address
        labelWeekendTime.text = resort?.weekendTime
        labelWeekDaysTime.text = resort?.weekDaysTime
        labelResortDescriptionText.text = resort?.description
    }
    ///Action Back Navigation
    @IBAction func actionBackNavigate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    ///Action Mark As Favorite to this resort
    @IBAction func actionMarkAsFavorite(_ sender: Any) {
        print("CTA Mark as Favorite")
    }
    
    ///Action Write Review
    @IBAction func actionWriteReviews(_ sender: Any) {
        print("CTA Write Reviews")
    }
    
    ///Action Mark As Favorite to this resort
    @IBAction func actionShowResortOnMap(_ sender: Any) {
        print("CTA Locate Resort on Map")
    }
}

extension YogaViewController: UIScrollViewDelegate {
    //Disable top empty area bounce
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.bounces = (scrollView.contentOffset.y > 0)
    }
}

extension YogaViewController: TransiningDelegate {
    
    //constraint to manupulate height of TopHeaderImageView
    var animatableImageHeightConstraint: NSLayoutConstraint? {
        return constraintHeaderImageHeight
    }
    
    //For Starting Frame of TopHeaderImageView
    var startingImageHeightConstraint: CGFloat {
        return 70
    }
    //For End Frame of TopHeaderImageView
    var endImageHeightConstraint: CGFloat {
        return 310
    }
    
    //constraint to manupulate height of RatingView
    var animatableRatingViewWidthConstraint: NSLayoutConstraint? {
        return constraintRatingViewWidth
    }
    
    //For Starting Frame of RatingView
    var startingRatingViewWidthConstraint: CGFloat {
        return 150
    }
    
    //For End Frame of RatingView
    var endRatingViewWidthConstraint: CGFloat {
        return 300
    }
}

