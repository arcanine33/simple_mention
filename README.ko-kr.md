- simple mention 에서 제공하는 TextController 와 TextFiled 로 간편하게 멘션 기능을 추가하세요!
- 오로지 가볍고 간단한 멘션 기능을 제공하는 것이 목적입니다!
- flutter_mention package 에서 영감을 받아 만들었습니다.


<p>
  <img src="https://github.com/arcanine33/simple_mention/assets/39107341/0bfde0b8-e1e9-4e32-b0c1-741ae96e538f"
    alt="An animated image demonstrating the English Mention functionality" height="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/arcanine33/simple_mention/assets/39107341/e170462c-8de7-4067-8914-eb0d5344d8f2"
   alt="An animated image demonstrating the Korean Mention functionality " height="400"/>
</p>


## Features
Use this plugin in your Flutter app to:
- 텍스트 필드에서 멘션을 사용할 수 있습니다.
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


## TODO
- 이름에 공백이 들어갈 경우 공백은 _ 로 치환해 보입니다. 공백으로 보여줄 방법을 찾고 있습니다.
- 멘션을 누르면 멘션된 유저의 이름이 파란색으로 표시됩니다. 다른 색상으로 변경할 수 있는 기능을 추가할 예정입니다.
- 지정한 본인의 이름을 누르면 다른 색상으로 표시할 수 있는 기능을 추가할 예정입니다.
- 패키지에 대한 테스트 코드가 없습니다. 추가할 예정입니다. (도움 부탁드립니다!)
- 그 외 다양한 아이디어를 환영합니다!
