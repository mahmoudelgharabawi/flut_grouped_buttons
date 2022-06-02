# flut_grouped_buttons

Only a single Flutter widgets that makes group Checkboxes and Radio Buttons in Very Easy Way!

## Installing

Add the following to your `pubspec.yaml` file:

    dependencies:
        flut_grouped_buttons: ^0.0.5

## Simple Usage
#### Creating a basic `CheckBox` with string list

    FlutGroupedButtons<String>(
      data: <String>[
        "Saturday",
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
      ],
      onSelected: (List<String> checked) => print(checked.toString())
    );

#### Creating a basic `CheckBox` with map list

    FlutGroupedButtons<Map<String, String>>(
        idKey: 'id',
        valueKey: 'result',
        data: const [
        {"id": 'id1', "result": "Saturday"},
        {"id": 'id2', "result": "Sunday"},
        {"id": 'id3', "result": "Monday"},
        {"id": 'id4', "result": "Tuesday"},
        {"id": 'id5', "result": "Wednesday"},
        {"id": 'id6', "result": "Thursday"},
        {"id": 'id7', "result": "Friday"},
        ],
        onChanged: (value) => print(value),
    ),

#### Creating a basic `RadioButton` with string list

    FlutGroupedButtons<String>(
        isRadio: true,
      data: <String>[
        "Saturday",
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
      ],
      onSelected: (List<String> checked) => print(checked.toString())
    );


#### Creating a basic `RadioButton` with map list here the return value is the value of idKey you iserted

    FlutGroupedButtons<Map<String, String>>(
        isRadio: true,
        idKey: 'id',
        valueKey: 'result',
        data: const [
        {"id": 'id1', "result": "Saturday"},
        {"id": 'id2', "result": "Sunday"},
        {"id": 'id3', "result": "Monday"},
        {"id": 'id4', "result": "Tuesday"},
        {"id": 'id5', "result": "Wednesday"},
        {"id": 'id6', "result": "Thursday"},
        {"id": 'id7', "result": "Friday"},
        ],
        onChanged: (value) => print(value),
    ),

<!-- 
#### Screenshot
<img width="250px" src="https://raw.githubusercontent.com/akshathjain/grouped_buttons/master/screenshots/basicusagescreenshot.png" alt="Basic Usage"/> -->

<!-- ## Custom Usage
There are several options that allow for more control. -->

#### Properties `FlutGroupedButtons`
|   Properties  |  Description |
|---------------|--------------|
|`isRadio`  |If it's true Activate The Radio Button Widget.  |
|`isRow`   |If it's true it will be Row.   |
|`idKey`      |Specifies the id key value when you use map input for data only use for map . |
| `valueKey`    |Specifies the value key in your map input for data only use for map. |
|`activeColor`  |The active color you choose.   |
|`checkColor`   |The check color you choose.   |
|`labelStyle`   |The Style for your text.   |
|`checkShape`   |The outlined shape you choose for your check shape.   |
|`titleCheckSpace`|The space between your title and your checkbox.   |


#### Screenshot
<img width="250px" src="https://res.cloudinary.com/m-a-h-g/image/upload/v1654159243/example_dbyyip.png" alt="Basic Usage"/>
