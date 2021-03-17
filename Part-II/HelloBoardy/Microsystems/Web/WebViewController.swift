//
//  WebViewController.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//
//

import UIKit
import ViewStateCore
import WebKit

final class WebViewController: UIViewController, WebController {
    // MARK: Dependencies

    weak var delegate: WebDelegate?

    lazy var state = WebViewState()

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self

        state.register(subscriberObject: self)
    }

    // MARK: Private computed & temporary properties

    // MARK: IBOutlets / IBActions

    @IBOutlet private var webView: WKWebView!

    @IBAction private func returnHomeButtonDidTap() {
        confirm(message: "Would you like to return home page?") { [weak delegate] in
            delegate?.returnHome()
        }
    }
}

// MARK: - Behaviors

extension WebViewController {
    func load(webInput: WebInput) {
        title = webInput.title
        state.hyperlink = webInput.link
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

// MARK: - ViewState

extension WebViewController: DedicatedViewStateRenderable {
    func dedicatedRender(state: WebViewState) {
        guard let link = state.hyperlink, let url = URL(string: link) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        showLoading()
    }
}

// MARK: - Private methods

private extension WebViewController {}
