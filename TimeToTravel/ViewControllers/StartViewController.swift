//
//  ViewController.swift
//  TimeToTravel
//
//  Created by  Юлия Григорьева on 03.06.2022.
//

import UIKit

class StartViewController: UIViewController {

    var activityIndicator = UIActivityIndicatorView()

    var trips = [Trip]()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Пора в путешествие!"
        label.textColor = .red
        label.font = UIFont(name: "Pacifico-Regular", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TravelCell.self, forCellReuseIdentifier: "TravelCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = self.titleLabel
        self.navigationItem.backButtonTitle = "Назад"
        setupView()
        self.setActivityIndicator()
        self.activityIndicator.startAnimating()

        let urlString = "https://travel.wildberries.ru/statistics/v1/cheap"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        self.navigationController?.isToolbarHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonTrips = try? decoder.decode(Trips.self, from: json) {
            trips = jsonTrips.data
            tableView.reloadData()
        }

        self.activityIndicator.stopAnimating()
        self.activityIndicator.hidesWhenStopped = true

        //Первоначальное наполнение словаря, на основе полученных данных (для хранения состояний лайков)
        for element in trips {
            let tempKey = element.startCity + element.endCity
            DictLikes.shared.heart[tempKey] = false
        }
    }

    private func setupView() {
        view.addSubview(self.tableView)

        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

        NSLayoutConstraint.activate([
           topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }

    func setActivityIndicator() {
        activityIndicator.color = .red
        activityIndicator.center = self.view.center
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        activityIndicator = UIActivityIndicatorView(style: .large)
        self.view.addSubview(activityIndicator)
    }
}

extension StartViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelCell", for: indexPath) as! TravelCell
        cell.delegate = self
        cell.backgroundView = UIImageView(image: UIImage(named: "mail"))

        let trip = trips[indexPath.row]

        cell.priceLabel.text = String(trip.price) + " руб."
        cell.departureLabel.text = trip.startCity
        cell.destinationLabel.text = trip.endCity

        let startDate = trip.startDate
        let endDate = trip.endDate

        if let date = startDate.dateFromWebtoApp(startDate) {
            cell.beginLabel.text = date
        }
        if let date = endDate.dateFromWebtoApp(endDate) {
            cell.endLabel.text = date
        }

        let tempKey = trip.startCity + trip.endCity
        if DictLikes.shared.heart[tempKey] == true {
            cell.likeImage.image = UIImage(systemName: "heart.fill")

        } else if  DictLikes.shared.heart[tempKey] == false {
            cell.likeImage.image = UIImage(systemName: "heart")
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HeaderView()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelCell", for: indexPath) as! TravelCell
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        let tempKey = trips[indexPath.row].startCity + trips[indexPath.row].endCity
        vc.setupVC(trip: trips[indexPath.row], indexPath: indexPath,  image: (cell.likeImage.image!), tempKey: tempKey)
        tableView.reloadData()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension StartViewController: TravelCellProtocol {
    func tapLikes(cell: TravelCell) {
        guard let index = self.tableView.indexPath(for: cell)?.row else { return }

        let tempKey = trips[index].startCity + trips[index].endCity
        if DictLikes.shared.heart[tempKey] == false {
            DictLikes.shared.heart[tempKey] = true
            cell.likeImage.image = UIImage(systemName: "heart.fill")

        } else if  DictLikes.shared.heart[tempKey] == true {
            DictLikes.shared.heart[tempKey] = false
            cell.likeImage.image = UIImage(systemName: "heart")
        }
    }
}


