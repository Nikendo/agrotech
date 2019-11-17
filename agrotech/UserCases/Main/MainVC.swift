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
        return UITableView(frame: .zero, style: .grouped)
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
        view.addSubview(tableView)
        tableView.activateAnchors()
        tableView.topAnchor(to: view.topAnchor)
            .leadingAnchor(to: view.leadingAnchor)
            .trailingAnchor(to: view.trailingAnchor)
            .bottomAnchor(to: view.bottomAnchor)
        tableView.tableFooterView = UIView()
        tableView.register(BrandCell.nib, forCellReuseIdentifier: BrandCell.identifier)
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        view.backgroundColor = UIColor.white//.withAlphaComponent(0.8)
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
        let defCell = UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BrandCell") as? BrandCell, let brand = presenter?.getTableData().brands[indexPath.row] else {
            return defCell
        }
        
        cell.configure(text: brand.name, image: brand.logo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: \(tableView.cellForRow(at: indexPath)?.textLabel?.text ?? "none")")
        guard let brand = presenter?.getTableData().brands[indexPath.row] else { return }
        navigateTo(brand: brand)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}
