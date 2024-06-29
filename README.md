# kalshi_tha

Comments of this repo

## Architecture

### BLoC (/blocs)
The repo follows the BLoC (Business Logic Components) architectural pattern based on separated components, this
pattern allow a good separation of concepts, and the ability to easily modify and scale the solution without problems.

In the subject of this solution in particular only a single BLoC was used and needed => FinantialHealthBloc

This BLoC is responsible for managing the whole logic of the app and handling several events:

- **FinantialHealthStart** Event: Responsible to start the app and pushing to **HomePage** => emits the **FinantialHealthTest** state
- **CalculateFinantialHealthScore** Event: Responsible to calculate the user Finantial Health and push to **FinantialResultPage** => emits the **FinantialHealthFinished** state

### Constants (/constants)
Simple **constants.dart** file, responsible to gather all raw strings and static parameters in the app
Obs: This could be easily extracted to an internationalization approach using intl, i just didn't want to introduce to much complexity

### Models (/models)
**UserFinantialStatus**: Model class that handles, in this case, a single property which is:

- score: string that contains one of 3 possible scores ('HEALTHY', 'MEDIUM', 'LOW')

### Pages (/pages)
The repo contains in total 2 widget pages that listen and consume BLoC states and render the proper UI

- **HomePage**: First Page to be rendered by App and responsible to handle the inputs of the user in the Annual income and Monthly Costs inputs
- **FinantialResultPage**: Page responsible to render the result from the calculation of the Finantial Health score of the user

### Widgets (/widgets)
General widgets folder where we should place all extracted widgets that could be reused across the app

## Testing
The testing part was taking into account for this app aswell, being accomplished a total of **87.7%** 
code coverage (check in file coverage/html/index.html), which seems to me reasonable and a stable metric to push 
the code.

The BLoC was tested using the **bloc_test** library and several dependencies were mocked in other to proceed with the
 tests.

 Dart format and Flutter analyze commands were run, with no issues found! 

## Running the App
If using VSCode a launch.json file was created in order to quickly run the main.dart, other approach would need to call the $ flutter run command


 ## Improvements
 The followig improvements could be done in order to increase the scalability of the app like:

 - Add translations instead of externalizing the string in the constants file
 - Better wrapping of the ThemeData to include the TextStyles, Buttons and Colors (obs: i tried to add at least one font for record, but i noticed the Figma file has a lot of different Fonts)