//
//  MainVC.swift
//  agrotech
//
//  Created by n.shmatov on 12.11.2019.
//  Copyright © 2019 n.shmatov. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    var presenter: MainPresenterInput?
    
    private lazy var tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter()
        presenter?.viewDidLoad()
        setup()
    }

}

private extension MainVC {
    func setup() {
        setupUI()
    }
    
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.activateAnchors()
        tableView.topAnchor(to: view.topAnchor)
            .leadingAnchor(to: view.leadingAnchor)
            .trailingAnchor(to: view.trailingAnchor)
            .bottomAnchor(to: view.bottomAnchor)
        tableView.tableFooterView = UIView()
    }
    
    func navigateTo(brand: BrandModel) {
        let vc = BrandInfoVC()
        vc.setBrand(brand: brand)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainVC: MainPresenterOutput {
    
}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getTableData().brands.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        defCell.textLabel?.text = presenter?.getTableData().brands[indexPath.row].name
        defCell.selectionStyle = .none
        return defCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: \(tableView.cellForRow(at: indexPath)?.textLabel?.text ?? "none")")
        guard let brand = presenter?.getTableData().brands[indexPath.row] else { return }
        navigateTo(brand: brand)
    }
}
