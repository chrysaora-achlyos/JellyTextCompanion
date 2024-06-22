//
//  ViewController.swift
//  JellyTextCompanion
//
//  Created by Dev Account on 6/20/24.
//

import Runestone
import TreeSitterJellyRunestone
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "JellyTextCompanion"
        navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        let textView = TextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.editorDelegate = self
        textView.backgroundColor = .systemBackground
        textView.text = UserDefaults.standard.text
        let languageMode = TreeSitterLanguageMode(language: .jelly)
        textView.setLanguageMode(languageMode)
        setCustomization(on: textView)
        view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func setCustomization(on textView: TextView) {
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 5)
        textView.showLineNumbers = true
        textView.lineSelectionDisplayType = .line
        textView.lineHeightMultiplier = 1.2
        textView.kern = 0.3
        textView.showSpaces = true
        textView.showNonBreakingSpaces = true
        textView.showTabs = true
        textView.showLineBreaks = true
        textView.isLineWrappingEnabled = false
        textView.showSoftLineBreaks = true
        textView.isLineWrappingEnabled = false
        textView.pageGuideColumn = 80
        textView.autocorrectionType = .no
        textView.autocapitalizationType = .none
        textView.smartQuotesType = .no
        textView.smartDashesType = .no
    }
}

extension ViewController: TextViewDelegate {

    func textViewDidChange(_ textView: TextView) {

        UserDefaults.standard.text = textView.text

    }

}


