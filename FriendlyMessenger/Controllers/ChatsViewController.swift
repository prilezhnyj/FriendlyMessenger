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

class ChatsViewController: UIViewController {
    
    var chatsCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, ChatsModel>?
    
    enum Section: Int, CaseIterable {
        case waitingChats
        case activeChats
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
        
        chatsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "activeChatsCell")
        chatsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "waitingChatsCell")
    }
    
    // MARK: Setup UICollectionView
    private func setupCollectionView() {
        chatsCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        chatsCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        chatsCollectionView.backgroundColor = .white
        chatsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        chatsCollectionView.translatesAutoresizingMaskIntoConstraints = false
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
        let sizeItem = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(86))
        let item = NSCollectionLayoutItem(layoutSize: sizeItem)
        
        let sizeGroup = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: sizeGroup, subitems: [item])
        
        let sectional = NSCollectionLayoutSection(group: group)
        sectional.contentInsets = .init(top: 10, leading: 16, bottom: 10, trailing: 16)
        sectional.interGroupSpacing = 10
        
        return sectional
    }
    
    // MARK: Layout CreateWaitingChats
    private func createWaitingChats() -> NSCollectionLayoutSection {
        let sizeItem = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: sizeItem)
        
        let sizeGroup = NSCollectionLayoutSize(widthDimension: .absolute(88), heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: sizeGroup, subitems: [item])
        
        let sectional = NSCollectionLayoutSection(group: group)
        sectional.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        sectional.interGroupSpacing = 10
        sectional.orthogonalScrollingBehavior = .continuous
        
        return sectional
    }
    
    // MARK: - Create DataSource
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: chatsCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("No section") }
            
            switch section {
            case .activeChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activeChatsCell", for: indexPath)
                cell.backgroundColor = .systemBlue
                return cell
            case .waitingChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "waitingChatsCell", for: indexPath)
                cell.backgroundColor = .systemPink
                return cell
            }
        })
    }
    
    // MARK: - NSDiffableDataSourceSnapshot
    private func shapshotReloadData() {
        var snapchot = NSDiffableDataSourceSnapshot<Section, ChatsModel>()
        snapchot.appendSections([.waitingChats, .activeChats])
        snapchot.appendItems(waitingChats, toSection: .waitingChats)
        snapchot.appendItems(activeChats, toSection: .activeChats)
        dataSource?.apply(snapchot, animatingDifferences: true)
    }
}

// MARK: - Installing constraints
extension ChatsViewController {
    private func setupConstraints() {
        
        // MARK: Logo
        view.addSubview(chatsCollectionView)
        NSLayoutConstraint.activate([
            chatsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            chatsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            chatsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            chatsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}
