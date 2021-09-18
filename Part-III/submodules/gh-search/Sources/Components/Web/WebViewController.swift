//
//  WebViewController.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import UIKit
import WebKit

/// Use for interacting with data before sending messages to outside
protocol WebInteractable {
    func didBecomeActive()
}

final class WebViewController: UIViewController {
    // MARK: Dependencies

    weak var delegate: WebActionDelegate?

    var interactor: WebInteractable!

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.didBecomeActive()
        requestWebContent()
    }

    // MARK: Private computed & temporary properties

    private var hyperlink: String = "" {
        didSet {
            guard isViewLoaded else { return }
            requestWebContent()
        }
    }

    // MARK: IBOutlets / IBActions

    @IBOutlet private var webView: WKWebView!

    @IBAction private func returnHomeButtonDidTap() {
        confirm(message: "Would you like to return home page?") { [weak delegate] in
            delegate?.returnHome()
        }
    }
}

// MARK: - Behaviors

extension WebViewController: WebViewable {}

extension WebViewController {
    func load(request: WebRequest) {
        title = request.title
        hyperlink = request.link
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideLoading()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        hideLoading()
    }
}

// MARK: - Private methods

private extension WebViewController {
    func setupView() {
        webView.navigationDelegate = self
    }

    func requestWebContent() {
        guard let url = URL(string: hyperlink) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        showLoading()
    }
}
