//
//  ChatsViewController.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 01.05.2022.
//

import UIKit

struct ChatsModel: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ChatsModel, rhs: ChatsModel) -> Bool {
        return lhs.id == rhs.id
    }
}

class ChatsViewController: UIViewController, UISearchControllerDelegate {
    
    var chatsCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, ChatsModel>?
    
    enum Section: Int, CaseIterable {
        case waitingChats
        case activeChats
        
        func discription() -> String {
            switch self {
            case .waitingChats:
                return "Waiting chats"
            case .activeChats:
                return "Active chats"
            }
        }
    }
    
    let activeChats = Bundle.main.decode([ChatsModel].self, from: "ActiveChats.json")
    let waitingChats = Bundle.main.decode([ChatsModel].self, from: "WaitingChats.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SetupColor.whiteColor()
        title = "Chats"
        
        setupCollectionView()
        setupConstraints()
        
        createDataSource()
        shapshotReloadData()
        
        setupSearchBar()
    }
    
    // MARK: Setup UICollectionView
    private func setupCollectionView() {
        chatsCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        chatsCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        chatsCollectionView.backgroundColor = .white
        chatsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        chatsCollectionView.register(ActiveChatsCell.self, forCellWithReuseIdentifier: ActiveChatsCell.cellID)
        chatsCollectionView.register(WaitingChatsCell.self, forCellWithReuseIdentifier: WaitingChatsCell.cellID)
        chatsCollectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.sectionID)
    }
    
    // MARK: Setup layout for UICollectionView
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvoriment) -> NSCollectionLayoutSection in
            guard let section = Section(rawValue: sectionIndex) else { fatalError("No section") }
            
            switch section {
            case .activeChats:
                return self.createActivityChats()
            case .waitingChats:
                return self.createWaitingChats()
            }
        }
        return layout
    }
    
    // MARK: Layout CreateActivityChats
    private func createActivityChats() -> NSCollectionLayoutSection {
        let sizeItem = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let item = NSCollectionLayoutItem(layoutSize: sizeItem)
        
        let sizeGroup = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: sizeGroup, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 16, bottom: 50, trailing: 16)
        section.interGroupSpacing = 10
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    // MARK: Layout CreateWaitingChats
    private func createWaitingChats() -> NSCollectionLayoutSection {
        let sizeItem = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: sizeItem)
        
        let sizeGroup = NSCollectionLayoutSize(widthDimension: .absolute(80), heightDimension: .absolute(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: sizeGroup, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 16, bottom: 50, trailing: 16)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    // MARK: - Configure Cell
    private func configure<T: ConfigurationChatsCellProtocol>(cellType: T.Type, with value: ChatsModel, for indexPath: IndexPath) -> T {
        guard let cell = chatsCollectionView.dequeueReusableCell(withReuseIdentifier: cellType.cellID, for: indexPath) as? T else { fatalError("No create cell") }
        cell.configure(with: value)
        return cell
    }
    
    // MARK: - Create DataSource
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: chatsCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("No section") }
            
            switch section {
            case .activeChats:
                return self.configure(cellType: ActiveChatsCell.self, with: itemIdentifier, for: indexPath)
            case .waitingChats:
                return self.configure(cellType: WaitingChatsCell.self, with: itemIdentifier, for: indexPath)
            }
        })
        
        dataSource?.supplementaryViewProvider = { (collectionView, elementKind, indexPath) -> UICollectionReusableView in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: SectionHeader.sectionID, for: indexPath) as? SectionHeader else { fatalError("Can not create header for cell") }
            
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Can not create header for cell") }
            
            sectionHeader.configurationHeader(text: section.discription(), font: SetupFont.montserratBold(size: 14), color: SetupColor.secondaryBlackColor())
            
            return sectionHeader
        }
    }
    
    // MARK: - NSDiffableDataSourceSnapshot
    private func shapshotReloadData() {
        var snapchot = NSDiffableDataSourceSnapshot<Section, ChatsModel>()
        snapchot.appendSections([.waitingChats, .activeChats])
        snapchot.appendItems(waitingChats, toSection: .waitingChats)
        snapchot.appendItems(activeChats, toSection: .activeChats)
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
extension ChatsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - Installing constraints
extension ChatsViewController {
    private func setupConstraints() {
        
        // MARK: ChatsCollectionView
        view.addSubview(chatsCollectionView)
        NSLayoutConstraint.activate([
            chatsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            chatsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            chatsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            chatsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}
