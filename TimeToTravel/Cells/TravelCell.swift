//
//  TravelCell.swift
//  TimeToTravel
//
//  Created by  Юлия Григорьева on 03.06.2022.
//

import UIKit

protocol TravelCellProtocol: AnyObject {
    func tapLikes(cell: TravelCell)
}

class TravelCell: UITableViewCell {

    weak var delegate: TravelCellProtocol?

    private var tapLikesGestureRecognizer = UITapGestureRecognizer()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont(name: "Helvetica-Bold", size: 25)
        label.text = "1000 руб."
        return label
    }()

    lazy var fromLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Откуда:"
        return label
    }()

    lazy var toLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Куда:"
        return label
    }()

    lazy var departureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Pacifico-Regular", size: 20)
        label.textColor = .black
        label.text = "Cанкт - Петербург"
        return label
    }()

    lazy var destinationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Pacifico-Regular", size: 20)
        label.textColor = .black
        label.text = "Москва"
        return label
    }()

    lazy var beginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Туда:"
        return label
    }()

    lazy var endLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Обратно:"
        return label
    }()

    lazy var likeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupGesture()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        contentView.addSubview(self.priceLabel)
        contentView.addSubview(self.fromLabel)
        contentView.addSubview(self.toLabel)
        contentView.addSubview(self.departureLabel)
        contentView.addSubview(self.destinationLabel)
        contentView.addSubview(self.beginLabel)
        contentView.addSubview(self.endLabel)
        contentView.addSubview(self.likeImage)


        NSLayoutConstraint.activate([

            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            fromLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 65),
            fromLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            toLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 65),
            toLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),


            departureLabel.topAnchor.constraint(equalTo: toLabel.bottomAnchor),
            departureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            destinationLabel.topAnchor.constraint(equalTo: fromLabel.bottomAnchor),
            destinationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            beginLabel.topAnchor.constraint(equalTo: departureLabel.bottomAnchor),
            beginLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            endLabel.topAnchor.constraint(equalTo: beginLabel.bottomAnchor),
            endLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            likeImage.bottomAnchor.constraint(equalTo: endLabel.bottomAnchor),
            likeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            likeImage.heightAnchor.constraint(equalToConstant: 40),
            likeImage.widthAnchor.constraint(equalToConstant: 40),

        ])
    }
}

extension TravelCell {
    private func setupGesture() {
        self.tapLikesGestureRecognizer.addTarget(self, action: #selector(self.likesHandleTapGesture(_:)))
        self.likeImage.addGestureRecognizer(self.tapLikesGestureRecognizer)
    }

    @objc func likesHandleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapLikesGestureRecognizer === gestureRecognizer else { return }
        delegate?.tapLikes(cell: self)
    }
}

