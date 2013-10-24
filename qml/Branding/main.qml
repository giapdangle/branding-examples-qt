/**
 * Copyright (c) 2012 Nokia Corporation.
 */

import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1

PageStackWindow {
    id: window
    initialPage: MainPage {}
    showStatusBar: true
    showToolBar: true

    InfoBanner{
        id: banner
    }

    function showBanner(text, iconSource)
    {
        banner.text = text
        banner.iconSource = iconSource
        banner.open()
    }
}
