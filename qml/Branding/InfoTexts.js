/**
 * Copyright (c) 2011-2014 Microsoft Mobile.
 */

var MAIN_VIEW_INFO_TEXT =
        "<h2>Navigation and application specific features</h2>"
        + "<p>How to navigate: </p>"
        + "<p><table>"
        + "<tr>"
        + "<td width=12% align=center><img src=Images/Icons/graf_back.svg height=20 width=20 /></td>"
        + "<td>is for leaving the showcase or closing the application</td>"
        + "</tr>"
        + "<tr>"
        + "<td width=12% align=center><img src=Images/Icons/toolbar_next.svg height=20 width=20 /></td>"
        + "<td>is for moving to the next image within the showcase</td>"
        + "</tr>"
        + "<tr>"
        + "<td width=12% align=center><img src=Images/Icons/toolbar_prev.svg height=20 width=20 /></td>"
        + "<td>is for moving to the previous image within the showcase<</td>"
        + "</tr>"
        + "</table></p>"
        + "<p>There are several specific features in this application: </p>"
        + "<ul type=1>"
        + "<li>It is missing actual functionality. The purpose of the application "
        + "is only to show how to alter the UI, and therefore it is without any "
        + "engine. However, there is a clear indication of each press on a touchable "
        + "item in the UI.<br /></li>"
        + "<li>The toolbar is used for navigating between the screens of a showcase. "
        + "Therefore it might happen that functions which would be found from the "
        + "toolbar otherwise are missing, e.g. Toolbutton “Login” from a login view.<br /></li>"
        + "<li>The dialogs do not have “Ok” and “Cancel” buttons, only “previous” "
        + "and “next” to ensure smooth navigation through the showcase.<br /></li>"
        + "<li>Selection dialogs do not close when an item is selected, except "
        + "if you choose a navigation item (go back to previous).<br /></li>"
        + "<li>View menu or dialog cannot be dismissed by pressing outside "
        + "the menu or dialog area.</li>"
        + "</ul>"
        + "<h2>List of changed UI elements</h2>"
        + "<ul>"
        + "<li>Splash screen (myKahvi, Airport)</li>"
        + "<li>Additional Back button on splash screen (myKahvi, Airport)</li>"
        + "<li>Image as view header/list header (myKahvi, Airport, Company)</li>"
        + "<li>List header background color (LOGO)</li>"
        + "<li>List header text color (Airport)</li>"
        + "<li>View background color (myKahvi, Airport)</li>"
        + "<li>View background image (Airport, LOGO)</li>"
        + "<li>List item text color (myKahvi, Airport, LOGO)</li>"
        + "<li>Chevron icon (drill down indicator) color (LOGO)</li>"
        + "<li>Tab bar color scheme (Airport)</li>"
        + "<li>Check mark color of a checkbox item (Airport)</li>"
        + "<li>Radio button highlight (Company)</li>"
        + "<li>Button highlight of a button group (Company) </li>"
        + "<li>Custom buttons (LOGO)</li>"
        + "<li>Selector text color (Company)</li>"
        + "<li>Plain text color (Company, LOGO)</li>"
        + "<li>Dialog title text color (Airport, LOGO)</li>"
        + "<li>Dialog title horizontal separator color (Airport, LOGO)</li>"
        + "<li>Dialog title text icon replacement (myKahvi, Airport, LOGO)</li>"
        + "<li>Tumbler highlight color (LOGO)</li>"
        + "</ul>"
        + "<h2>Background</h2>"
        + "<p>Qt Quick Components for Symbian do not support any other themes than dark "
        + "(non-inverted) and light (inverted). Besides, it is not possible to change "
        + "the color of Qt Quick components.</p>"
        + "<p>To overcome this restriction, we created branding examples around "
        + "Qt Quick Components for Symbian to showcase different approaches on how "
        + "to change or add color to UI elements. This application contains various "
        + "techniques and covers most of the existing UI elements. Some changes are "
        + "simple, like exchanging an image, some other changes are rather complex, "
        + "like replacing an entire component. However, the main goal is to preserve "
        + "the look and feel of the UI components as much as possible and make the "
        + "application appear like an integral part of the phone.</p>"
        + "<p>Please note that whenever you make changes to UI components, you "
        + "should test them on the target devices. The remote device access service "
        + "from Nokia might become handy in this situation. Please check "
        + "<a href=\"http://www.developer.nokia.com/rda\">http://www.developer.nokia.com/rda</a>"
        + "<p>Project pages are found from "
        + "<a href=\"http://projects.developer.nokia.com/symbianbranding\"> "
        + "here</a> and related Symbian "
        + "UI design guidelines are found from "
        + "<a href=\"http://www.developer.nokia.com/sdg\">here</a>"

var MYKAHVI_INFO_TEXT =
        "<h1>My Kahvi</h1>"
        + "<p>The following UI components have been changed: </p>"
        + "<ul>"
        + "<p><li>Splash screen"
        + "<ul type=square> "
        + "<li>Animation showing different states of brewing coffee</li>"
        + "<li>Contains a back button, in case the application gets stuck "
        + "e.g. while loading content or retrieving a location</li>"
        + "</ul></li></p>"
        + "<p><li>Views"
        + "<ul type=square> "
        + "<li>Image as view header </li>"
        + "<li>Background color </li>"
        + "<li>List item text color </li></ul>"
        + "</li></p>"
        + "<p><li>View menu"
        + "<ul type=square> "
        + "<li>Added a link to the company’s web page (even this is "
        + "not about altering a certain UI component, it is still a way "
        + "of branding)</li></ul></p>"
        + "<p><li>Dialog"
        + "<ul type=square> "
        + "<li>Exchanged the icon in the title to match the company’s color "
        + "scheme</li></ul></p>"
        + "</ul>"
        + "<p>NOTE:  The View menu cannot be dismissed by tapping outside "
        + "the menu area. This ensures an undisturbed navigation within the "
        + "application’s artificial navigation structure.</p>"

var AIRPORT_INFO_TEXT =
        "<h1>Airport</h1>"
        + "<p>The following UI components have been changed: </p>"
        + "<ul>"
        + "<p><li>Splash screen"
        + "<ul type=square> "
        + "<li>Animation with different cloud layers</li>"
        + "</ul></li></p>"
        + "<p><li>Views"
        + "<ul type=square> "
        + "<li>Image as view header </li>"
        + "<li>Background image</li>"
        + "<li>Background color</li>"
        + "<li>List header text color</li>"
        + "<li>List item text color</li>"
        + "<li>Check mark color</li>"
        + "<li>Tab bar color scheme</li></ul>"
        + "</li></p>"
        + "<p><li>Dialog"
        + "<ul type=square> "
        + "<li>Title text color</li>"
        + "<li>Title horizontal separator line</li>"
        + "<li>Title icon"
        + "</li></ul></p>"
        + "</ul>"
        + "<p>NOTE:  There would normally be a “Login” button in the Toolbar "
        + "of the Login view, but in this example application it is replaced "
        + "by the arrows used for navigation between showcase images.</p>"


var COMPANY_INFO_TEXT =
        "<h1>Company</h1>"
        + "<p>The following UI components have been changed: </p>"
        + "<ul>"
        + "<p><li>Views"
        + "<ul type=square> "
        + "<li>Image as view header </li>"
        + "<li>Selector text color</li>"
        + "<li>Toolbar icon color</li>"
        + "<li>Text color</li>"
        + "<li>Color highlight in a button group</li>"
        + "</ul>"
        + "</li></p>"
        + "<p><li>Dialog"
        + "<ul type=square> "
        + "<li>Radio button highlight color</li>"
        + "</li></ul></p>"
        + "</ul>"
        + "<p>NOTE: The Dialog cannot be dismissed by tapping outside the "
        + "Dialog’s area. This ensures an undisturbed navigation within the "
        + "application’s artificial navigation structure.</p>"

var LOGO_INFO_TEXT =
        "<h1>Logo</h1>"
        + "<p>The following UI components have been changed: </p>"
        + "<ul>"
        + "<p><li>Views"
        + "<ul type=square> "
        + "<li>List header background color</li>"
        + "<li>Background image</li>"
        + "<li>List item text color</li>"
        + "<li>Chevron icon (drill down indicator) color</li>"
        + "<li>Text color</li>"
        + "<li>Custom buttons</li>"
        + "</ul>"
        + "</li></p>"
        + "<p><li>Dialog"
        + "<ul type=square> "
        + "<li>Title text color</li>"
        + "<li>Title horizontal separator color</li>"
        + "<li>Title icon</li>"
        + "<li>Tumbler highlight color</li>"
        + "</li></ul></p>"
        + "</ul>"
