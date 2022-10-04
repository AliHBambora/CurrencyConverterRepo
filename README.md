# Currency_Converter

A new Flutter project.

## Getting Started
Currency_Converter is a simple mobile application built using flutter for converting currencies of different countries from one another. It consists of 3 screens in which the first screen is used to show the list of currencies the application supports, the second screen is used to convert the currency from one country to another and the third screen is used to show the past conversion history for the user for the last 7 days.

## Steps to run the project
### Prerequisites: VSCode, Android Studio(for android) or Xcode(for ios),real mobile device(optional)
1)	Copy the project URL from github and open the console palette in VSCode and type Git clone on the console palette.
2)	After that paste the project Link URL and press Enter , Select the folder where you want to save the project and now open the project in VSCode.
3)	When the project is opened for the first time in VSCode, it might show import errors in that case run the command <b>flutter pub get</b> in the root folder of your project and it will load all the reqired packages of the mobile application.
4)	After all the packages are loaded, choose the device type (android emulator or ios emulator or real device etc.) from the bottom right tab on the screen. This will open the device if it is an emulator or will connect if connected to a real mobile device via USB cable. 
5)	Now type flutter run in terminal in the root folder where the project is cloned. Alternatively you can directly run the project from run option available in VSCode toolbar.

## Design Pattern

<p align="center"><img src="https://user-images.githubusercontent.com/67342582/193857370-4b6ba95f-1815-49ef-9531-920bf420de93.png"></p>

The project follows the MVP(Model View Presenter) design pattern. The project has been divided into 3 components namely
### 1)	Model
This component stores the data related to the database and is responsible for handling the communication between the database and network.(Models folder in the project )
### 2)	View
This component consists of all the widgets and screens responsible for displaying the UI.(Widgets and screens folder in the project).

### 3)	Presenter
Presenter is responsible for querying the model and translating updates in the view accordingly, as the view has no direct access to the model

The project uses MVP design pattern as it clearly separates the business logic of the application from the UI and modularizes the application in a clean way and organizes the code in a better manner.
Also it is easy to unit test the application as the core database functions and the UI are loosely coupled and separated from each other



