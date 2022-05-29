part of flut_grouped_buttons;

class FlutGroupedButtons<T> extends StatefulWidget {
  /// Data you want to list
  final List<T> data;

  /// The Return Data Action
  final void Function(dynamic) onChanged;

  /// Enable The Ability To Cancel The Radio Checked
  final bool canRadioUnCheck;

  /// Use Group Button As Radio Button
  final bool isRadio;

  /// If You Data is Map The Key Of Your Id
  /// Only Used If Your Data Is A Map
  final String? idKey;

  /// If You Data is Map The Key Of Your Value
  /// Only Used If Your Data Is A Map
  final String? valueKey;

  /// Make Your Group Button Is Row
  final bool isRow;

  /// For Your Active Color
  final Color? activeColor;

  /// For Your Check Color
  final Color? checkColor;

  /// For Your Label Style
  final TextStyle? labelStyle;

  /// To Change Space Between Your Title And Your Check Box
  final double titleCheckSpace;

  /// Change Outlined Shape Of Your Check Box
  final OutlinedBorder? checkShape;

  const FlutGroupedButtons(
      {required this.data,
      required this.onChanged,
      this.isRadio = false,
      this.canRadioUnCheck = false,
      this.isRow = false,
      this.idKey,
      this.activeColor,
      this.checkColor,
      this.valueKey,
      this.labelStyle,
      this.titleCheckSpace = 0,
      this.checkShape,
      Key? key})
      : super(key: key);

  @override
  State<FlutGroupedButtons<T>> createState() => _FlutGroupedButtonsState<T>();
}

class _FlutGroupedButtonsState<T> extends State<FlutGroupedButtons<T>> {
  List<dynamic> dataMap = [];
  List<dynamic> dataChecked = [];
  @override
  void initState() {
    if (widget.idKey == null && widget.valueKey == null) {
      dataMap =
          widget.data.map((e) => {'value': e, "isChecked": false}).toList();
      return;
    }
    var _converted = widget.data.map((e) => e as Map<String, dynamic>).toList();
    dataMap = _converted.map((e) => {...e, 'isChecked': false}).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (dataMap.isNotEmpty) {
      if (widget.isRow) {
        return Wrap(
          children: dataMap
              .map(
                (e) => SizedBox(
                  width: 70,
                  height: 50,
                  child: ListTile(
                    title: Transform(
                      transform: Matrix4.translationValues(
                          widget.titleCheckSpace, 0.0, 0.0),
                      child: Text(
                        widget.valueKey != null
                            ? e[widget.valueKey] ?? ''
                            : e['value'],
                        style: widget.labelStyle,
                      ),
                    ),
                    leading: widget.isRadio
                        ? IgnorePointer(
                            ignoring: (!dataMap.every((element) =>
                                        element['isChecked'] == false)) &&
                                    widget.canRadioUnCheck
                                ? !e['isChecked']
                                : e['isChecked'],
                            child: Checkbox(
                                checkColor: widget.checkColor,
                                activeColor: widget.activeColor ??
                                    Theme.of(context).toggleableActiveColor,
                                shape:
                                    widget.checkShape ?? const StadiumBorder(),
                                value: e['isChecked'],
                                onChanged: (value) {
                                  onChangedRadio(value, e);
                                }),
                          )
                        : Checkbox(
                            shape: widget.checkShape,
                            checkColor: widget.checkColor,
                            activeColor: widget.activeColor ??
                                Theme.of(context).toggleableActiveColor,
                            value: e['isChecked'],
                            onChanged: (value) {
                              onChangedCheckBox(value, e);
                            }),
                  ),
                ),
              )
              .toList(),
        );
      }
      return Column(
        children: dataMap
            .map(
              (e) => ListTile(
                title: Transform(
                  transform: Matrix4.translationValues(
                      widget.titleCheckSpace, 0.0, 0.0),
                  child: Text(
                    widget.valueKey != null
                        ? e[widget.valueKey] ?? ''
                        : e['value'],
                    style: widget.labelStyle,
                  ),
                ),
                leading: widget.isRadio
                    ? IgnorePointer(
                        ignoring: (!dataMap.every((element) =>
                                    element['isChecked'] == false)) &&
                                widget.canRadioUnCheck
                            ? !e['isChecked']
                            : e['isChecked'],
                        child: Checkbox(
                            checkColor: widget.checkColor,
                            activeColor: widget.activeColor ??
                                Theme.of(context).toggleableActiveColor,
                            shape: widget.checkShape ?? const StadiumBorder(),
                            value: e['isChecked'],
                            onChanged: (value) {
                              onChangedRadio(value, e);
                            }),
                      )
                    : Checkbox(
                        shape: widget.checkShape,
                        checkColor: widget.checkColor,
                        activeColor: widget.activeColor ??
                            Theme.of(context).toggleableActiveColor,
                        value: e['isChecked'],
                        onChanged: (value) {
                          onChangedCheckBox(value, e);
                        }),
              ),
            )
            .toList(),
      );
    } else {
      return const Text('Error in Created Group Buttons');
    }
  }

  void onChangedCheckBox(bool? value, dynamic e) {
    dataChecked.contains(widget.valueKey != null ? e : e['value'])
        ? dataChecked.remove(widget.valueKey != null ? e : e['value'])
        : dataChecked.add(widget.valueKey != null ? e : e['value']);
    setState(() {
      e['isChecked'] = value ?? false;
    });
    if (widget.valueKey != null && widget.idKey != null) {
      var result = dataChecked
          .map((e) => {
                widget.idKey: e[widget.idKey],
                widget.valueKey: e[widget.valueKey]
              })
          .toList();
      widget.onChanged(result);
      return;
    }
    widget.onChanged(dataChecked);
  }

  void onChangedRadio(bool? value, dynamic e) {
    setState(() {
      for (var element in dataMap) {
        element['isChecked'] = false;
      }
      e['isChecked'] = value ?? false;
    });

    if (widget.valueKey != null && widget.idKey != null) {
      var result = dataMap
          .map((e) => {
                widget.idKey: e[widget.idKey],
                widget.valueKey: e[widget.valueKey]
              })
          .first;
      widget.onChanged(result);
      return;
    }
    widget.onChanged(e['value']);
  }
}
