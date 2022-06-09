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

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   private func drawSelf() {
       self.addSubview(self.imageView)

               NSLayoutConstraint.activate([

                   imageView.topAnchor.constraint(equalTo: self.topAnchor),
                   imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                   imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                   imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

               ])
    }
}
