### [KOREAN](README.ko-kr.md)

- Add mention functionality easily with the TextController and TextField provided by Simple Mention!
- The goal is to provide only a lightweight and simple mention function!
- It was inspired by the flutter_mention package.

<p>
  <img src="https://github.com/arcanine33/simple_mention/assets/39107341/a27e802c-1fd2-49b2-a213-4161e4c34edf"
    alt="An animated image demonstrating the English Mention functionality" height="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/arcanine33/simple_mention/assets/39107341/26517e38-e45d-457f-a4cc-ed613af12237"
   alt="An animated image demonstrating the Korean Mention functionality " height="400"/>
</p>

## Features
Use this plugin in your Flutter app to:
- Mention users in a text field
- Display the selected mention user's name in blue.

## Getting started
1. Please enter the user information to be displayed in MentionList in the MentionMemberModel.
2. Create a MentionList through this.
3. Put the MentionList into the MentionTextFieldController constructor.

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

4. Write the MentionTextField where you want.
5. Please insert the MentionTextFieldController into the controller parameter.
6. That's it! You can use mention by pressing the specified pattern.


## TODO
- If a space is included in the name, it appears replaced with _. I'm looking for a way to show it as a space.
- When you click on a mention, the mentioned user's name is highlighted in blue. We plan to add a feature to change it to another color.
- We plan to add a feature that allows you to highlight your specified name in a different color when you click on it.
- There is no test code for the package. We plan to add it. (Any help is appreciated!)
- We welcome a variety of other ideas!
