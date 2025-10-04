// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Loading data`
  String get loadingData {
    return Intl.message(
      'Loading data',
      name: 'loadingData',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Test completed!`
  String get testCompleted {
    return Intl.message(
      'Test completed!',
      name: 'testCompleted',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message('skip', name: 'skip', desc: '', args: []);
  }

  /// `Answer`
  String get answer {
    return Intl.message('Answer', name: 'answer', desc: '', args: []);
  }

  /// `Complete`
  String get complete {
    return Intl.message('Complete', name: 'complete', desc: '', args: []);
  }

  /// `Enter answer`
  String get enterAnswer {
    return Intl.message(
      'Enter answer',
      name: 'enterAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Card`
  String get card {
    return Intl.message('Card', name: 'card', desc: '', args: []);
  }

  /// `Your answer`
  String get yourAnswer {
    return Intl.message('Your answer', name: 'yourAnswer', desc: '', args: []);
  }

  /// `Correct answer`
  String get correctAnswer {
    return Intl.message(
      'Correct answer',
      name: 'correctAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Wrong`
  String get wrong {
    return Intl.message('Wrong', name: 'wrong', desc: '', args: []);
  }

  /// `Correct`
  String get correct {
    return Intl.message('Correct', name: 'correct', desc: '', args: []);
  }

  /// `Orgiginal question`
  String get originalQuestion {
    return Intl.message(
      'Orgiginal question',
      name: 'originalQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Revision`
  String get revision {
    return Intl.message('Revision', name: 'revision', desc: '', args: []);
  }

  /// `{number} cards`
  String numberCards(Object number) {
    return Intl.message(
      '$number cards',
      name: 'numberCards',
      desc: '',
      args: [number],
    );
  }

  /// `Quick run`
  String get quickRun {
    return Intl.message('Quick run', name: 'quickRun', desc: '', args: []);
  }

  /// `Prev`
  String get prev {
    return Intl.message('Prev', name: 'prev', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Study`
  String get study {
    return Intl.message('Study', name: 'study', desc: '', args: []);
  }

  /// `Decks are loading...`
  String get decksAreLoading {
    return Intl.message(
      'Decks are loading...',
      name: 'decksAreLoading',
      desc: '',
      args: [],
    );
  }

  /// `Revision tasks`
  String get revisionTasks {
    return Intl.message(
      'Revision tasks',
      name: 'revisionTasks',
      desc: '',
      args: [],
    );
  }

  /// `Choose number of cards to learn:`
  String get chooseNumberOfCardsToLearn {
    return Intl.message(
      'Choose number of cards to learn:',
      name: 'chooseNumberOfCardsToLearn',
      desc: '',
      args: [],
    );
  }

  /// `All cards: {count}`
  String allCardsCount(Object count) {
    return Intl.message(
      'All cards: $count',
      name: 'allCardsCount',
      desc: '',
      args: [count],
    );
  }

  /// `{count} cards`
  String countCards(Object count) {
    return Intl.message(
      '$count cards',
      name: 'countCards',
      desc: '',
      args: [count],
    );
  }

  /// `Learn new cards`
  String get learnNewCards {
    return Intl.message(
      'Learn new cards',
      name: 'learnNewCards',
      desc: '',
      args: [],
    );
  }

  /// `Focus on weakest`
  String get focusOnWeakest {
    return Intl.message(
      'Focus on weakest',
      name: 'focusOnWeakest',
      desc: '',
      args: [],
    );
  }

  /// `Learning all cards`
  String get learningAllCards {
    return Intl.message(
      'Learning all cards',
      name: 'learningAllCards',
      desc: '',
      args: [],
    );
  }

  /// `Learning familiar`
  String get learningFamiliar {
    return Intl.message(
      'Learning familiar',
      name: 'learningFamiliar',
      desc: '',
      args: [],
    );
  }

  /// `Take a test`
  String get takeATest {
    return Intl.message('Take a test', name: 'takeATest', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `This deck is empty,\ngo to editing screen to add flashcards.`
  String get thisDeckIsEmptyngoToEditingScreenToAddFlashcards {
    return Intl.message(
      'This deck is empty,\ngo to editing screen to add flashcards.',
      name: 'thisDeckIsEmptyngoToEditingScreenToAddFlashcards',
      desc: '',
      args: [],
    );
  }

  /// `No date`
  String get noDate {
    return Intl.message('No date', name: 'noDate', desc: '', args: []);
  }

  /// `Review date: {date}`
  String reviewDatenX(Object date) {
    return Intl.message(
      'Review date: $date',
      name: 'reviewDatenX',
      desc: '',
      args: [date],
    );
  }

  /// `Progress`
  String get progress {
    return Intl.message('Progress', name: 'progress', desc: '', args: []);
  }

  /// `Add card`
  String get addCard {
    return Intl.message('Add card', name: 'addCard', desc: '', args: []);
  }

  /// `Question:`
  String get question {
    return Intl.message('Question:', name: 'question', desc: '', args: []);
  }

  /// `View`
  String get view {
    return Intl.message('View', name: 'view', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Add New Deck`
  String get addNewDeck {
    return Intl.message('Add New Deck', name: 'addNewDeck', desc: '', args: []);
  }

  /// `Unnamed`
  String get unnamed {
    return Intl.message('Unnamed', name: 'unnamed', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Description (optional)`
  String get descriptionOptional {
    return Intl.message(
      'Description (optional)',
      name: 'descriptionOptional',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Confirm Deletion`
  String get confirmDeletion {
    return Intl.message(
      'Confirm Deletion',
      name: 'confirmDeletion',
      desc: '',
      args: [],
    );
  }

  /// `Delete all`
  String get deleteAll {
    return Intl.message('Delete all', name: 'deleteAll', desc: '', args: []);
  }

  /// `Are you sure you want to delete all decks? This action cannot be undone.`
  String get areYouSureYouWantToDeleteAllDecksThis {
    return Intl.message(
      'Are you sure you want to delete all decks? This action cannot be undone.',
      name: 'areYouSureYouWantToDeleteAllDecksThis',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String errorX(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'errorX',
      desc: '',
      args: [error],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Learning all`
  String get learningAll {
    return Intl.message(
      'Learning all',
      name: 'learningAll',
      desc: '',
      args: [],
    );
  }

  /// `Error while learning all`
  String get errorWhileLearningAll {
    return Intl.message(
      'Error while learning all',
      name: 'errorWhileLearningAll',
      desc: '',
      args: [],
    );
  }

  /// `Error while Learning familiar`
  String get errorWhileLearningFamiliar {
    return Intl.message(
      'Error while Learning familiar',
      name: 'errorWhileLearningFamiliar',
      desc: '',
      args: [],
    );
  }

  /// `Learing new`
  String get learingNew {
    return Intl.message('Learing new', name: 'learingNew', desc: '', args: []);
  }

  /// `Error while Learning new`
  String get errorWhileLearningNew {
    return Intl.message(
      'Error while Learning new',
      name: 'errorWhileLearningNew',
      desc: '',
      args: [],
    );
  }

  /// `Learning Weakest`
  String get learingWeakest {
    return Intl.message(
      'Learning Weakest',
      name: 'learingWeakest',
      desc: '',
      args: [],
    );
  }

  /// `Error while Learning Weakest`
  String get errorWhileLearningWeakest {
    return Intl.message(
      'Error while Learning Weakest',
      name: 'errorWhileLearningWeakest',
      desc: '',
      args: [],
    );
  }

  /// `no decks \n go to edit screen to add deck`
  String get noDecksNGoToEditScreenToAddDeck {
    return Intl.message(
      'no decks \n go to edit screen to add deck',
      name: 'noDecksNGoToEditScreenToAddDeck',
      desc: '',
      args: [],
    );
  }

  /// `Error while Quick Runing`
  String get errorWhileQuickRuning {
    return Intl.message(
      'Error while Quick Runing',
      name: 'errorWhileQuickRuning',
      desc: '',
      args: [],
    );
  }

  /// `Spaced Revision`
  String get spacedRevision {
    return Intl.message(
      'Spaced Revision',
      name: 'spacedRevision',
      desc: '',
      args: [],
    );
  }

  /// `Error while RevisionScreen running`
  String get errorWhileRevisionscreenRunning {
    return Intl.message(
      'Error while RevisionScreen running',
      name: 'errorWhileRevisionscreenRunning',
      desc: '',
      args: [],
    );
  }

  /// `No spaced repetition cards`
  String get noSpacedRepetitionCards {
    return Intl.message(
      'No spaced repetition cards',
      name: 'noSpacedRepetitionCards',
      desc: '',
      args: [],
    );
  }

  /// `Testing: {nameOfDeck}`
  String testingNameofdeck(Object nameOfDeck) {
    return Intl.message(
      'Testing: $nameOfDeck',
      name: 'testingNameofdeck',
      desc: '',
      args: [nameOfDeck],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Edit the Decks`
  String get editTheDecks {
    return Intl.message(
      'Edit the Decks',
      name: 'editTheDecks',
      desc: '',
      args: [],
    );
  }

  /// `Viewing Card`
  String get viewingCard {
    return Intl.message(
      'Viewing Card',
      name: 'viewingCard',
      desc: '',
      args: [],
    );
  }

  /// `Edit the Deck`
  String get editTheDeck {
    return Intl.message(
      'Edit the Deck',
      name: 'editTheDeck',
      desc: '',
      args: [],
    );
  }

  /// `Font size`
  String get fontSize {
    return Intl.message('Font size', name: 'fontSize', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Search by answer`
  String get searchByAnswer {
    return Intl.message(
      'Search by answer',
      name: 'searchByAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Fill al fields`
  String get fillAllFields {
    return Intl.message(
      'Fill al fields',
      name: 'fillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Hide`
  String get hide {
    return Intl.message('Hide', name: 'hide', desc: '', args: []);
  }

  /// `Show more`
  String get showMore {
    return Intl.message('Show more', name: 'showMore', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Number of cards: {number}`
  String numberOfCardsX(Object number) {
    return Intl.message(
      'Number of cards: $number',
      name: 'numberOfCardsX',
      desc: '',
      args: [number],
    );
  }

  /// `Initialization`
  String get initialization {
    return Intl.message(
      'Initialization',
      name: 'initialization',
      desc: '',
      args: [],
    );
  }

  /// `Light mode`
  String get lightMode {
    return Intl.message('Light mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Choose the theme`
  String get chooseTheTheme {
    return Intl.message(
      'Choose the theme',
      name: 'chooseTheTheme',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `UserName`
  String get userName {
    return Intl.message('UserName', name: 'userName', desc: '', args: []);
  }

  /// `UserName is taken`
  String get userNameIsTaken {
    return Intl.message(
      'UserName is taken',
      name: 'userNameIsTaken',
      desc: '',
      args: [],
    );
  }

  /// `This email is already used.`
  String get emailIsTaken {
    return Intl.message(
      'This email is already used.',
      name: 'emailIsTaken',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Next step`
  String get nextStep {
    return Intl.message('Next step', name: 'nextStep', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Log in`
  String get logIn {
    return Intl.message('Log in', name: 'logIn', desc: '', args: []);
  }

  /// `Registered On`
  String get registeredOn {
    return Intl.message(
      'Registered On',
      name: 'registeredOn',
      desc: '',
      args: [],
    );
  }

  /// `Back to Settings`
  String get backToSettings {
    return Intl.message(
      'Back to Settings',
      name: 'backToSettings',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message('Log out', name: 'logOut', desc: '', args: []);
  }

  /// `Create deck`
  String get createDeck {
    return Intl.message('Create deck', name: 'createDeck', desc: '', args: []);
  }

  /// `Enter title`
  String get pleaseEnterTitle {
    return Intl.message(
      'Enter title',
      name: 'pleaseEnterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Make deck public`
  String get makeDeckPublic {
    return Intl.message(
      'Make deck public',
      name: 'makeDeckPublic',
      desc: '',
      args: [],
    );
  }

  /// `score`
  String get score {
    return Intl.message('score', name: 'score', desc: '', args: []);
  }

  /// `Last reviewed at`
  String get lastReviewedAt {
    return Intl.message(
      'Last reviewed at',
      name: 'lastReviewedAt',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection.`
  String get failure_network {
    return Intl.message(
      'Check your internet connection.',
      name: 'failure_network',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized access. Please log in again.`
  String get failure_unauthorized {
    return Intl.message(
      'Unauthorized access. Please log in again.',
      name: 'failure_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `User not found.`
  String get failure_user_not_found {
    return Intl.message(
      'User not found.',
      name: 'failure_user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Server error. Please try again later.`
  String get failure_server {
    return Intl.message(
      'Server error. Please try again later.',
      name: 'failure_server',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred.`
  String get failure_unknown {
    return Intl.message(
      'An unknown error occurred.',
      name: 'failure_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Deck was created, but failed to load.`
  String get failure_deck_created_but_failed_to_load {
    return Intl.message(
      'Deck was created, but failed to load.',
      name: 'failure_deck_created_but_failed_to_load',
      desc: '',
      args: [],
    );
  }

  /// `Title can't be empty.`
  String get failure_title_is_empty {
    return Intl.message(
      'Title can\'t be empty.',
      name: 'failure_title_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Can't load cards. Check your connection.`
  String get failure_cards_load_failed_due_to_network {
    return Intl.message(
      'Can\'t load cards. Check your connection.',
      name: 'failure_cards_load_failed_due_to_network',
      desc: '',
      args: [],
    );
  }

  /// `Can't load cards due to an unknown error.`
  String get failure_cards_load_failed_due_to_unknown_failure {
    return Intl.message(
      'Can\'t load cards due to an unknown error.',
      name: 'failure_cards_load_failed_due_to_unknown_failure',
      desc: '',
      args: [],
    );
  }

  /// `Can't load decks. Check your connection.`
  String get failure_decks_load_failed_due_to_network {
    return Intl.message(
      'Can\'t load decks. Check your connection.',
      name: 'failure_decks_load_failed_due_to_network',
      desc: '',
      args: [],
    );
  }

  /// `Can't load decks due to an unknown error.`
  String get failure_decks_load_failed_due_to_unknown_failure {
    return Intl.message(
      'Can\'t load decks due to an unknown error.',
      name: 'failure_decks_load_failed_due_to_unknown_failure',
      desc: '',
      args: [],
    );
  }

  /// `Card was created, but cards could not be loaded.`
  String get failure_card_created_but_failed_to_load_cards {
    return Intl.message(
      'Card was created, but cards could not be loaded.',
      name: 'failure_card_created_but_failed_to_load_cards',
      desc: '',
      args: [],
    );
  }

  /// `Invalid card data.`
  String get failure_invalid_card_argument {
    return Intl.message(
      'Invalid card data.',
      name: 'failure_invalid_card_argument',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to do this.`
  String get failure_deck_permission_denied {
    return Intl.message(
      'You don\'t have permission to do this.',
      name: 'failure_deck_permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `Card was deleted, but cards couldn't be refreshed.`
  String get failure_card_deleted_but_failed_to_load_cards {
    return Intl.message(
      'Card was deleted, but cards couldn\'t be refreshed.',
      name: 'failure_card_deleted_but_failed_to_load_cards',
      desc: '',
      args: [],
    );
  }

  /// `Deck was deleted, but deck list failed to refresh.`
  String get failure_deck_deleted_but_failed_to_load_decks {
    return Intl.message(
      'Deck was deleted, but deck list failed to refresh.',
      name: 'failure_deck_deleted_but_failed_to_load_decks',
      desc: '',
      args: [],
    );
  }

  /// `This permission already exists.`
  String get failure_such_permission_already_exists {
    return Intl.message(
      'This permission already exists.',
      name: 'failure_such_permission_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Card was changed by another user. Press save again to apply your changes.`
  String get failure_conflict_card_error {
    return Intl.message(
      'Card was changed by another user. Press save again to apply your changes.',
      name: 'failure_conflict_card_error',
      desc: '',
      args: [],
    );
  }

  /// `Deck was updated but failed to fetch updated data.`
  String get failure_deck_updated_but_failed_get_info {
    return Intl.message(
      'Deck was updated but failed to fetch updated data.',
      name: 'failure_deck_updated_but_failed_get_info',
      desc: '',
      args: [],
    );
  }

  /// `Deck was changed by another user.`
  String get failure_conflict_deck_error {
    return Intl.message(
      'Deck was changed by another user.',
      name: 'failure_conflict_deck_error',
      desc: '',
      args: [],
    );
  }

  /// `Card was deleted. Please refresh the data.`
  String get failure_card_was_deleted_refresh_data {
    return Intl.message(
      'Card was deleted. Please refresh the data.',
      name: 'failure_card_was_deleted_refresh_data',
      desc: '',
      args: [],
    );
  }

  /// `You have no new cards in this deck.`
  String get no_new_cards {
    return Intl.message(
      'You have no new cards in this deck.',
      name: 'no_new_cards',
      desc: '',
      args: [],
    );
  }

  /// `There are no familiar cards to learn in this deck.`
  String get no_familiar_cards {
    return Intl.message(
      'There are no familiar cards to learn in this deck.',
      name: 'no_familiar_cards',
      desc: '',
      args: [],
    );
  }

  /// `There are no decks for daily tasks.`
  String get no_decks_for_daily_tasks {
    return Intl.message(
      'There are no decks for daily tasks.',
      name: 'no_decks_for_daily_tasks',
      desc: '',
      args: [],
    );
  }

  /// `You have no cards to review today.`
  String get no_cards_for_review_today {
    return Intl.message(
      'You have no cards to review today.',
      name: 'no_cards_for_review_today',
      desc: '',
      args: [],
    );
  }

  /// `Deck was deleted, but we couldn't refresh the deck list.`
  String get deleted_but_failed_to_load_decks {
    return Intl.message(
      'Deck was deleted, but we couldn\'t refresh the deck list.',
      name: 'deleted_but_failed_to_load_decks',
      desc: '',
      args: [],
    );
  }

  /// `Authors cannot delete their decks locally.`
  String get author_cant_delete_deck_locally {
    return Intl.message(
      'Authors cannot delete their decks locally.',
      name: 'author_cant_delete_deck_locally',
      desc: '',
      args: [],
    );
  }

  /// `There are no cards to learn`
  String get no_cards {
    return Intl.message(
      'There are no cards to learn',
      name: 'no_cards',
      desc: '',
      args: [],
    );
  }

  /// `Authorization is required. Please log in again.`
  String get need_authorization {
    return Intl.message(
      'Authorization is required. Please log in again.',
      name: 'need_authorization',
      desc: '',
      args: [],
    );
  }

  /// `You need to sign in to continue.`
  String get need_authorization_to_continue {
    return Intl.message(
      'You need to sign in to continue.',
      name: 'need_authorization_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get authorize {
    return Intl.message('Sign in', name: 'authorize', desc: '', args: []);
  }

  /// `Check your internet connection`
  String get check_internet_connection {
    return Intl.message(
      'Check your internet connection',
      name: 'check_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get try_again {
    return Intl.message('Try again', name: 'try_again', desc: '', args: []);
  }

  /// `refresh`
  String get refresh {
    return Intl.message('refresh', name: 'refresh', desc: '', args: []);
  }

  /// `Registration successful!`
  String get registration_successful {
    return Intl.message(
      'Registration successful!',
      name: 'registration_successful',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get create_account {
    return Intl.message(
      'Create an account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message('Sign up', name: 'sign_up', desc: '', args: []);
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcome_back {
    return Intl.message(
      'Welcome back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Email or Username`
  String get emailOrUsername {
    return Intl.message(
      'Email or Username',
      name: 'emailOrUsername',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_next {
    return Intl.message('Continue', name: 'continue_next', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login successful!`
  String get loginSuccessful {
    return Intl.message(
      'Login successful!',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Public deck`
  String get publicDeck {
    return Intl.message('Public deck', name: 'publicDeck', desc: '', args: []);
  }

  /// `Private deck`
  String get privateDeck {
    return Intl.message(
      'Private deck',
      name: 'privateDeck',
      desc: '',
      args: [],
    );
  }

  /// `Editors`
  String get editors {
    return Intl.message('Editors', name: 'editors', desc: '', args: []);
  }

  /// `Added`
  String get added {
    return Intl.message('Added', name: 'added', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Search decks...`
  String get searchDecks {
    return Intl.message(
      'Search decks...',
      name: 'searchDecks',
      desc: '',
      args: [],
    );
  }

  /// `There are no decks for learning`
  String get noDecksForLearning {
    return Intl.message(
      'There are no decks for learning',
      name: 'noDecksForLearning',
      desc: '',
      args: [],
    );
  }

  /// `Select study mode`
  String get selectStudyMode {
    return Intl.message(
      'Select study mode',
      name: 'selectStudyMode',
      desc: '',
      args: [],
    );
  }

  /// `Learn all cards`
  String get learnAllCards {
    return Intl.message(
      'Learn all cards',
      name: 'learnAllCards',
      desc: '',
      args: [],
    );
  }

  /// `Learn familiar cards`
  String get learnFamiliarCards {
    return Intl.message(
      'Learn familiar cards',
      name: 'learnFamiliarCards',
      desc: '',
      args: [],
    );
  }

  /// `mode`
  String get mode {
    return Intl.message('mode', name: 'mode', desc: '', args: []);
  }

  /// `Author`
  String get author {
    return Intl.message('Author', name: 'author', desc: '', args: []);
  }

  /// `No editors yet.`
  String get no_editors_yet {
    return Intl.message(
      'No editors yet.',
      name: 'no_editors_yet',
      desc: '',
      args: [],
    );
  }

  /// `Enter editor name`
  String get enter_editor_name {
    return Intl.message(
      'Enter editor name',
      name: 'enter_editor_name',
      desc: '',
      args: [],
    );
  }

  /// `Add editor`
  String get add_editor {
    return Intl.message('Add editor', name: 'add_editor', desc: '', args: []);
  }

  /// `Delete confirmation`
  String get delete_confirmation {
    return Intl.message(
      'Delete confirmation',
      name: 'delete_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the deck?`
  String get confirm_deck_delete {
    return Intl.message(
      'Are you sure you want to delete the deck?',
      name: 'confirm_deck_delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete deck`
  String get delete_deck {
    return Intl.message('Delete deck', name: 'delete_deck', desc: '', args: []);
  }

  /// `Assign or remove editors`
  String get assign_or_remove_editors {
    return Intl.message(
      'Assign or remove editors',
      name: 'assign_or_remove_editors',
      desc: '',
      args: [],
    );
  }

  /// `Delete the card?`
  String get delete_card_question {
    return Intl.message(
      'Delete the card?',
      name: 'delete_card_question',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this card?`
  String get delete_card_confirmation {
    return Intl.message(
      'Are you sure you want to delete this card?',
      name: 'delete_card_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Deck search`
  String get deckSearch {
    return Intl.message('Deck search', name: 'deckSearch', desc: '', args: []);
  }

  /// `Daily tasks`
  String get dailyTasks {
    return Intl.message('Daily tasks', name: 'dailyTasks', desc: '', args: []);
  }

  /// `Cards`
  String get cards {
    return Intl.message('Cards', name: 'cards', desc: '', args: []);
  }

  /// `Show answer first`
  String get showAnswerFirst {
    return Intl.message(
      'Show answer first',
      name: 'showAnswerFirst',
      desc: '',
      args: [],
    );
  }

  /// `Show question first`
  String get showQuestionFirst {
    return Intl.message(
      'Show question first',
      name: 'showQuestionFirst',
      desc: '',
      args: [],
    );
  }

  /// `Delete the deck locally`
  String get deleteTheDeckLocally {
    return Intl.message(
      'Delete the deck locally',
      name: 'deleteTheDeckLocally',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the deck locally`
  String get areYouSureYouWantToDeleteTheDeckLocally {
    return Intl.message(
      'Are you sure you want to delete the deck locally',
      name: 'areYouSureYouWantToDeleteTheDeckLocally',
      desc: '',
      args: [],
    );
  }

  /// `Scheduled review date`
  String get scheduledReviewDate {
    return Intl.message(
      'Scheduled review date',
      name: 'scheduledReviewDate',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Tap the card to reveal the answer. Tap again to hide it.\nSwipe left if you couldn't recall the answer.\nSwipe right if you remembered it perfectly.\nYou can also rate how well and quickly you recalled the answer — on a scale from 1 to 4.\nThese ratings help the system better shuffle the cards and improve your learning efficiency.`
  String get learningHelpText {
    return Intl.message(
      'Tap the card to reveal the answer. Tap again to hide it.\nSwipe left if you couldn\'t recall the answer.\nSwipe right if you remembered it perfectly.\nYou can also rate how well and quickly you recalled the answer — on a scale from 1 to 4.\nThese ratings help the system better shuffle the cards and improve your learning efficiency.',
      name: 'learningHelpText',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect or expired code`
  String get incorrectOrExpiredCode {
    return Intl.message(
      'Incorrect or expired code',
      name: 'incorrectOrExpiredCode',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification`
  String get email_verification {
    return Intl.message(
      'Email Verification',
      name: 'email_verification',
      desc: '',
      args: [],
    );
  }

  /// `We have sent a verification code to your email.`
  String get email_sent_description {
    return Intl.message(
      'We have sent a verification code to your email.',
      name: 'email_sent_description',
      desc: '',
      args: [],
    );
  }

  /// `Verification code`
  String get verification_code {
    return Intl.message(
      'Verification code',
      name: 'verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code from the email`
  String get enter_code_from_email {
    return Intl.message(
      'Please enter the code from the email',
      name: 'enter_code_from_email',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Resend code`
  String get resend_code {
    return Intl.message('Resend code', name: 'resend_code', desc: '', args: []);
  }

  /// `Resend in`
  String get resend_in {
    return Intl.message('Resend in', name: 'resend_in', desc: '', args: []);
  }

  /// `Clue`
  String get clue {
    return Intl.message('Clue', name: 'clue', desc: '', args: []);
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get incorrectPassword {
    return Intl.message(
      'Incorrect password',
      name: 'incorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Update password`
  String get updatePassword {
    return Intl.message(
      'Update password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get oldPassword {
    return Intl.message(
      'Old password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Edit password`
  String get editPassword {
    return Intl.message(
      'Edit password',
      name: 'editPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in both fields`
  String get pleaseFillInBothFields {
    return Intl.message(
      'Please fill in both fields',
      name: 'pleaseFillInBothFields',
      desc: '',
      args: [],
    );
  }

  /// `New password has been sent to your email. You will now be automatically redirected to the login screen.\n`
  String get newPasswordSuccessfullySent {
    return Intl.message(
      'New password has been sent to your email. You will now be automatically redirected to the login screen.\n',
      name: 'newPasswordSuccessfullySent',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Recover Password`
  String get recoverPassword {
    return Intl.message(
      'Recover Password',
      name: 'recoverPassword',
      desc: '',
      args: [],
    );
  }

  /// `Recover`
  String get recover {
    return Intl.message('Recover', name: 'recover', desc: '', args: []);
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Account Deleted`
  String get accountDeletedTitle {
    return Intl.message(
      'Account Deleted',
      name: 'accountDeletedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been successfully deleted.`
  String get accountDeletedMessage {
    return Intl.message(
      'Your account has been successfully deleted.',
      name: 'accountDeletedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your user account?`
  String get confirm_user_delete {
    return Intl.message(
      'Are you sure you want to delete your user account?',
      name: 'confirm_user_delete',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
