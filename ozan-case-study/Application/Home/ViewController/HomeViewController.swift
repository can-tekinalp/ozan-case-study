//
//  HomeViewController.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        viewModel.fetchList()
    }
    
    private func setupBindings() {
        viewModel.stateChangedHandler = { [weak self] state in
            self?.handleStateChanged(state)
        }
    }
    
    private func handleStateChanged(_ state: HomeViewModel.States) {
        switch state {
        case .loading(let isLoading):
            isLoading ? showLoadingIndicator() : hideLoadingIndicator()
        case .receivedError(let errorMessage):
            showError(message: errorMessage)
        case .receivedList:
            tableView.restore()
            tableView.reloadData()
        case .receivedEmptyList:
            tableView.setEmptyMessage(LocalizationHelper.localize("HomeViewController.ListIsEmpty"))
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let _ = viewModel.cellViewModel(for: indexPath.row)
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
