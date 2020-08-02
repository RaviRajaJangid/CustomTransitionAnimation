//
//  ViewController.swift
//  CustomTransitionAnimation
//
//  Created by Ravi Raja Jangid on 29/07/20.
//  Copyright © 2020 Ravi Raja Jangid. All rights reserved.
//

import UIKit

class YogaViewController: UIViewController {

    @IBOutlet weak var navBar: UIView!{
        didSet {
            navBar.addGradientBackground(firstColor: UIColor.black.withAlphaComponent(0.2), secondColor: UIColor.clear, cornerRadius: 30.0)
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
    
    @IBOutlet weak var labelReviews: UILabel!{
        didSet {
          labelReviews.font = UIFont.Ubantu( size: 14)
          labelReviews.textColor = AppColor.black
        }
    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
    }
///Action Back Navigation
    @IBAction func actionBackNavigate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
///Action Mark As Favorite to this resort
    @IBAction func actionMarkAsFavorite(_ sender: Any) {
        
    }
    
///Action Write Review
    @IBAction func actionWriteReviews(_ sender: Any) {
    }
}

