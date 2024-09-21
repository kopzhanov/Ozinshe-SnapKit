//
//  OnboardingCollectionViewCell.swift
//  Ozinshe-SnapKit
//
//  Created by Alikhan Kopzhanov on 20.09.2024.
//

import UIKit
import SnapKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    func setData(slideInfo:[String]){
        imageView.image = UIImage(named: slideInfo[0])
        subtitleLabel.text = slideInfo[1]
    }
    
    let imageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    lazy var gradientView: GradientView = {
        let view = GradientView()
        
        view.startColor = .clear
        view.endColor = UIColor(named:"FFFFFF - 111827")!
        view.endColor = view.endColor.withAlphaComponent(1)
        view.startLocation = 0.1
        view.endLocation = 1
        
        return view
    }()
    
    let skipButton = {
        let button = UIButton()
        
        button.setTitle("Өткізу", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 12)
        button.backgroundColor = UIColor(named: "F9FAFB - 111827")
        button.setTitleColor(UIColor(named: "111827 - FFFFFF"), for: .normal)
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    let titleLabel = {
        let label = UILabel()
        
        label.text = "ÖZINŞE-ге қош келдің!"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textColor = UIColor(named: "111827 - FFFFFF")
        label.textAlignment = .center

        return label
    }()
    
    let subtitleLabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1.00)
        label.textAlignment = .center
        label.numberOfLines = 6
        
        return label
    }()
    
    let nextButton = {
        let button = UIButton()
        
        button.setTitle("Әрі қарай", for: .normal)
        button.isHidden = true
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.backgroundColor = UIColor(red: 0.49, green: 0.18, blue: 0.99, alpha: 1.00)
        button.setTitleColor(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00), for: .normal)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        imageView.addSubview(gradientView)
        contentView.addSubview(imageView)
        contentView.addSubview(skipButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(nextButton)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(308)
        }
        
        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        skipButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(24)
            make.width.equalTo(70)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom).inset(2)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(72)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
            make.width.equalTo(327)
        }
    }
}
