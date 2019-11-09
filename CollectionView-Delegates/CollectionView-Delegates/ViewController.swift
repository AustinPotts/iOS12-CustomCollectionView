//
//  ViewController.swift
//  CollectionView-Delegates
//
//  Created by Austin Potts on 11/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//MARK: - Add Model for Mock Data




class ViewController: UIViewController {

    //MARK: - Declare array values for the Model Mock Data (Use Asset Images)
    
    
    
    
    
    fileprivate let collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.translatesAutoresizingMaskIntoConstraints = false
         cv.register(UICollectionView.self, forCellWithReuseIdentifier: "cell")
         return cv
     }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         view.addSubview(collectionView)
                collectionView.backgroundColor = .clear
                collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 245).isActive = true
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0).isActive = true
                
          //collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        
        
      //MARK: - Call the delegate
              
        
    }
    

}


    //MARK: Add Extension for the Delegation Process



       //MARK: Create Custom Segue 







    //MARK: Add Class for Custom Cell
