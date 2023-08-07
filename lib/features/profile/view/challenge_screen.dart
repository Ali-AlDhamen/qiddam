import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/core/constants/app_sizes.dart';
import 'package:qiddam/theme/app_theme.dart';

class ChallengeScreen extends ConsumerWidget {
  final String challengeId;
  const ChallengeScreen({Key? key, required this.challengeId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(challengeId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Challenge'),
      ),
      body: Column(
        children: [
          // contrainer with white background, first row is challenge name and share icon space between them
          // second row is profile image and name space between them
          // third row is participants number with icon and challenge days with icon space between them
          // fourth row is complete challenge button
          // fifth row is description

          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Challenge Name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.share,
                      size: 25,
                      color: AppTheme.subtitleColor,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                      ),
                    ),
                    gapW12,
                    Text(
                      'Ali',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.subtitleColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: AppTheme.subtitleColor,
                        ),
                        gapW4,
                        Text(
                          '10 Participants',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.subtitleColor,
                          ),
                        ),
                      ],
                    ),
                    gapW12,
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: AppTheme.subtitleColor,
                        ),
                        gapW4,
                        Text(
                          '30 Days',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Complete Challenge'),
                  ),
                ),

                // challenge description
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Challenge Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.subtitleColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // contrainer rounded with white background, that have text field and send icon button
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: AppTheme.primaryColor,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      hintText: 'Write a comment',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppTheme.subtitleColor,
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.subtitleColor,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send, color: AppTheme.primaryColor),
                ),
              ],
            ),
          ),
          // list of comments
          Container(

              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                        ),
                      ),
                      gapW8,
                      Column(
                        children: [
                          Text(
                            'Ali',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.cardTitleColor,
                            ),
                          ),
                          gapH4,
                          Text(
                            '@alii',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.subtitleColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  gapH8,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Comment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  gapH8,
       
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.reply,
                            color: AppTheme.primaryColor,
                          ),
                 
                          Text(
                            'Reply',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.subtitleColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Since 1 day',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.subtitleColor,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
