import UIKit
class CollectionViewCell: UICollectionViewCell {
    
    // Создание и настройка imageView
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Создание и настройка checkMark
    let checkMark: UIImageView = {
        let checkMark = UIImageView()
        checkMark.contentMode = .scaleAspectFit
        checkMark.translatesAutoresizingMaskIntoConstraints = false
        checkMark.alpha = 0.75
        checkMark.tintColor = .green
        return checkMark
    }()
    
    // Создание и настройка label
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        var frame = label.frame
        frame.size.width += 10
        label.frame = frame
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Добавление imageView и label на ячейку
        addSubview(imageView)
        addSubview(label)
        
        let cellWidth = UIScreen.main.bounds.width / 2
        label.font = UIFont.systemFont(ofSize: 20)
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        label.backgroundColor = ThemeColors.shared.color(for: "background")
        label.textColor = ThemeColors.shared.color(for: "text")
        label.numberOfLines = 2
        
        // Установка ограничений для checkMark
        addSubview(checkMark)
        NSLayoutConstraint.activate([
            checkMark.centerXAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  cellWidth/2),
            checkMark.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            checkMark.widthAnchor.constraint(equalToConstant: cellWidth),
            checkMark.heightAnchor.constraint(equalToConstant: cellWidth)
        ])
        
        // Установка ограничений для label
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  cellWidth/2),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2 - 16)
        ])
        
        // Установка ограничений для imageView
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  cellWidth/2),
            imageView.widthAnchor.constraint(equalToConstant: cellWidth-15),
            imageView.heightAnchor.constraint(equalToConstant: cellWidth-15)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

