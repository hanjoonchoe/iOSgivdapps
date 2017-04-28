//
//  ViewController.swift
//  GiveDapps-new
//
//  Created by Hanjoon Choe on 4/7/17.
//  Copyright © 2017 Hanjoon Choe. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        
        
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    let cellId = "cellId"
    let loginCellId = "loginCellId"
    
    let pages: [Page] = {
        
        let firstPage = Page(title: "Feel Your Impact", message: "With GivDapps the causes are fullfiled by us. Your impact will be felt 100%.\nGivDapps takes 0% of your donation!", imageName: "intro1")
        let secondPage = Page(title: "Hear the Story", message: "GivDapps tells the story of people in need.\nAll causes are backed by local non-profits.", imageName: "intro1")
        let thirdPage = Page(title: "Finish Challenges", message: "Track your running and cycling miles, and local businesses will put up cash for every mile you accomplish", imageName: "intro1")

        
        return [firstPage, secondPage, thirdPage]
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = UIColor(white: 1, alpha: 0.5)
        pc.currentPageIndicatorTintColor = UIColor(white: 1, alpha: 1)
        pc.numberOfPages = self.pages.count
        return pc
    }()
    
    let getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(UIColor(white:1, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 251/255, green: 173/255, blue: 61/255, alpha: 1)
        return button
    }()
    
    /*lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for:.normal)
        button.setTitleColor(UIColor(red: 247/255, green: 30/255, blue: 30/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(skip), for: .touchUpInside)
        return button
    }()
    
    func skip() {
        pageControl.currentPage = pages.count - 1
        nextPage()
    }
    
    func nextPage () {
        
        if pageControl.currentPage == pages.count {

            return
        }
        
        if pageControl.currentPage == pages.count - 1 {
            skipButtonTopAnchor?.constant = -40
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()}, completion: nil)


            
        }
        
    
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage += 1
    }*/
    var skipButtonTopAnchor: NSLayoutConstraint?
    var pageControlBottomAnchor: NSLayoutConstraint?
    
    
    let mainImageView: UIImageView = {
        let image = UIImage(named: "backgroundimg")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //observeKeyboardNotifications()
        view.addSubview(mainImageView)
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(getStartedButton)
        //view.addSubview(skipButton)
        
        
        
        getStartedButton.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 70, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
        mainImageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        /*skipButtonTopAnchor = skipButton.anchorWithReturnAnchors(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50).first
       */
        
        pageControlBottomAnchor = pageControl.anchorWithReturnAnchors(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]
        

        collectionView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 70, leftConstant: 70, bottomConstant: 150, rightConstant: 70, widthConstant: 0, heightConstant: 0)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor)
        
        registerCells()
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
     func  observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
        
    }
    func keyboardShow() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: -130, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / collectionView.frame.width)
        pageControl.currentPage = pageNumber
        
        // we are on the last page
        if pageNumber == pages.count {
            skipButtonTopAnchor?.constant = -40
            pageControlBottomAnchor?.constant = 40
        }
        else {
            
            skipButtonTopAnchor?.constant = 16
            pageControlBottomAnchor?.constant = 0
            
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: { 
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    
    
     fileprivate func registerCells() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        //collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginCellId)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       /* if indexPath.item == pages.count {
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath)
            return loginCell
        }*/
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[(indexPath as NSIndexPath).item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
        let indexPath = IndexPath(item:  pageControl.currentPage, section: 0)
        DispatchQueue.main.async {
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
