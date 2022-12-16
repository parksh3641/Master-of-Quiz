import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gosuoflife/auth_service.dart';
import 'package:gosuoflife/market_page.dart';
import 'package:gosuoflife/rank_service.dart';
import 'package:gosuoflife/result.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'login_page.dart';
import 'main.dart';

class Quiz2 extends StatefulWidget {
  const Quiz2({Key? key}) : super(key: key);

  @override
  State<Quiz2> createState() => _Quiz2State();
}

int index = 0;
int score = 0;

List<int> numberList = [];

List<String> dataList = [
  "마음과 마음으로 서로 뜻이 잘 통함",
  "굳게 합심하여 한마음 한 몸이 됨을 뜻함",
  "사람들의 행동과 생각이 조금도 다르지 않고 완전히 하나가 된 상태를 뜻함",
  "의견이나 주장 등이 완전히 하나로 일치함을 뜻함",
  "오직 하나만 있고 둘은 없음을 뜻함",
  "입은 다르나 목소리는 같다는 말로, 여러 사람의 말이 한결같음을 뜻함",
  "한 번 그물을 쳐서 고기를 다 잡는다는 말로, 어떤 무리를 한꺼번에 모조리 잡음을 뜻함",
  "미리 준비해 두면 근심할 것이 없음을 뜻함",
  "입은 있으나 할말이 없다는 말로, 변명할 말이 없음을 뜻함",
  "환경에 적응하는 것만 살아남고 그렇지 못한 것은 도태되는 현상을 뜻함",
  "눈이 내리는 위에 서리까지 더한다는 말로, 어려운 일이나 불행이 겹쳐서 일어남을 뜻함",
  "이러지도 못하고 저러지도 못하는 매우 곤란한 상태를 뜻함",
  "좋은 일에는 흔히 시샘하는 듯이 안 좋은 일들이 많이 따름을 뜻함",
  "풀을 묶어서 은혜에 보답한다는 말로, 죽은 뒤에라도 은혜를 잊지 않고 갚음을 뜻함",
  "인생의 부귀영화가 덧없이 사라짐을 뜻함",
  "남의 비위를 맞추거나 이로운 조건을 내세워 꾀는 말을 뜻함",
  "옳고 그름에 상관없이 자기 비위에 맞으면 좋아하고 그렇지 않으면 싫어함을 뜻함",
  "어떤 물건을 실제로 보면 가지고 싶은 욕심이 생김을 뜻함",
  "여러 차례 죽을 고비를 겪고 겨우 살아남을 뜻함",
  "고생 끝에 즐거움이 옴을 뜻함",
  "어려운 처지에 있는 사람끼리 서로 동정하고 도움을 뜻함",
  "완전히 잠이 들지도 잠에서 깨어나지도 않아 정신이 몽롱한 상태를 뜻함",
  "일의 갈피를 잡을 수 없거나 사람의 행적을 전혀 알 수가 없는 상태를 뜻함",
  "두 사람이 다투고 있는 사이에 아무런 관계도 없는 제삼자가 이익을 봄을 뜻함.",
  "같은 무리나 부류끼리 서로 사귐을 뜻함",
  "나날이 발전하거나 성장함을 뜻함",
  "한 가지 일로 두 가지 또는 그 이상의 이득을 얻음을 뜻함",
  "매우 사랑하고 소중히 여김을 뜻함",
  "어찌할 도리나 방책이 없어 꼼짝 못함을 뜻함",
  "아무에게도 도움이나 지지를 받을 수 없는 고립된 상태를 뜻함",
  "절망 상태에 빠져 스스로 자신을 돌보지 않음을 뜻함",
  "어릴 적부터 같이 놀며 자란 친한 친구를 뜻함",
  "결심이 사흘을 지나지 못함을 뜻함",
  "너무 두려워서 벌벌 떨며 조심함을 뜻함",
  "오직 한 가지에 변함없는 마음을 뜻함",
  "마음이 불안하거나 걱정스러워 자리에 가만히 앉아 있지 못하고 안절부절못함을 뜻함",
  "지극한 정성에 하늘이 감동함을 뜻함",
  "온 세상이 태평함을 뜻함",
  "그때그때 처한 형편에 따라 알맞게 일을 처리함을 뜻함",
  "갑자기 생긴 일을 우선 그때의 사정에 따라 둘러맞추어 처리함을 뜻함"
];

List<String> answerList1 = [
  "이심전심",
  "일심동체",
  "혼연일체",
  "혼연일치",
  "유일무이",
  "이구동성",
  "일망타진",
  "유비무환",
  "유구무언",
  "적자생존",
  "이심전심",
  "일심동체",
  "혼연일체",
  "혼연일치",
  "유일무이",
  "이구동성",
  "일망타진",
  "유비무환",
  "유구무언",
  "적자생존",
  "이심전심",
  "일심동체",
  "혼연일체",
  "혼연일치",
  "유일무이",
  "이구동성",
  "일망타진",
  "유비무환",
  "유구무언",
  "적자생존",
  "자포자기",
  "죽마고우",
  "작심삼일",
  "전전긍긍",
  "일편단심",
  "자포자기",
  "죽마고우",
  "작심삼일",
  "전전긍긍",
  "일편단심",
];
List<String> answerList2 = [
  "설상가상",
  "진퇴양난",
  "호사다마",
  "결초보은",
  "일장춘몽",
  "감언이설",
  "감탄고토",
  "견물생심",
  "구사일생",
  "고진감래",
  "설상가상",
  "진퇴양난",
  "호사다마",
  "결초보은",
  "일장춘몽",
  "감언이설",
  "감탄고토",
  "견물생심",
  "구사일생",
  "고진감래",
  "설상가상",
  "진퇴양난",
  "호사다마",
  "결초보은",
  "일장춘몽",
  "감언이설",
  "감탄고토",
  "견물생심",
  "구사일생",
  "고진감래",
  "좌불안석",
  "지성감천",
  "천하태평",
  "임기응변",
  "임시방편",
  "좌불안석",
  "지성감천",
  "천하태평",
  "임기응변",
  "임시방편"
];
List<String> answerList3 = [
  "동병상련",
  "비몽사몽",
  "오리무중",
  "어부지리",
  "유유상종",
  "일취월장",
  "일석이조",
  "애지중지",
  "속수무책",
  "사면초가",
  "동병상련",
  "비몽사몽",
  "오리무중",
  "어부지리",
  "유유상종",
  "일취월장",
  "일석이조",
  "애지중지",
  "속수무책",
  "사면초가",
  "동병상련",
  "비몽사몽",
  "오리무중",
  "어부지리",
  "유유상종",
  "일취월장",
  "일석이조",
  "애지중지",
  "속수무책",
  "사면초가",
  "이심전심",
  "일심동체",
  "혼연일체",
  "혼연일치",
  "유일무이",
  "이심전심",
  "일심동체",
  "혼연일체",
  "혼연일치",
  "유일무이",
];

List<String> answer = [
  "이심전심",
  "일심동체",
  "혼연일체",
  "혼연일치",
  "유일무이",
  "이구동성",
  "일망타진",
  "유비무환",
  "유구무언",
  "적자생존",
  "설상가상",
  "진퇴양난",
  "호사다마",
  "결초보은",
  "일장춘몽",
  "감언이설",
  "감탄고토",
  "견물생심",
  "구사일생",
  "고진감래",
  "동병상련",
  "비몽사몽",
  "오리무중",
  "어부지리",
  "유유상종",
  "일취월장",
  "일석이조",
  "애지중지",
  "속수무책",
  "사면초가",
  "자포자기",
  "죽마고우",
  "작심삼일",
  "전전긍긍",
  "일편단심",
  "좌불안석",
  "지성감천",
  "천하태평",
  "임기응변",
  "임시방편"
];

class _Quiz2State extends State<Quiz2> {
  @override
  void initState() {
    super.initState();

    numberList.clear();
    CreateUnDuplicateRandom(dataList.length);

    index = 1;
    score = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("상식 퀴즈"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                OpenDialog(context);
              },
              icon: Icon(Icons.clear),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "$index 번째 문제",
                style: TextStyle(color: Colors.black, fontSize: 36),
              ),
              Text(
                "현재 점수 : $score",
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                dataList[numberList[index - 1]],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size(100, 80),
                  ),
                  onPressed: () {
                    setState(() {
                      if (answerList1[numberList[index - 1]] ==
                          answer[numberList[index - 1]]) {
                        Success(context);
                      } else {
                        Failed(context);
                      }
                      Initialize(context);
                    });
                  },
                  child: Text(
                    answerList1[numberList[index - 1]],
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size(100, 80),
                  ),
                  onPressed: () {
                    setState(() {
                      if (answerList2[numberList[index - 1]] ==
                          answer[numberList[index - 1]]) {
                        Success(context);
                      } else {
                        Failed(context);
                      }

                      Initialize(context);
                    });
                  },
                  child: Text(
                    answerList2[numberList[index - 1]],
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size(100, 80),
                  ),
                  onPressed: () {
                    setState(() {
                      if (answerList3[numberList[index - 1]] ==
                          answer[numberList[index - 1]]) {
                        Success(context);
                      } else {
                        Failed(context);
                      }
                      Initialize(context);
                    });
                  },
                  child: Text(
                    answerList3[numberList[index - 1]],
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void Initialize(BuildContext context) async {
    final user = context.read<AuthService>().currentUser()!;
    if (index > 9) {
      ScaffoldMessenger.of(context).clearSnackBars();
      int number = prefs.getInt("QuizScore1") ?? 0;
      if (score > number) {
        // if (number == 0) {
        //   rankService.create(QuizType.Quiz1, "Parker", score, user.uid);
        // } else {
        //   rankService.update(QuizType.Quiz1, "Parker", score, user.uid);
        // }
        prefs.setInt("QuizScore1", score);
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage(score)),
      );
    } else {
      index++;
    }
  }
}

void Success(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("정답입니다!"),
  ));
  score++;
}

void Failed(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("오답입니다"),
  ));
}

void OpenDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: ((context) {
        return AlertDialog(
            title: Text("중단하기"),
            content: Text("퀴즈를 종료할까요?"),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MarketPage()),
                      );
                    },
                    child: Text(
                      "네",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "아니요",
                    ),
                  )
                ],
              ),
            ]);
      }));
}

void CreateUnDuplicateRandom(int max) {
  int currentNumber = Random().nextInt(max);

  for (int i = 0; i < max;) {
    if (numberList.contains(currentNumber)) {
      currentNumber = Random().nextInt(max);
    } else {
      numberList.add(currentNumber);
      i++;
    }
  }
}
