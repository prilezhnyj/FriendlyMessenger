//
//  FrendsViewController.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 07.05.2022.
//

import UIKit

struct UsersModel: Hashable, Decodable {
    var username: String
    var avatarStringURL: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: UsersModel, rhs: UsersModel) -> Bool {
        return lhs.id == rhs.id
    }
}

class FrendsViewController: UIViewController {
    
    var frendsCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, UsersModel>?
    
    let users = Bundle.main.decode([UsersModel].self, from: "Users.json")
    
    
    
    enum Section: Int, CaseIterable {
        case users
        
        func discription(usersCount: Int) -> String {
            switch self {
            case .users:
                return "You have \(usersCount) friends"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Frends"
        
        setupCollectionView()
        setupConstraints()
        
        createDataSource()
        shapshotReloadData()
        
        setupSearchBar()
    }
    
    // MARK: Setup UICollectionView
    private func setupCollectionView() {
        frendsCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        frendsCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        frendsCollectionView.backgroundColor = .white
        frendsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        frendsCollectionView.register(UserCell.self, forCellWithReuseIdentifier: UserCell.cellID)
        frendsCollectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.sectionID)
    }
    
    // MARK: Setup layout for UICollectionView
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvoriment) -> NSCollectionLayoutSection in
            guard let section = Section(rawValue: sectionIndex) else { fatalError("No section") }
            
            switch section {
            case .users:
                return self.createUsers()
            }
        }
        return layout
    }
    
    // MARK: Layout Users
    private func createUsers() -> NSCollectionLayoutSection {
        let sizeItem = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: sizeItem)
        
        let sizeGroup = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: sizeGroup, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 16, bottom: 50, trailing: 16)
        section.interGroupSpacing = 10
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    // MARK: - Configure Cell
    private func configure<T: ConfigurationUsersCellProtocol>(cellType: T.Type, with value: UsersModel, for indexPath: IndexPath) -> T {
        guard let cell = frendsCollectionView.dequeueReusableCell(withReuseIdentifier: cellType.cellID, for: indexPath) as? T else { fatalError("No create cell") }
        cell.configure(with: value)
        return cell
    }
    
    // MARK: - Create DataSource
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: frendsCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("No section") }
            
            switch section {
            case .users:
                return self.configure(cellType: UserCell.self, with: itemIdentifier, for: indexPath)
            }
        })
        
        dataSource?.supplementaryViewProvider = { (collectionView, elementKind, indexPath) -> UICollectionReusableView in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: SectionHeader.sectionID, for: indexPath) as? SectionHeader else { fatalError("Can not create header for cell") }
            
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Can not create header for cell") }
            
            let items = self.dataSource?.snapshot().itemIdentifiers(inSection: .users)
            
            sectionHeader.configurationHeader(text: section.discription(usersCount: items?.count ?? 0), font: SetupFont.montserratBold(size: 20), color: SetupColor.secondaryBlackColor())
            
            return sectionHeader
        }
    }
    
    // MARK: - NSDiffableDataSourceSnapshot
    private func shapshotReloadData() {
        var snapchot = NSDiffableDataSourceSnapshot<Section, UsersModel>()
        snapchot.appendSections([.users])
        snapchot.appendItems(users, toSection: .users)
        dataSource?.apply(snapchot, animatingDifferences: true)
    }
    
    // MARK: - Setup SearchBar
    private func setupSearchBar() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
}

// MARK: - UISearchBarDelegate
extension FrendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - Installing constraints
extension FrendsViewController {
    private func setupConstraints() {
        
        // MARK: ChatsCollectionView
        view.addSubview(frendsCollectionView)
        NSLayoutConstraint.activate([
            frendsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            frendsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            frendsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            frendsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}
