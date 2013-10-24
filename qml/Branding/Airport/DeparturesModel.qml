// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

ListModel {
    id: dataModel

    ListElement { city: "Paris"; flight: "FL4078, BF6788"; flightStatus: "Boarding"; time: "10:59"}
    ListElement { city: "Munich"; flight: "KF4030"; flightStatus: "Departing"; time: "11:01"}
    ListElement { city: "New York"; flight: "NY2250"; flightStatus: "Departing"; time: "11:21"}
    ListElement { city: "London"; flight: "NY4078, BF6788"; flightStatus: "Cancelled"; time: "11:30"}
    ListElement { city: "Amsterdam"; flight: "AL4099"; flightStatus: ""; time: "11:48"}
    ListElement { city: "Barcelona"; flight: "CG45998"; flightStatus: "Boarding"; time: "12:05"}
    ListElement { city: "Dublin"; flight: "IR89099, AC48480"; flightStatus: ""; time: "12:36"}
    ListElement { city: "Vienna"; flight: "AU234994"; flightStatus: "Cancelled"; time: "12:52"}
}
