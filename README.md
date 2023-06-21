<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

- Add mention functionality easily with the TextController and TextField provided by Simple Mention!
- 오로지 가볍고 간단한 멘션 기능을 제공하는 것이 목적입니다!


<p>
  <img src="https://github.com/arcanine33/simple_mention/assets/39107341/e3d3dbd2-02ef-49a8-a0f4-fb0aeab271cc"
    alt="An animated image demonstrating the English Mention functionality" height="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/arcanine33/simple_mention/assets/39107341/83b5d5c7-554e-4cd4-9fcf-e981c493152f"
   alt="An animated image demonstrating the Korean Mention functionality " height="400"/>
</p>



TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features
Use this plugin in your Flutter app to:
- Mention users in a text field
- 선택한 멘션 유저의 이름이 파란색으로 표시 됩니다.

## Getting started
1. MentionMemberModel 에 MentionList 에 띄울 유저의 정보를 넣어 주세요.
2. 이를 통해 MentionList 를 생성 합니다.
3. MentionList 를 MentionTextFieldController 생성자에 넣어 주세요.

```dart
late MentionTextFieldController controller;

@override
void initState() {
  controller = MentionTextFieldController(
      myName: 'James Anderson', memberList: [
    MentionMemberModel(uid: '1', name: 'Emily Thompson', picture: 'assets/b.jpg'),
    MentionMemberModel(uid: '2', name: 'Oliver Smith', picture: 'assets/a.jpg'),
    MentionMemberModel(uid: '3', name: 'Sophia Johnson', picture: ''),
    MentionMemberModel(uid: '4', name: 'Elijah Williams', picture: ''),
    MentionMemberModel(uid: '5', name: 'Olivia Jones', picture: ''),
    MentionMemberModel(uid: '6', name: 'William Brown', picture: 'assets/d.jpg'),
    MentionMemberModel(uid: '7', name: 'Ava Davis', picture: 'assets/c.jpg'),
    MentionMemberModel(uid: '8', name: 'James Miller', picture: ''),
    MentionMemberModel(uid: '9', name: 'Isabella Wilson', picture: 'assets/e.jpg'),
    MentionMemberModel(uid: '10', name: '홍길동', picture: ''),
    MentionMemberModel(uid: '11', name: '너무 멋진 강아지', picture: ''),
    MentionMemberModel(uid: '12', name: '행복한 다람쥐', picture: ''),
    MentionMemberModel(uid: '13', name: '조용한 고양이', picture: ''),
  ]);
  super.initState();
} 
```

4. MentionTextField 를 원하는 곳에 작성 합니다.
5. controller 매개변수에 MentionTextFieldController 를 넣어 주세요.
6. 끝! 지정한 pattern 을 눌러 멘션을 사용 할 수 있습니다.


## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
