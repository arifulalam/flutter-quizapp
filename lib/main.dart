import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Quiz App',
    home: QuizApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class QuizApp extends StatefulWidget{
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizApp createState() => _QuizApp();
}

class _QuizApp extends State<QuizApp>{
  int currentQuestion = 0;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  bool showResult = false;
  List options = [];

  initState(){
    options = questions[currentQuestion]['O'].toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        centerTitle: true,
      ),
      body: (!showResult) ? Quiz() : Result(),
    );
  }

  Widget Quiz(){
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(questions[currentQuestion]['Q'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            SizedBox(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index){
                  return OutlinedButton(
                    onPressed: (){
                      if(currentQuestion < questions.length - 1){
                        setState((){
                          ((index+1) == questions[currentQuestion]['A']) ?
                          correctAnswer++ : wrongAnswer++;
                          currentQuestion++;
                          options = questions[currentQuestion]['O'].toList();
                        });
                      }else{
                        ((index+1) == questions[currentQuestion]['A']) ?
                        correctAnswer++ : wrongAnswer++;
                        setState(() => showResult = true);
                      }
                    },
                    child: Text(options[index]),
                  );
                },
              ),
              height: 300,
            )
          ],
        ),
      ),
    );
  }

  Widget Result(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Score: ${((100 * correctAnswer)/10)}%",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Correct Answer\n $correctAnswer",
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Wrong Answer\n $wrongAnswer",
                  textAlign: TextAlign.center,),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  setState((){
                    currentQuestion = correctAnswer = wrongAnswer = 0;
                    showResult = false;
                    options = questions[0]['O'].toList();
                  });
                },
                child: Text("Play Again"),
              )
            )
          ],
        ),
      ),
    );
  }
}

List questions = [
  {
    'Q' :'What is the name of Bangladesh?',
    'O' : [
      'The People\'s Republic of Bangladesh',
      'Republica of Bangladesh',
      'The People\'s Democrat of Bangladesh',
      'Democratic of Bangladesh',
    ],
    'A' : 1
  },
  {
    'Q' :'When Bangladesh got independence?',
    'O' : [
      '1971',
      '1982',
      '1952',
      '1969',
    ],
    'A' : 1
  },
  {
    'Q' :'Name of current president of Bangladesh',
    'O' : [
      'Sk Mujib Rahman',
      'Badruzdoja Ahmed',
      'Abdul Hamid',
      'Hossain Mohammad Arshad',
    ],
    'A' : 3
  },
  {
    'Q' :'What is the old name of BGB?',
    'O' : [
      'BGR',
      'BDR',
      'BR',
      'BDBG'
    ],
    'A' : 2
  },
  {
    'Q' :'What is the name of Bangladesh Central Bank?',
    'O' : [
      'Central Bank of Bangladesh',
      'Bangladesh Capital Bank',
      'Bangladesh Bank',
      'Bank of Bangladesh'
    ],
    'A' : 3
  },
  {
    'Q' :'National Flag of Bangladesh has how many colors?',
    'O' : [
      '3 Colors',
      '5 Colors',
      '4 Colors',
      '2 Colors'
  ],
    'A' : 4
  },
  {
    'Q' :'What is the other name of Corona Virus?',
    'O' : [
      'Covid 19',
      'Coved 19',
      'Covid 20',
      'Coved 20'
    ],
    'A' : 1
  },
  {
    'Q' :'Longest Sea Beach of the world is ___',
    'O' : [
      'Kuakata Sea Beach',
      'Maimi Sea Beach',
      'Patenga Sea Beach',
      'Cox\'s Bazaar Sea Beach'
    ],
    'A' : 4
  },
  {
    'Q' :'Largest animal on earth is ___',
    'O' : [
      'Shark',
      'Elephant',
      'Wheal',
      'Hippo'
    ],
    'A' : 3
  },
  {
    'Q' :'Himalaya is in ___',
    'O' : [
      'Tibbat',
      'Kustia',
      'London',
      'South Pole'
    ],
    'A' : 1
  }
];