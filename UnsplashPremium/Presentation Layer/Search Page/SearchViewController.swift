//
//  SearchViewController.swift
//  UnsplashPremium
//
//  Created by user on 25.04.2022.
//

import UIKit

class SearchViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.setTitle("search", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(searchResults), for: .touchUpInside)
        button.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    

    @objc private func searchResults() {
        let rootVC = SearchResultViewController()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .currentContext
        present(navigationVC, animated: false)
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
