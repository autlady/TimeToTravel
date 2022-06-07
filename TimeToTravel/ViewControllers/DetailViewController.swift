//
//  DetailViewController.swift
//  TimeToTravel
//
//  Created by  Юлия Григорьева on 04.06.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var indexPath: IndexPath = [0, 0]

    private let tapGestureRecognizer = UITapGestureRecognizer()

    lazy var background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "stamp")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()


    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы выбрали:"
        label.textColor = .red
        label.font = UIFont(name: "Pacifico-Regular", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()


    private lazy var dateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var likeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var firstPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Цена:"
        return label
    }()

    lazy var secondPriceLabel: UILabel = {
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


    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Даты:"
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


    lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Pacifico-Regular", size: 20)
        label.textColor = .black
        label.text = "Мне это нравится!"
        return label
    }()

    lazy var likeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(systemName: "heart")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.titleView = self.titleLabel
        layout()
        setupGesture()
    }

    private func layout() {
        view.addSubview(background)
        view.addSubview(stackView)

        stackView.addArrangedSubview(firstStackView)
        stackView.addArrangedSubview(secondStackView)
        stackView.addArrangedSubview(thirdStackView)
        stackView.addArrangedSubview(dateStackView)
        stackView.addArrangedSubview(likeStackView)

        firstStackView.addArrangedSubview(firstPriceLabel)
        firstStackView.addArrangedSubview(secondPriceLabel)

        secondStackView.addArrangedSubview(fromLabel)
        secondStackView.addArrangedSubview(departureLabel)

        thirdStackView.addArrangedSubview(toLabel)
        thirdStackView.addArrangedSubview(destinationLabel)

        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(beginLabel)
        dateStackView.addArrangedSubview(endLabel)
        
        likeStackView.addArrangedSubview(likeLabel)
        likeStackView.addArrangedSubview(likeImage)

        NSLayoutConstraint.activate([

            background.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),


            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),


            firstStackView.topAnchor.constraint(equalTo: stackView.topAnchor),
            firstStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            firstStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            secondStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            secondStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            thirdStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            thirdStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            dateStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            dateStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            likeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            likeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            likeStackView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),


        ])
    }


    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.handleTapGesture(_:)))
        self.likeImage.addGestureRecognizer(self.tapGestureRecognizer)
    }

    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }

        if likeImage.image == UIImage(systemName: "heart") {
            likeImage.image = UIImage(systemName: "heart.fill")

        } else if likeImage.image == UIImage(systemName: "heart.fill") {
                likeImage.image = UIImage(systemName: "heart")
                   }
    }



    func setupVC(trip: Trip, indexPath: IndexPath, image: UIImage) {

        secondPriceLabel.text = String(trip.price) + " руб."
        departureLabel.text = trip.startCity
        destinationLabel.text = trip.endCity
        likeImage.image = image

        let startDate = trip.startDate
        let endDate = trip.endDate

        if let date = startDate.dateFromWebtoApp(startDate) {
            beginLabel.text = "c " + date
        }
        if let date = endDate.dateFromWebtoApp(endDate) {
            endLabel.text = "по " + date
        }

        self.indexPath = indexPath
    }
    

}
