Branding Examples
=================

The Branding examples are created around Qt Quick Components for Symbian to
showcase different approaches on how to change or add color to UI elements.
This application contains various techniques and covers most of the existing UI
elements. The level of changes are simple, like exchanging an image, to rather
complex ones, like replacing an entire component. However, the main goal is to
preserve the look and feel of the UI components as much as possible and make the
application appear like an integral part of the phone.

This example application is hosted in Nokia Developer Projects:
- http://projects.developer.nokia.com/symbianbranding

This example application demonstrates:
- Creating a branded Qt Quick application
- Creative use of Qt Quick Components

For more information on implementation and porting, visit the wiki pages:
- http://projects.developer.nokia.com/symbianbranding/wiki


1. Prerequisites
-------------------------------------------------------------------------------

 - Qt basics
 - Qt Quick basics


2. Project structure and implementation
-------------------------------------------------------------------------------

2.1 Folders
-----------

 |                  The root folder contains the project file, resource files,
 |                  the license information and this file (release notes).
 |
 |- qml             Root folder for QML and JavaScript files.
 |  |
 |  |- Airport      Airport showcase root folder
 |  |
 |  |- Company      Company showcase root folder
 |  |
 |  |- Images       Folder containing images
 |  |
 |  |- Logo         Logo showcase root folder
 |  |
 |  |- MyKahvi      MyKahvi showcase root folder
 |

2.2 Used APIs/QML elements/Qt Quick Components
----------------------------------------------

Most essential QML components used in the project:

Qt Quick elements (v 1.1):

- Flickable
- GridView
- Image
- ListView
- Timer

Symbian Qt Quick Components (v 1.1)

- ListHeading
- ListItem
- ListItemText
- QueryDialog
- ScrollBar

Symbian Extras Qt Quick Components (v 1.1)

- InfoBanner

Qt Labs elements (v 1.1)

- CheckableGroup

The following Qt Quick Components were modified to show how they can be
customized for branding purposes:

- Button
- ButtonRow
- CheckBox
- CommonDialog
- Dialog
- ListItem
- QueryDialog
- RadioButton
- SelectionDialog
- SelectionListItem
- Switch
- TabButton
- TextField
- Tumbler
- TumblerDialog
- TublerTemplate


3. Compatibility
-------------------------------------------------------------------------------

Symbian devices with Qt 4.7.4 and Qt Quick Components 1.1.
Developed with Qt SDK 1.2.

3.1 Required Capabilities
-------------------------

None; the application can be self signed on Symbian.


3.2 Known Issues
----------------

None.


4. Building, installing, and running the application
-------------------------------------------------------------------------------

4.1 Preparations
----------------

Check that you have the latest Qt SDK installed in the development environment
and the latest Qt version on the device.

Qt Quick Components 1.1 or higher is required.

4.2 Using the Qt SDK
--------------------

You can install and run the application on the device by using the Qt SDK.
Open the project in the SDK, set up the correct target (depending on the device
platform), and click the Run button. For more details about this approach,
visit the Qt Getting Started section at Nokia Developer
(http://www.developer.nokia.com/Develop/Qt/Getting_started/).

4.3 Symbian device
------------------

Make sure your device is connected to your computer. Locate the .sis
installation file and open it with Nokia Suite. Accept all requests from Nokia
Suite and the device. Note that you can also install the application by copying
the installation file onto your device and opening it with the Symbian File
Manager application.

After the application is installed, locate the application icon from the
application menu and launch the application by tapping the icon.


5. License
-------------------------------------------------------------------------------

See the license text file delivered with this project. The license file is also
available online at
http://projects.developer.nokia.com/symbianbranding/browser/Licence.txt


6. Related documentation
-------------------------------------------------------------------------------
Qt Quick Components:
- http://doc.qt.nokia.com/qt-components-symbian-1.1/index.html


7. Version history
-------------------------------------------------------------------------------

1.0 Initial release
