import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CursorPainter extends CustomPainter {
  final Color cursorColor;
  final double cursorWidth;

  CursorPainter({this.cursorColor = Colors.black, this.cursorWidth = 2});

  @override
  void paint(Canvas canvas, Size size) {
    const p1 = Offset.zero;
    final p2 = Offset(0, size.height);
    final paint = Paint()
      ..color = cursorColor
      ..strokeWidth = cursorWidth;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TextFormFieldFillWord extends StatefulWidget {
  /// The [BuildContext] of the application
  final BuildContext appContext;
  final int length;

  /// returns the current typed text in the fields
  final ValueChanged<String> onChanged;

  /// returns the typed text when all pins are set
  final ValueChanged<String>? onCompleted;

  /// returns the typed text when user presses done/next action on the keyboard
  final ValueChanged<String>? onSubmitted;

  /// the style of the text, default is [ fontSize: 20, fontWeight: FontWeight.bold]
  final TextStyle? textStyle;

  /// the style of the pasted text, default is [fontWeight: FontWeight.bold] while
  /// [TextStyle.color] is [ThemeData.colorScheme.onSecondary]

  /// This defines how the elements in the pin code field align. Default to [MainAxisAlignment.spaceBetween]
  final MainAxisAlignment mainAxisAlignment;

  /// [AnimationType] for the text to appear in the pin code field. Default is [AnimationType.slide]
  final AnimationType animationType;

  /// Duration for the animation. Default is [Duration(milliseconds: 150)]
  final Duration animationDuration;

  /// [Curve] for the animation. Default is [Curves.easeInOut]
  final Curve animationCurve;

  /// [TextInputType] default is [TextInputType.text]
  final TextInputType keyboardType;

  /// If the pin code field should be autofocused or not. Default is [false]
  final bool autoFocus;

  /// Should pass a [FocusNode] to manage it from the parent
  final FocusNode? focusNode;

  /// A list of [TextInputFormatter] that goes to the TextField
  final List<TextInputFormatter> inputFormatters;

  /// Enable or disable the Field. Default is [true]
  final bool enabled;

  /// [TextEditingController] to control the text manually. Sets a default [TextEditingController()] object if none given
  final TextEditingController? controller;

  /// Enabled Color fill for individual pin fields, default is [false]
  final bool enableActiveFill;

  /// Auto dismiss the keyboard upon inputting the value for the last field. Default is [true]
  final bool autoDismissKeyboard;

  /// Auto dispose the [controller] and [FocusNode] upon the destruction of widget from the widget tree. Default is [true]
  final bool autoDisposeControllers;

  final TextInputAction textInputAction;

  /// Triggers the error animation
  final StreamController<ErrorAnimationType>? errorAnimationController;

  /// Method for detecting a pin_code form tap
  /// work with all form windows
  final Function? onTap;

  /// Validator for the [TextFormField]
  final FormFieldValidator<String>? validator;

  /// An optional method to call with the final value when the form is saved via
  /// [FormState.save].
  final FormFieldSetter<String>? onSaved;

  /// Margin for the error text
  /// Default is [EdgeInsets.zero].
  final EdgeInsets errorTextMargin;

  /// [TextDirection] to control a direction in which text flows.
  /// Default is [TextDirection.ltr]
  final TextDirection errorTextDirection;

  /// Enables pin autofill for TextFormField.
  /// Default is true
  final bool enableCellAutofill;

  /// Error animation duration
  final int errorAnimationDuration;

  /// Whether to show cursor or not
  final bool showCursor;

  /// The color of the cursor, default to Theme.of(context).accentColor
  final Color? cursorColor;

  /// width of the cursor, default to 2
  final double cursorWidth;

  /// Height of the cursor, default to FontSize + 8;
  final double? cursorHeight;

  /// Autofill cleanup action
  final AutofillContextAction onAutoFillDisposeAction;

  /// Use external [AutoFillGroup]
  final bool useExternalAutoFillGroup;

  /// Displays a hint or placeholder in the field if it's value is empty.
  /// It only appears if it's not null. Single character is recommended.
  final String? hintWord;

  /// the style of the [hintCharacter], default is [fontSize: 20, fontWeight: FontWeight.bold]
  /// and it also uses the [textStyle]'s properties
  /// [TextStyle.color] is [Colors.grey]
  final TextStyle? hintStyle;

  /// ScrollPadding follows the same property as TextField's ScrollPadding, default to
  /// const EdgeInsets.all(20),
  final EdgeInsets scrollPadding;

  /// Makes the pin cells readOnly
  final bool readOnly;

  /// Enable auto unfocus
  final bool autoUnfocus;

  const TextFormFieldFillWord({
    Key? key,
    required this.appContext,
    required this.length,
    this.controller,
    required this.onChanged,
    this.onCompleted,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.animationDuration = const Duration(milliseconds: 150),
    this.animationCurve = Curves.easeInOut,
    this.animationType = AnimationType.scale,
    this.keyboardType = TextInputType.text,
    this.autoFocus = true,
    this.focusNode,
    this.onTap,
    this.enabled = true,
    this.inputFormatters = const <TextInputFormatter>[],
    this.textStyle,
    this.enableActiveFill = false,
    this.textInputAction = TextInputAction.done,
    this.autoDismissKeyboard = false,
    this.autoDisposeControllers = true,
    this.onSubmitted,
    this.errorAnimationController,
    this.validator,
    this.onSaved,
    this.errorTextDirection = TextDirection.ltr,
    this.errorTextMargin = EdgeInsets.zero,
    this.enableCellAutofill = true,
    this.errorAnimationDuration = 500,
    this.showCursor = true,
    this.cursorColor,
    this.cursorWidth = 1,
    this.cursorHeight,
    this.hintWord,
    this.hintStyle,
    this.autoUnfocus = true,
    this.readOnly = false,

    /// Default for [AutofillGroup]
    this.onAutoFillDisposeAction = AutofillContextAction.commit,

    /// Default create internal [AutofillGroup]
    this.useExternalAutoFillGroup = false,
    this.scrollPadding = const EdgeInsets.all(20),
  }) : super(key: key);

  @override
  TypeWithHintState createState() => TypeWithHintState();
}

class TypeWithHintState extends State<TextFormFieldFillWord>
    with TickerProviderStateMixin {
  TextEditingController? _textEditingController;
  FocusNode? _focusNode;
  late List<String> _inputList;
  int _selectedIndex = 0;
  BorderRadius? borderRadius;

  // AnimationController for the error animation
  late AnimationController _controller;

  late AnimationController _cursorController;

  StreamSubscription<ErrorAnimationType>? _errorAnimationSubscription;
  bool isInErrorMode = false;

  // Animation for the error animation
  late Animation<Offset> _offsetAnimation;

  late Animation<double> _cursorAnimation;

  TextStyle get _textStyle => const TextStyle(
          fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black)
      .merge(widget.textStyle);

  TextStyle get _hintStyle => _textStyle
      .copyWith(
        color: Colors.grey,
      )
      .merge(widget.hintStyle);

  @override
  void initState() {
    _assignController();

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode!.addListener(() {
      setState(() {});
    }); // Rebuilds on every change to reflect the correct color on each field.
    _inputList = List<String>.filled(widget.length, "");

    _cursorController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _cursorAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _cursorController,
      curve: Curves.easeIn,
    ));
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.errorAnimationDuration),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(.1, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));
    if (widget.showCursor) {
      _cursorController.repeat();
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    if (widget.errorAnimationController != null) {
      _errorAnimationSubscription =
          widget.errorAnimationController!.stream.listen((errorAnimation) {
        if (errorAnimation == ErrorAnimationType.shake) {
          _controller.forward();
          setState(() => isInErrorMode = true);
        }
      });
    }
    // If a default value is set in the TextEditingController, then set to UI
    if (_textEditingController!.text.isNotEmpty) {
      _setTextToInput(_textEditingController!.text);
    }
    super.initState();
  }

  // validating all the values

  // Assigning the text controller, if empty assiging a new one.
  void _assignController() {
    if (widget.controller == null) {
      _textEditingController = TextEditingController();
    } else {
      _textEditingController = widget.controller;
    }

    _textEditingController?.addListener(() {
      if (isInErrorMode) {
        setState(() => isInErrorMode = false);
      }

      var currentText = _textEditingController!.text;

      if (widget.enabled && _inputList.join("") != currentText) {
        if (currentText.length >= widget.length) {
          if (widget.onCompleted != null) {
            if (currentText.length > widget.length) {
              // removing extra text longer than the length
              currentText = currentText.substring(0, widget.length);
            }
            //  delay the onComplete event handler to give the onChange event handler enough time to complete
            Future.delayed(const Duration(milliseconds: 300),
                () => widget.onCompleted!(currentText));
          }

          if (widget.autoDismissKeyboard) _focusNode!.unfocus();
        }

        widget.onChanged(currentText);
      }
      _setTextToInput(currentText);
    });
  }

  @override
  void dispose() {
    if (widget.autoDisposeControllers) {
      _textEditingController!.dispose();
      _focusNode!.dispose();
      // if (!kReleaseMode) {
      //   print(
      //       "*** Disposing _textEditingController and _focusNode, To disable this feature please set autoDisposeControllers = false***");
      // }
    }
    _errorAnimationSubscription?.cancel();
    _cursorController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget _renderCells({
    @required int? index,
  }) {
    String hideHint = widget.hintWord!.replaceAll(RegExp(r'[aiueoynt]'), ' ');
    List<String> letter = hideHint.split('');

    if (_inputList[index!].isEmpty) {
      return Text(
        letter[index],
        key: ValueKey(_inputList[index]),
        style: _hintStyle,
      );
    }
    return Text(
      _inputList[index],
      key: ValueKey(_inputList[index]),
      style: _textStyle,
    );
  }

  /// Builds the widget to be shown
  Widget buildChild(int index) {
    if (((_selectedIndex == index) ||
            (_selectedIndex == index + 1 && index + 1 == widget.length)) &&
        _focusNode!.hasFocus &&
        widget.showCursor) {
      var cursorColor = widget.cursorColor ??
          Theme.of(widget.appContext).textSelectionTheme.cursorColor ??
          Theme.of(context).colorScheme.onSecondary;
      final cursorHeight = widget.cursorHeight ?? _textStyle.fontSize! + 1;

      return Align(
        alignment: Alignment.centerLeft,
        child: FadeTransition(
          opacity: _cursorAnimation,
          child: CustomPaint(
            size: Size(0, cursorHeight),
            painter: CursorPainter(
              cursorColor: cursorColor,
              cursorWidth: widget.cursorWidth,
            ),
          ),
        ),
      );
    }

    return _renderCells(
      index: index,
    );
  }

  List<Widget> _generateFields() {
    //this make hint fit underline. Ex: learn by heart =>  _____ __ _____
    String rawHint = widget.hintWord!;
    List<String> splitRawHint = rawHint.split('');

    List<Widget> result = <Widget>[];
    for (int i = 0; i < widget.length; i++) {
      result.add(
        Container(
            padding: EdgeInsets.zero,
            child: AnimatedContainer(
              curve: widget.animationCurve,
              duration: widget.animationDuration,
              width: 15.0,
              // size of later underline
              height: 30.0,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                  border: Border(
                    bottom: BorderSide(
                      color:
                          splitRawHint[i] == ' ' ? Colors.white : Colors.black,
                      width: 2.0,
                    ),
                  )),
              child: Center(
                child: AnimatedSwitcher(
                  switchInCurve: widget.animationCurve,
                  switchOutCurve: widget.animationCurve,
                  duration: widget.animationDuration,
                  transitionBuilder: (child, animation) {
                    if (widget.animationType == AnimationType.scale) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    } else if (widget.animationType == AnimationType.fade) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    } else if (widget.animationType == AnimationType.none) {
                      return child;
                    } else {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, .5),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    }
                  },
                  child: buildChild(i),
                ),
              ),
            )),
      );
    }
    return result;
  }

  void _onFocus() {
    if (widget.autoUnfocus) {
      if (_focusNode!.hasFocus &&
          MediaQuery.of(widget.appContext).viewInsets.bottom == 0) {
        _focusNode!.unfocus();
        Future.delayed(
            const Duration(microseconds: 1), () => _focusNode!.requestFocus());
      } else {
        _focusNode!.requestFocus();
      }
    } else {
      _focusNode!.requestFocus();
    }
  }

  void _setTextToInput(String data) async {
    var replaceInputList = List<String>.filled(widget.length, "");

    for (int i = 0; i < widget.length; i++) {
      replaceInputList[i] = data.length > i ? data[i] : "";
    }

    if (mounted) {
      setState(() {
        _selectedIndex = data.length;
        _inputList = replaceInputList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var textField = Directionality(
      textDirection: widget.errorTextDirection,
      child: Padding(
        padding: widget.errorTextMargin,
        child: TextFormField(
          textInputAction: widget.textInputAction,
          controller: _textEditingController,
          focusNode: _focusNode,
          enabled: widget.enabled,
          autofillHints: widget.enableCellAutofill && widget.enabled
              ? <String>[AutofillHints.oneTimeCode]
              : null,
          autofocus: widget.autoFocus,
          autocorrect: false,
          // onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onSaved: widget.onSaved,
          inputFormatters: [
            ...widget.inputFormatters,
            LengthLimitingTextInputFormatter(
              widget.length,
            ), // this limits the input length
          ],
          // trigger on the complete event handler from the keyboard
          onFieldSubmitted: widget.onSubmitted,
          enableInteractiveSelection: false,
          showCursor: false,
          // using same as background color so tha it can blend into the view
          cursorWidth: 0.01,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          style: const TextStyle(
            color: Colors.transparent,
            height: 1,
            fontSize:
                0.01, // it is a hidden textfield which should remain transparent and extremely small
          ),
          scrollPadding: widget.scrollPadding,
          readOnly: widget.readOnly,
        ),
      ),
    );

    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.green,
              style: BorderStyle.solid,
              width: 0.5,
            )),
        child: Stack(
          children: <Widget>[
            AbsorbPointer(
              // this is a hidden textfield under the pin code fields.
              absorbing: true, // it prevents on tap on the text field
              child: widget.useExternalAutoFillGroup
                  ? textField
                  : AutofillGroup(
                      onDisposeAction: widget.onAutoFillDisposeAction,
                      child: textField,
                    ),
            ),
            GestureDetector(
              onTap: () {
                if (widget.onTap != null) widget.onTap!();
                _onFocus();
              },
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 5,
                  children: _generateFields(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum ErrorAnimationType { shake }

enum AnimationType { scale, slide, fade, none }
