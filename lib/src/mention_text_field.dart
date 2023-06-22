import 'dart:async';

import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
export 'package:flutter/services.dart' show SmartDashesType, SmartQuotesType, TextCapitalization, TextInputAction, TextInputType;
import 'package:simple_mention/src/mention_text_field_controller.dart';

import 'member_list.dart';
import 'mention_member_model.dart';
import 'words_length_model.dart';

class MentionTextField extends StatefulWidget {
  final MentionTextFieldController controller;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType smartDashesType;
  final SmartQuotesType smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool readOnly;
  static const int noMaxLength = -1;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final bool? cursorOpacityAnimates;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior dragStartBehavior;
  bool get selectionEnabled => enableInteractiveSelection;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final String? restorationId;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final bool canRequestFocus;
  final UndoHistoryController? undoController;
  static Widget _defaultContextMenuBuilder(BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }
  final SpellCheckConfiguration? spellCheckConfiguration;
  static const TextStyle materialMisspelledTextStyle =
  TextStyle(
    decoration: TextDecoration.underline,
    decorationColor: Colors.red,
    decorationStyle: TextDecorationStyle.wavy,
  );
  final double? thickness;

  const MentionTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.undoController,
    this.decoration = const InputDecoration(),
    TextInputType? keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    bool? enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.onTapOutside,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.contentInsertionConfiguration,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder = _defaultContextMenuBuilder,
    this.canRequestFocus = true,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.thickness,
  }) : assert(obscuringCharacter.length == 1),
        smartDashesType = smartDashesType ?? (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
        smartQuotesType = smartQuotesType ?? (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
        (maxLines == null) || (minLines == null) || (maxLines >= minLines),
        "minLines can't be greater than maxLines",
        ),
        assert(
        !expands || (maxLines == null && minLines == null),
        'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1, 'Obscured fields cannot be multiline.'),
        assert(maxLength == null || maxLength == TextField.noMaxLength || maxLength > 0),
  // Assert the following instead of setting it directly to avoid surprising the user by silently changing the value they set.
        assert(
        !identical(textInputAction, TextInputAction.newline) ||
            maxLines == 1 ||
            !identical(keyboardType, TextInputType.text),
        'Use keyboardType TextInputType.multiline when using TextInputAction.newline on a multiline TextField.',
        ),
        keyboardType = keyboardType ?? (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        enableInteractiveSelection = enableInteractiveSelection ?? (!readOnly || !obscureText);

  @override
  State<MentionTextField> createState() => _MentionTextFieldState();
}

class _MentionTextFieldState extends State<MentionTextField> {
  Timer? _debounce;
  ValueNotifier<bool> showSuggestions = ValueNotifier(false);
  WordsLength? _selectedMention;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    widget.controller.addListener(suggestionListener);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MentionTextField oldWidget) {
    if (oldWidget.controller.text != widget.controller.text) {
      widget.controller.selection = TextSelection.fromPosition(
          TextPosition(offset: widget.controller.text.length));
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.controller.removeListener(suggestionListener);
    super.dispose();
  }

  void suggestionListener() {
    final cursorPos = widget.controller.selection.baseOffset;

    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(microseconds: 500), () {
      if (cursorPos < 0) return;

      int pos = 0;

      final wordsLengthList = <WordsLength>[];
      List<String> textList =
      widget.controller.value.text.split(RegExp(r'(\s)'));

      RegExp mentionPattern = RegExp(r"(\s)" + (widget.controller.pattern));
      bool startPattern = widget.controller.value.text.startsWith(widget.controller.pattern);
      bool whiteSpaceAfterPattern =
      widget.controller.value.text.contains(mentionPattern);
      if (!startPattern && !whiteSpaceAfterPattern) {
        removeMentionList();
        return;
      }

      //텍스트 리스트 마지막에 @가 2개 이상 있을 때 제거
      if (textList.last.contains(RegExp(r"@{2,}"))) {
        removeMentionList();
        return;
      }

      for (String element in textList) {
        wordsLengthList.add(
            WordsLength(str: element, start: pos, end: pos + element.length));
        pos = pos + element.length + 1;
      }

      final val = wordsLengthList.indexWhere((element) {
        return element.end == cursorPos &&
            element.str.toLowerCase().startsWith(widget.controller.pattern);
      });

      // val 이 0 이면 글자 끝에 커서가 가 있고, pattern 과 매칭되는 상태
      showSuggestions.value = val != -1;

      _selectedMention = val == -1 ? null : wordsLengthList[val];
      if (showSuggestions.value) {
        showMentionList();
      } else {
        removeMentionList();
      }
    });
  }

  void showMentionList() {
    List<MentionMemberModel> memberList = getPossibleMentionMemberList();
    if (memberList.isEmpty) return;
    updateOverlay();

    if (_overlayEntry == null) {
      setOverlayEntry(_mentionList());
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  List<MentionMemberModel> getPossibleMentionMemberList() {
    List<MentionMemberModel> member =
        widget.controller.memberList.where((element) {
      final name = element.nameForMention;


      final selectedMentionText = _selectedMention?.str
          .toLowerCase()
          .replaceAll(RegExp(widget.controller.pattern), '');
      return selectedMentionText == null || name.toLowerCase() == selectedMentionText
          ? true
          : name.toLowerCase().contains(selectedMentionText);
    }).toList();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (member.isEmpty) {
        showSuggestions.value = false;
        removeMentionList();
      }
    });
    return member;
  }

  void removeMentionList() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void updateOverlay() {
    _overlayEntry?.markNeedsBuild();
  }

  void setOverlayEntry(OverlayEntry entry) {
    _overlayEntry = entry;
  }

  void addMention(MentionMemberModel member) {
    final selectedMention = _selectedMention!;
    int nextCursorPosition = 0;
    setState(() {
      _selectedMention = null;
    });

    widget.controller.text = widget.controller.value.text.replaceRange(
      selectedMention.start,
      selectedMention.end,
      "${widget.controller.pattern}${member.nameForMention}${' '}",
    );

    nextCursorPosition =
        selectedMention.start + 1 + member.nameForMention.length;

    nextCursorPosition++;
    widget.controller.selection =
        TextSelection.fromPosition(TextPosition(offset: nextCursorPosition));
  }

  OverlayEntry _mentionList() {
    return OverlayEntry(builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: removeMentionList,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: showSuggestions,
            builder: (context, show, child) {
              return Positioned(
                height: 136,
                width: MediaQuery.of(context).size.width - 16,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  targetAnchor: Alignment.topCenter,
                  followerAnchor: Alignment.bottomCenter,
                  offset: const Offset(0, 0),
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    elevation: 9,
                    child: MemberList(
                      data: getPossibleMentionMemberList(),
                      onTap: (MentionMemberModel value) {
                        addMention(value);
                        showSuggestions.value = false;
                      },
                    ),
                  ),
                ),
              );
            },
            child: _commentTextField(),
          ),
        ],
      );
    });
  }

  Widget _commentTextField() {
    return TextField(
      key: widget.key,
      focusNode: widget.focusNode,
      controller: widget.controller,
      autofocus: widget.autofocus,
      textInputAction: TextInputAction.newline,
      decoration: widget.decoration,
      style: widget.style,
      textAlign: widget.textAlign,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      autocorrect: widget.autofocus,
      autofillHints: widget.autofillHints,
      buildCounter: widget.buildCounter,
      canRequestFocus: widget.canRequestFocus,
      clipBehavior: widget.clipBehavior,
      contentInsertionConfiguration: widget.contentInsertionConfiguration,
      contextMenuBuilder: widget.contextMenuBuilder,
      cursorColor: widget.cursorColor,
      cursorHeight: widget.cursorHeight,
      cursorOpacityAnimates: widget.cursorOpacityAnimates,
      cursorRadius: widget.cursorRadius,
      cursorWidth: widget.cursorWidth,
      enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      enableSuggestions: widget.enableSuggestions,
      expands: widget.expands,
      inputFormatters: widget.inputFormatters,
      keyboardAppearance: widget.keyboardAppearance,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: widget.maxLines,
      minLines: widget.maxLines,
      obscuringCharacter: widget.obscuringCharacter,
      dragStartBehavior: widget.dragStartBehavior,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      scrollPadding: widget.scrollPadding,
      scrollPhysics: widget.scrollPhysics,
      magnifierConfiguration: widget.magnifierConfiguration,
      selectionControls: widget.selectionControls,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      strutStyle: widget.strutStyle,
      textAlignVertical: widget.textAlignVertical,
      mouseCursor: widget.mouseCursor,
      scrollController: _scrollController,
      obscureText: widget.obscureText,
      onTapOutside: widget.onTapOutside,
      restorationId: widget.restorationId,
      scribbleEnabled: widget.scribbleEnabled,
      selectionHeightStyle: widget.selectionHeightStyle,
      selectionWidthStyle: widget.selectionWidthStyle,
      spellCheckConfiguration: widget.spellCheckConfiguration,
      textCapitalization: widget.textCapitalization,
      textDirection: widget.textDirection,
      undoController: widget.undoController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        thickness: widget.thickness,
        child: CompositedTransformTarget(
          link: _layerLink,
          child: _commentTextField(),
        ),
      ),
    );
  }
}
