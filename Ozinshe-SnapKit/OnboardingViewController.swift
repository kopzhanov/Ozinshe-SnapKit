//
//  OnboardingViewController.swift
//  Ozinshe-SnapKit
//
//  Created by Alikhan Kopzhanov on 20.09.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    let arraySlides = [["firstSlide","Фильмдер, телехикаялар, ситкомдар, анимациялық жобалар, телебағдарламалар мен реалити-шоулар, аниме және тағы басқалары"],
                       ["secondSlide","Кез келген құрылғыдан қара\nСүйікті фильміңді  қосымша төлемсіз телефоннан, планшеттен, ноутбуктан қара"],
                        ["thirdSlide","Тіркелу оңай. Қазір тіркел де қалаған фильміңе қол жеткіз"]]
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "OnboardingCell")
        cv.backgroundColor = UIColor(named: "FFFFFF - 111827")
        cv.contentInsetAdjustmentBehavior = .never
        cv.isPagingEnabled = true
        cv.isScrollEnabled = true
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        
        cv.delegate = self
        cv.dataSource = self
        
        return cv
    }()
    
    lazy var pageControl = {
        let pc = UIPageControl()
        
        pc.numberOfPages = arraySlides.count
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = UIColor(red: 0.7, green: 0.46, blue: 0.97, alpha: 1)
        pc.pageIndicatorTintColor = UIColor(named:"D1D5DB - 4B5563")
        pc.contentVerticalAlignment = .center
        pc.contentHorizontalAlignment = .center
        
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationItem.title = ""
    }
    
    func setupUI(){
        view.backgroundColor = UIColor(named: "FFFFFF - 111827")
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(152)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func nextButtonTouched(){
        let signInViewController = storyboard?.instantiateViewController(identifier: "SignInViewController")
        navigationController?.show(signInViewController!, sender: self)
    }
}


//MARK: UICollectionViewDataSource & UICollectionViewDelegate & UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraySlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setData(slideInfo: arraySlides[indexPath.row])
        
        //Button configuration
        cell.skipButton.addTarget(self, action: #selector(nextButtonTouched), for: .touchUpInside)
        cell.nextButton.addTarget(self, action: #selector(nextButtonTouched), for: .touchUpInside)
        
        //Logic behind buttons
        if indexPath.row == 2{
            cell.skipButton.isHidden = true
            cell.nextButton.isHidden = false
        } else {
            cell.skipButton.isHidden = false
            cell.nextButton.isHidden = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(round(scrollView.contentOffset.x / view.frame.width))
    }
}
