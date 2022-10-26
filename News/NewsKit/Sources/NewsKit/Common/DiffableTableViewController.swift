//
//  DiffableTableViewController.swift
//  NewsAPI
//
//  Created by Shinto Joseph on 11/05/2020.
//  Copyright © 2020 Shinto Joseph. All rights reserved.
//

import UIKit

enum DiffableSection {
    case main
}

public class DiffableTableViewController<T: BaseTableViewCell<V>, V>: UITableViewController where V: Hashable {
    
    var dataSource: UITableViewDiffableDataSource<DiffableSection, V>! = nil
    
    var emptyView: NoContentToDisplayView?
    
    var models: [V] = [] {
        didSet {
            var initialSnapshot = NSDiffableDataSourceSnapshot<DiffableSection, V>()
            initialSnapshot.appendSections([.main])
            initialSnapshot.appendItems(models)
            if models.isEmpty {
                self.state?.update(status: .noData)
            }
            self.dataSource.apply(initialSnapshot, animatingDifferences: true)
            self.showEmptyViewIfNeeded()
        }
    }
    
    var state: UIState? {
        didSet {
            self.showEmptyViewIfNeeded()
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        createDataSource()
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    /// registerTableViewCells that are created using xib, not in storyboard
    func registerTableViewCells() {
        tableView.register(T.self)
    }
    
    func createDataSource() {
        
        dataSource = UITableViewDiffableDataSource<DiffableSection, V>(tableView: tableView) { (tableView: UITableView, indexPath: IndexPath, item: V) -> UITableViewCell? in
            
            let cell: T = tableView.dequeueReusableCell(for: indexPath)
            cell.item = item
            return cell
        }
        
        self.dataSource.defaultRowAnimation = .fade
        tableView.dataSource = dataSource
    }
    
    public override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        self.showEmptyViewIfNeeded()
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    // MARK: - Refreshcontrol helper
    func configureRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
    }
    
    func updateRefreshControl(isLoading: Bool) {
        if isLoading {
            self.tableView.refreshControl?.beginRefreshing()
        } else {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
//    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
    
    func showEmptyViewIfNeeded() {
        
        let shouldShow = dataSource.snapshot().itemIdentifiers.isEmpty
    
        if shouldShow {
            DispatchQueue.main.async {
                self.tableView.tableFooterView = self.getEmptyView()
            }
        } else {
            DispatchQueue.main.async {
                self.tableView.tableFooterView = nil
            }
        }
    }
    
    private func getEmptyView() -> UIView {
 
        var emptyFrame = self.tableView.bounds
        emptyFrame.origin = CGPoint.zero
        
        if !(self.tabBarController?.tabBar.isHidden ?? true || self.hidesBottomBarWhenPushed) {
            emptyFrame.size.height -= self.tabBarController?.tabBar.bounds.size.height ?? 0.0
        }
        
        if  !(self.navigationController?.hidesBarsWhenVerticallyCompact ?? false || self.navigationController?.isNavigationBarHidden ?? false) {
            emptyFrame.size.height -= self.navigationController?.navigationBar.bounds.size.height ?? 0.0
        }
   
        emptyFrame.size.height -= self.view.safeAreaInsets.bottom + self.view.safeAreaInsets.top
        
        if emptyView == nil {
            emptyView = NoContentToDisplayView(frame: emptyFrame)
        } else {
            emptyView?.frame = emptyFrame
        }
        
        emptyView?.state = state
        return emptyView!
    }
}
