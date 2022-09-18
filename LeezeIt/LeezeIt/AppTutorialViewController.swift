//
//  AppTutorialViewController.swift
//  LeezeIt
//
//  Created by Riffat Khan on 9/17/22.
//

import UIKit

class AppTutorialViewController: UIPageViewController ,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    
    
    lazy var orderedViewControllers :[UIViewController] = {
        return [self.newVc(viewController: "FirstTutorialViewController"),
                self.newVc(viewController: "SecondViewController")]
    }()
    
    var pageControll = UIPageControl()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.dataSource = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],direction: .forward, animated: true, completion:nil)
        }
        
        self.delegate = self
        configurePageControll()
    }
    
    func configurePageControll() {
        pageControll = UIPageControl(frame: CGRect(x:0 , y: 350, width:UIScreen.main.bounds.width , height:200 ))
        pageControll.numberOfPages = orderedViewControllers.count
        pageControll.pageIndicatorTintColor = UIColor.systemGray
        pageControll.currentPageIndicatorTintColor = UIColor.systemMint

        self.view.addSubview(pageControll)
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewControllers.count != nextIndex else {
            return nil
        }
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
    
    func newVc(viewController:String)->UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished:Bool, previousViewControllers previousViewController: [UIViewController], transitionCompleted completed : Bool)  {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControll.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController)!
    }
}
