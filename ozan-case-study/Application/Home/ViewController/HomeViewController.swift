//
//  HomeViewController.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet weak var sortingTypeSelectionView: SelectFieldView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.fetchList()
    }
    
    private func setupBindings() {
        viewModel.stateChangedHandler = { [weak self] state in
            self?.handleStateChanged(state)
        }
        
        sortingTypeSelectionView.didSelectRowHandler = { [weak self] index in
            self?.viewModel.selectionChanged(index: index)
        }
    }
    
    private func handleStateChanged(_ state: HomeViewModel.States) {
        switch state {
        case .loading(let isLoading):
            isLoading ? showLoadingIndicator() : hideLoadingIndicator()
        case .receivedError(let errorMessage):
            showError(message: errorMessage)
        case .receivedList, .changedSortingType:
            tableView.restore()
            tableView.reloadData()
        case .receivedEmptyList:
            tableView.setEmptyMessage(LocalizationHelper.localize("HomeViewController.ListIsEmpty"))
        }
    }
}

// MARK: SetupUI
extension HomeViewController {
    
    private func setupUI() {
        tableView.register(UINib(nibName: CoinTableViewCell.reuseId, bundle: nil), forCellReuseIdentifier: CoinTableViewCell.reuseId)
        tableView.backgroundColor = .bleachedSilk
        tableView.separatorStyle = .none
        sortingTypeSelectionView.pickerDataSource = viewModel.pickerDataSource
        sortingTypeSelectionView.select(0)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel.cellViewModel(for: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.reuseId, for: indexPath) as! CoinTableViewCell
        cell.configure(with: viewModel)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate { }
