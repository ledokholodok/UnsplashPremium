//
//  MenuBar.swift
//  UnsplashPremium
//
//  Created by user on 26.04.2022.
//

import UIKit
import SnapKit

class TopicBar: UIView {
    
    private var topics = [Topic]() {
        didSet {
            print(topics)
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 5
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collectionView.register(TopicCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let selectedIndexPath = NSIndexPath( )
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .left)
        setUpHorizontalBarView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTopics(with topics: [Topic]) {
        self.topics = [Topic(id: nil, title: "Editorial")] + topics
    }
    private func setUpHorizontalBarView() {
        let horizontalView = UIView()
        horizontalView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        addSubview(horizontalView)
        horizontalView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(4)
        }
    }
    
}

extension TopicBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopicCell
        cell.setLabeltext(with: topics[indexPath.row].title)
        return cell
    }
}
extension TopicBar: UICollectionViewDelegate {
    
}
