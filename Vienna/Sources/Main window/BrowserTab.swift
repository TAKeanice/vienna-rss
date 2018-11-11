//
//  BrowserTab.swift
//  Vienna
//
//  Created by Tassilo Karge on 27.10.18.
//  Copyright © 2018 uk.co.opencommunity. All rights reserved.
//

import Cocoa

@available(OSX 10.10, *)
class BrowserTab: NSViewController {

    @IBOutlet weak var addressBarContainer: NSVisualEffectView!
    @IBOutlet weak var addressField: NSTextField!
    var webView: WKWebView! = WKWebView()
    @IBOutlet weak var backButton: NSButton!
    @IBOutlet weak var forwardButton: NSButton!
    @IBOutlet weak var reloadButton: NSButton!

    var url: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView, positioned: .below, relativeTo: nil)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView]|", options: [], metrics: nil, views: ["webView" : webView]))
        //TODO: set top constraint to view top, insets to webview
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[addressBarContainer]-[webView]|", options: [], metrics: nil, views: ["webView" : webView, "addressBarContainer" : addressBarContainer]))
        //TODO: set webview options since this is not possible before macOS 12 in IB
    }
}

@available(OSX 10.10, *)
extension BrowserTab: Tab {

    var textSelection: String {
        get {return ""}
    }

    var html: String {
        get {return ""}
    }

    var loading: Bool {
        get {return false}
    }

    func back() {
        self.webView.goBack()
    }

    func forward() {
        self.webView.goForward()
    }

    func pageDown() {
        self.webView.pageDown(nil)
    }

    func pageUp() {
        self.webView.pageUp(nil)
    }

    func searchFor(_ searchString: String, action: NSFindPanelAction) {

    }

    func load() {
        if let url = self.url {
            self.webView.load(URLRequest(url: url))
        }
    }

    func reload() {
        self.webView.reload()
    }

    func stopLoading() {
        self.webView.stopLoading()
    }

    func close() {

    }

    func decreaseTextSize() {

    }

    func increaseTextSize() {

    }

    func print() {

    }
}
