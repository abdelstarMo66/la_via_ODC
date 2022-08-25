import 'package:flutter/material.dart';
import 'package:la_vie/sheared/constant/color.dart';

import '../../sheared/network/local/cashe_helper.dart';
import '../../sheared/style/icon/icon_broken.dart';

class QuestionModel {
  final int numQuestion;
  final String question;
  final String solve1;
  final String solve2;
  final String solve3;

  QuestionModel({
    required this.numQuestion,
    required this.question,
    required this.solve1,
    required this.solve2,
    required this.solve3,
  });
}

List<QuestionModel> Question = [
  QuestionModel(
    numQuestion: 1,
    question: 'What is the user experience?',
    solve1: 'The user experience is how the developer feels about a user.',
    solve2:
        'The user experience is how the user feels about interacting with or experiencing a product.',
    solve3:
        'The user experience is the attitude the UX designer has about a product.',
  ),
  QuestionModel(
    numQuestion: 2,
    question: 'What is the user experience?',
    solve1: 'The user experience is how the developer feels about a user.',
    solve2:
        'The user experience is how the user feels about interacting with or experiencing a product.',
    solve3:
        'The user experience is the attitude the UX designer has about a product.',
  ),
  QuestionModel(
    numQuestion: 3,
    question: 'What is the user experience?',
    solve1: 'The user experience is how the developer feels about a user.',
    solve2:
        'The user experience is how the user feels about interacting with or experiencing a product.',
    solve3:
        'The user experience is the attitude the UX designer has about a product.',
  ),
  QuestionModel(
    numQuestion: 4,
    question: 'What is the user experience?',
    solve1: 'The user experience is how the developer feels about a user.',
    solve2:
        'The user experience is how the user feels about interacting with or experiencing a product.',
    solve3:
        'The user experience is the attitude the UX designer has about a product.',
  ),
  QuestionModel(
    numQuestion: 5,
    question: 'What is the user experience?',
    solve1: 'The user experience is how the developer feels about a user.',
    solve2:
        'The user experience is how the user feels about interacting with or experiencing a product.',
    solve3:
        'The user experience is the attitude the UX designer has about a product.',
  ),
  QuestionModel(
    numQuestion: 6,
    question: 'What is the user experience?',
    solve1: 'The user experience is how the developer feels about a user.',
    solve2:
        'The user experience is how the user feels about interacting with or experiencing a product.',
    solve3:
        'The user experience is the attitude the UX designer has about a product.',
  ),
  QuestionModel(
    numQuestion: 7,
    question: 'What is the user experience?',
    solve1: 'The user experience is how the developer feels about a user.',
    solve2:
        'The user experience is how the user feels about interacting with or experiencing a product.',
    solve3:
        'The user experience is the attitude the UX designer has about a product.',
  ),
  QuestionModel(
    numQuestion: 8,
    question: 'What is the user experience?',
    solve1: 'The user experience is how the developer feels about a user.',
    solve2:
        'The user experience is how the user feels about interacting with or experiencing a product.',
    solve3:
        'The user experience is the attitude the UX designer has about a product.',
  ),
  QuestionModel(
    numQuestion: 9,
    question: 'What is the user experience?',
    solve1: 'The user experience is how the developer feels about a user.',
    solve2:
        'The user experience is how the user feels about interacting with or experiencing a product.',
    solve3:
        'The user experience is the attitude the UX designer has about a product.',
  ),
  QuestionModel(
    numQuestion: 10,
    question: 'What is the user experience?',
    solve1: 'The user experience is how the developer feels about a user.',
    solve2:
        'The user experience is how the user feels about interacting with or experiencing a product.',
    solve3:
        'The user experience is the attitude the UX designer has about a product.',
  ),
];

bool lastIndex = false;
int val=0;
List<int> isChecked =[1,2,3,4];

void Submit() {}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    var control = PageController();

    Func(int index) {
      if (index == Question.length - 1) {
        setState(() {
          lastIndex = true;
        });
        print(lastIndex);
      } else {
        setState(() {
          lastIndex = false;
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Course Exam',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: Func,
                itemBuilder: (context, index) =>
                    BordingItem(model: Question[index]),
                itemCount: Question.length,
                physics: const BouncingScrollPhysics(),
                controller: control,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        control.previousPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.easeInOutExpo,
                        );
                      },
                      color: mainColor,
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        if (lastIndex) {
                          Submit();
                        } else {
                          control.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.easeInOutExpo,
                          );
                        }
                      },
                      color: mainColor,
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BordingItem({required QuestionModel model}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Question',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              '${model.numQuestion} / 10',
              style: TextStyle(color: mainColor, fontSize: 17.0),
            ),
          ],
        ),
        const SizedBox(
          height: 25.0,
        ),
        Text(
          model.question,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: mainColor, width: 1.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  model.solve1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Radio(
                value: val,
                groupValue: val,
                onChanged: ( newValue) {
                  setState(() {
                    newValue = val  ;
                  });
                },
                activeColor: mainColor,
                focusColor: Colors.black,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: mainColor, width: 1.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  model.solve1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Radio(
                value: val,
                groupValue: val,
                onChanged: ( newValue) {
                  setState(() {
                    newValue = val  ;
                  });
                },
                activeColor: mainColor,
                focusColor: Colors.black,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: mainColor, width: 1.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  model.solve1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Radio(
                value: val,
                groupValue: val,
                onChanged: ( newValue) {
                  setState(() {
                    newValue = val  ;
                  });
                },
                activeColor: mainColor,
                focusColor: Colors.black,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
