//
//  HeaderView.swift
//  TimeToTravel
//
//  Created by  Юлия Григорьева on 03.06.2022.
//

import UIKit

class HeaderView: UIView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

//    private lazy var travelLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Пора в путешествие!"
//        label.textColor = .red
//        label.font = UIFont(name: "Pacifico-Regular", size: 30)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   private func drawSelf() {
       self.addSubview(self.imageView)
//       self.addSubview(self.travelLabel)

               NSLayoutConstraint.activate([

                   imageView.topAnchor.constraint(equalTo: self.topAnchor),
                   imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                   imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                   imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

//                   travelLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//                   travelLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),


               ])
    }
}
