import 'package:flutter/material.dart';
import 'package:o_learning/states/course_data_types.dart';

ICourseItem mockHtml = ICourseItem(title: 'HTML BASICS', chapters: [
  IChapterItem(
    title: 'Discovering HTML and Tags',
    icon: Icons.web,
    canLearn: true,
    isPassed: true,
    progress: 100,
  ),
  IChapterItem(
    title: 'Structuring Text with Tags',
    icon: Icons.web,
    canLearn: true,
    isPassed: false,
    progress: 20,
  ),
  IChapterItem(
    title: 'Building Buttons',
    icon: Icons.web,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
  IChapterItem(
    title: 'Creating Links',
    icon: Icons.web,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
]);

ICourseItem mockHtmlIntermediate =
    ICourseItem(title: 'HTML INTERMEDIATE', chapters: [
  IChapterItem(
    title: 'Adding Images',
    icon: Icons.web,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
  IChapterItem(
    title: 'Gathering Input',
    icon: Icons.web,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
  IChapterItem(
    title: 'Grouping Elements',
    icon: Icons.web,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
  IChapterItem(
    title: 'Building Lists',
    icon: Icons.web,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
  IChapterItem(
    title: 'Linking Webpages',
    icon: Icons.web,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
]);

ICourseItem mockCss = ICourseItem(title: 'CSS BASICS', chapters: [
  IChapterItem(
    title: 'Styling with CSS',
    icon: Icons.style,
    canLearn: true,
    isPassed: false,
    progress: 75,
  ),
  IChapterItem(
    title: 'Using Style Tags',
    icon: Icons.style,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
  IChapterItem(
    title: 'Including a Styling Sheet',
    icon: Icons.style,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
  IChapterItem(
    title: 'Setting Size and Borders',
    icon: Icons.style,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
  IChapterItem(
    title: 'Building with the Box Model',
    icon: Icons.style,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
  IChapterItem(
    title: 'Adding Padding with One Line',
    icon: Icons.style,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
  IChapterItem(
    title: 'Styling Corner with One Line',
    icon: Icons.style,
    canLearn: false,
    isPassed: false,
    progress: 0,
  ),
]);
