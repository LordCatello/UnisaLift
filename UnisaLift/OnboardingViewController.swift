//
//  OnboardingViewController.swift
//  UnisaLift
//
//  Created by Cafaro Davide on 21/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var endTutorialButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var systemBlue: UIColor!
    
    var slides = [OnboardingSlide]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endTutorialButton.setTitle("Skip", for: .normal)
        systemBlue = endTutorialButton.currentTitleColor
        
        scrollView.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    func createSlides() -> [OnboardingSlide] {
        
        let slide1: OnboardingSlide = Bundle.main.loadNibNamed("OnboardingSlide", owner: self, options: nil)?.first as! OnboardingSlide
        slide1.imageView.image = UIImage(named: "tutorialImages/littleIcon")
        slide1.imageView.contentMode = .center
        slide1.labelTitle.text = "Welcome to UniLift!"
        slide1.labelDesc.text = "Get to university and back without hassle!\r\nGet a lift from your fellow students, or give them one."
        slide1.labelDesc.numberOfLines = 0
        slide1.labelTitle.numberOfLines = 0
        
        
        let slide2: OnboardingSlide = Bundle.main.loadNibNamed("OnboardingSlide", owner: self, options: nil)?.first as! OnboardingSlide
        slide2.imageView.image = UIImage(named: "tutorialImages/time")
        slide2.labelTitle.text = "Never wait for a bus again"
        slide2.labelDesc.text = "Agree to a common time schedule with your friends... or get to know more interesting people!"
        slide2.labelDesc.numberOfLines = 0
        slide2.labelTitle.numberOfLines = 0
        
        
        let slide3: OnboardingSlide = Bundle.main.loadNibNamed("OnboardingSlide", owner: self, options: nil)?.first as! OnboardingSlide
        slide3.imageView.image = UIImage(named: "tutorialImages/friendship")
        slide3.labelTitle.text = "Offer a lift and share your car"
        slide3.labelDesc.text = "By giving lifts you will never be alone in rides again.\r\nSee it as an opportunity to socialize making new friends!"
        slide3.labelDesc.numberOfLines = 0
        slide3.labelTitle.numberOfLines = 0
        
        
        let slide4: OnboardingSlide = Bundle.main.loadNibNamed("OnboardingSlide", owner: self, options: nil)?.first as! OnboardingSlide
        slide4.imageView.image = UIImage(named: "tutorialImages/money")
        slide4.labelTitle.text = "Reduce your costs"
        slide4.labelDesc.text = "And if socializing isn't your thing... well, you can still share your expenses."
        slide4.labelDesc.numberOfLines = 0
        slide4.labelTitle.numberOfLines = 0
        
        
        let slide5: OnboardingSlide = Bundle.main.loadNibNamed("OnboardingSlide", owner: self, options: nil)?.first as! OnboardingSlide
        slide5.imageView.image = UIImage(named: "tutorialImages/environment")
        slide5.labelTitle.text = "Become eco-friendly"
        slide5.labelDesc.text = "By sharing seats you will reduce the vehicles in the roads.\r\nThink about it: you will be actively contributing to the environment!"
        slide5.labelDesc.numberOfLines = 0
        slide5.labelTitle.numberOfLines = 0
        
        let slides = [slide1, slide2, slide3, slide4, slide5]
        
    
        
        return slides
    }
    
    
    func setupSlideScrollView(slides : [OnboardingSlide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    
    // default function called when view is scrolled
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // THIS LOCKS THE DIRECTION OF SCROLLING TO HORIZONTAL, FOR THE LOVE OF GOD WHY WAS IT SO DIFFICULT TO FIND?
        if scrollView.contentOffset.y != 0 {
            scrollView.contentOffset.y = 0
        }
        
        
        
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        /*
         * below code changes the background color of view on paging the scrollview
         */
        //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        
        
        /*
         * below code scales the imageview on paging the scrollview
         */
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            endTutorialButton.setTitle("Skip", for: .normal)
            endTutorialButton.setTitleColor(systemBlue, for: .normal)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            endTutorialButton.setTitle("Skip", for: .normal)
            endTutorialButton.setTitleColor(systemBlue, for: .normal)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            endTutorialButton.setTitle("Skip", for: .normal)
            endTutorialButton.setTitleColor(systemBlue, for: .normal)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
            endTutorialButton.setTitle("Next", for: .normal)
            endTutorialButton.setTitleColor(AppDelegate.defaultColor, for: .normal)
        }
    }
    
    @IBAction func endTutorialButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "endTutorial", sender: nil)
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
