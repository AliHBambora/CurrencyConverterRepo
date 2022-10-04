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

## Image Loader Used
Since the icons of the countries flags are to be taken from the internet and since the application uses <b>Circle avatar</b> to display these flag icons, the project uses <b>NetworkImage provider</b> for loading the images from the API.

## Local Database used(Hive)

![image](https://user-images.githubusercontent.com/67342582/193858118-631d5396-fcdf-48ed-af37-1951009c274f.png)

The application uses <b>NoSQL hive database<b> for data storage. Since the application retrieves the currency conversion data from the API in JSON format it becomes very easy to store this data in a Hive box in the same format. Also, the retrieval of this data is easy to manipulate without writing much code.
  
Also, Hive is an extremely powerful and promising NoSQL database with high speed data retrieval and entry which makes the performance of the application very fast.
  
## Bloc Pattern for state management
<p align="center"><img src="https://user-images.githubusercontent.com/67342582/193858306-69109b65-f164-421e-b6b2-76e68cf8cc06.png"></p>
  
The project follows the <b>Bloc(Business Logic Component)</b> pattern for state management. The application contains a Bloc folder in which we have a CurrencyBloc folder which contains the events and state related to this bloc.
  
<p align="center"><img src="https://user-images.githubusercontent.com/67342582/193858692-4bd84bb1-565d-4dc0-93fd-b07857afe201.png"></p>
  
This bloc has two states namely <b>CurrencyInitial(initial state) and CurrencyLoaded(state when all the currency information is retrieved from the database).</b>
  
 Also this bloc has one <b>event LoadCurrencies</b> which calls the API for getting the information related to the currencies and changes the state from <b>CurrencyInitial to CurrencyLoaded state.</b>

 ## Unit Testing
  The application code contains <b>test folder</b> which has unit tests for API calls <b>getSupportedCurrencies</b>(used to get a list of supported currencies) and <b>getConversionData</b>(used to convert currency).
  
  
