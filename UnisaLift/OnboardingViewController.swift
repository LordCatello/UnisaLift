//
//  OnboardingViewController.swift
//  UnisaLift
//
//  Created by Cafaro Davide on 21/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func createSlides() -> [OnboardingSlide] {
        
        let slide1: OnboardingSlide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! OnboardingSlide
        slide1.imageView.image = UIImage(named: "ic_onboarding_1")
        slide1.labelTitle.text = "Welcome to UniLift!"
        slide1.labelDesc.text = "Get to university and back without hassle!\nGet a lift from your fellow students, or give them one."
        
        let slide2: OnboardingSlide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! OnboardingSlide
        slide2.imageView.image = UIImage(named: "ic_onboarding_2")
        slide2.labelTitle.text = "Never wait for a bus again"
        slide2.labelDesc.text = "Agree to a common time schedule with your friends... or get to know more interesting people!"
        
        let slide3: OnboardingSlide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! OnboardingSlide
        slide3.imageView.image = UIImage(named: "ic_onboarding_3")
        slide3.labelTitle.text = "Offer a lift and share your car"
        slide3.labelDesc.text = "By giving lifts you will never be alone in rides again.\nSee it as an opportunity to socialize!"
        
        let slide4: OnboardingSlide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! OnboardingSlide
        slide4.imageView.image = UIImage(named: "ic_onboarding_4")
        slide4.labelTitle.text = "Reduce your costs"
        slide4.labelDesc.text = "And if socializing isn't your thing... well, you can still share your expenses."
        
        
        let slide5: OnboardingSlide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! OnboardingSlide
        slide5.imageView.image = UIImage(named: "ic_onboarding_5")
        slide5.labelTitle.text = "Become eco-friendly"
        slide5.labelDesc.text = "By sharing seats you will reduce the vehicles in the roads.\nThink about it: you will be actively contributing to the environment!"
        
        return [slide1, slide2, slide3, slide4, slide5]
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
