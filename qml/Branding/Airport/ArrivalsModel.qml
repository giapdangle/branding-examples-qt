// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

ListModel {
    id: dataModel

    ListElement { city: "San Francisco"; flight: "FL4078, BF6788"; flightStatus: "Arriving"; time: "14:59"}
    ListElement { city: "Athens"; flight: "KF4030"; flightStatus: "Arriving"; time: "15:22"}
    ListElement { city: "Palermo"; flight: "NY2250"; flightStatus: ""; time: "15:30"}
    ListElement { city: "Madrid"; flight: "NY4078, BF6788"; flightStatus: "Cancelled"; time: "15:53"}
    ListElement { city: "Berlin"; flight: "AL4099"; flightStatus: ""; time: "15:59"}
    ListElement { city: "Braga"; flight: "CG45998"; flightStatus: ""; time: "16:08"}
}
