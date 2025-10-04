// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "All cards: ${count}";

  static String m1(count) => "${count} cards";

  static String m2(error) => "Error: ${error}";

  static String m3(number) => "${number} cards";

  static String m4(number) => "Number of cards: ${number}";

  static String m5(date) => "Review date: ${date}";

  static String m6(nameOfDeck) => "Testing: ${nameOfDeck}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "accountDeletedMessage": MessageLookupByLibrary.simpleMessage(
      "Your account has been successfully deleted.",
    ),
    "accountDeletedTitle": MessageLookupByLibrary.simpleMessage(
      "Account Deleted",
    ),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addCard": MessageLookupByLibrary.simpleMessage("Add card"),
    "addNewDeck": MessageLookupByLibrary.simpleMessage("Add New Deck"),
    "add_editor": MessageLookupByLibrary.simpleMessage("Add editor"),
    "added": MessageLookupByLibrary.simpleMessage("Added"),
    "allCardsCount": m0,
    "already_have_account": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "answer": MessageLookupByLibrary.simpleMessage("Answer"),
    "areYouSureYouWantToDeleteAllDecksThis": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete all decks? This action cannot be undone.",
    ),
    "areYouSureYouWantToDeleteTheDeckLocally":
        MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to delete the deck locally",
        ),
    "assign_or_remove_editors": MessageLookupByLibrary.simpleMessage(
      "Assign or remove editors",
    ),
    "author": MessageLookupByLibrary.simpleMessage("Author"),
    "author_cant_delete_deck_locally": MessageLookupByLibrary.simpleMessage(
      "Authors cannot delete their decks locally.",
    ),
    "authorize": MessageLookupByLibrary.simpleMessage("Sign in"),
    "backToSettings": MessageLookupByLibrary.simpleMessage("Back to Settings"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "card": MessageLookupByLibrary.simpleMessage("Card"),
    "cards": MessageLookupByLibrary.simpleMessage("Cards"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change password"),
    "check_internet_connection": MessageLookupByLibrary.simpleMessage(
      "Check your internet connection",
    ),
    "chooseNumberOfCardsToLearn": MessageLookupByLibrary.simpleMessage(
      "Choose number of cards to learn:",
    ),
    "chooseTheTheme": MessageLookupByLibrary.simpleMessage("Choose the theme"),
    "clue": MessageLookupByLibrary.simpleMessage("Clue"),
    "complete": MessageLookupByLibrary.simpleMessage("Complete"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmDeletion": MessageLookupByLibrary.simpleMessage("Confirm Deletion"),
    "confirm_deck_delete": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete the deck?",
    ),
    "confirm_user_delete": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete your user account?",
    ),
    "continue_next": MessageLookupByLibrary.simpleMessage("Continue"),
    "correct": MessageLookupByLibrary.simpleMessage("Correct"),
    "correctAnswer": MessageLookupByLibrary.simpleMessage("Correct answer"),
    "countCards": m1,
    "createAccount": MessageLookupByLibrary.simpleMessage("Create account"),
    "createDeck": MessageLookupByLibrary.simpleMessage("Create deck"),
    "create_account": MessageLookupByLibrary.simpleMessage("Create an account"),
    "dailyTasks": MessageLookupByLibrary.simpleMessage("Daily tasks"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "deckSearch": MessageLookupByLibrary.simpleMessage("Deck search"),
    "decksAreLoading": MessageLookupByLibrary.simpleMessage(
      "Decks are loading...",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
    "deleteAll": MessageLookupByLibrary.simpleMessage("Delete all"),
    "deleteTheDeckLocally": MessageLookupByLibrary.simpleMessage(
      "Delete the deck locally",
    ),
    "delete_card_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this card?",
    ),
    "delete_card_question": MessageLookupByLibrary.simpleMessage(
      "Delete the card?",
    ),
    "delete_confirmation": MessageLookupByLibrary.simpleMessage(
      "Delete confirmation",
    ),
    "delete_deck": MessageLookupByLibrary.simpleMessage("Delete deck"),
    "deleted_but_failed_to_load_decks": MessageLookupByLibrary.simpleMessage(
      "Deck was deleted, but we couldn\'t refresh the deck list.",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "descriptionOptional": MessageLookupByLibrary.simpleMessage(
      "Description (optional)",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editPassword": MessageLookupByLibrary.simpleMessage("Edit password"),
    "editTheDeck": MessageLookupByLibrary.simpleMessage("Edit the Deck"),
    "editTheDecks": MessageLookupByLibrary.simpleMessage("Edit the Decks"),
    "editors": MessageLookupByLibrary.simpleMessage("Editors"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailIsTaken": MessageLookupByLibrary.simpleMessage(
      "This email is already used.",
    ),
    "emailOrUsername": MessageLookupByLibrary.simpleMessage(
      "Email or Username",
    ),
    "email_sent_description": MessageLookupByLibrary.simpleMessage(
      "We have sent a verification code to your email.",
    ),
    "email_verification": MessageLookupByLibrary.simpleMessage(
      "Email Verification",
    ),
    "enterAnswer": MessageLookupByLibrary.simpleMessage("Enter answer"),
    "enter_code_from_email": MessageLookupByLibrary.simpleMessage(
      "Please enter the code from the email",
    ),
    "enter_editor_name": MessageLookupByLibrary.simpleMessage(
      "Enter editor name",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "errorWhileLearningAll": MessageLookupByLibrary.simpleMessage(
      "Error while learning all",
    ),
    "errorWhileLearningFamiliar": MessageLookupByLibrary.simpleMessage(
      "Error while Learning familiar",
    ),
    "errorWhileLearningNew": MessageLookupByLibrary.simpleMessage(
      "Error while Learning new",
    ),
    "errorWhileLearningWeakest": MessageLookupByLibrary.simpleMessage(
      "Error while Learning Weakest",
    ),
    "errorWhileQuickRuning": MessageLookupByLibrary.simpleMessage(
      "Error while Quick Runing",
    ),
    "errorWhileRevisionscreenRunning": MessageLookupByLibrary.simpleMessage(
      "Error while RevisionScreen running",
    ),
    "errorX": m2,
    "failure_card_created_but_failed_to_load_cards":
        MessageLookupByLibrary.simpleMessage(
          "Card was created, but cards could not be loaded.",
        ),
    "failure_card_deleted_but_failed_to_load_cards":
        MessageLookupByLibrary.simpleMessage(
          "Card was deleted, but cards couldn\'t be refreshed.",
        ),
    "failure_card_was_deleted_refresh_data":
        MessageLookupByLibrary.simpleMessage(
          "Card was deleted. Please refresh the data.",
        ),
    "failure_cards_load_failed_due_to_network":
        MessageLookupByLibrary.simpleMessage(
          "Can\'t load cards. Check your connection.",
        ),
    "failure_cards_load_failed_due_to_unknown_failure":
        MessageLookupByLibrary.simpleMessage(
          "Can\'t load cards due to an unknown error.",
        ),
    "failure_conflict_card_error": MessageLookupByLibrary.simpleMessage(
      "Card was changed by another user. Press save again to apply your changes.",
    ),
    "failure_conflict_deck_error": MessageLookupByLibrary.simpleMessage(
      "Deck was changed by another user.",
    ),
    "failure_deck_created_but_failed_to_load":
        MessageLookupByLibrary.simpleMessage(
          "Deck was created, but failed to load.",
        ),
    "failure_deck_deleted_but_failed_to_load_decks":
        MessageLookupByLibrary.simpleMessage(
          "Deck was deleted, but deck list failed to refresh.",
        ),
    "failure_deck_permission_denied": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to do this.",
    ),
    "failure_deck_updated_but_failed_get_info":
        MessageLookupByLibrary.simpleMessage(
          "Deck was updated but failed to fetch updated data.",
        ),
    "failure_decks_load_failed_due_to_network":
        MessageLookupByLibrary.simpleMessage(
          "Can\'t load decks. Check your connection.",
        ),
    "failure_decks_load_failed_due_to_unknown_failure":
        MessageLookupByLibrary.simpleMessage(
          "Can\'t load decks due to an unknown error.",
        ),
    "failure_invalid_card_argument": MessageLookupByLibrary.simpleMessage(
      "Invalid card data.",
    ),
    "failure_network": MessageLookupByLibrary.simpleMessage(
      "Check your internet connection.",
    ),
    "failure_server": MessageLookupByLibrary.simpleMessage(
      "Server error. Please try again later.",
    ),
    "failure_such_permission_already_exists":
        MessageLookupByLibrary.simpleMessage("This permission already exists."),
    "failure_title_is_empty": MessageLookupByLibrary.simpleMessage(
      "Title can\'t be empty.",
    ),
    "failure_unauthorized": MessageLookupByLibrary.simpleMessage(
      "Unauthorized access. Please log in again.",
    ),
    "failure_unknown": MessageLookupByLibrary.simpleMessage(
      "An unknown error occurred.",
    ),
    "failure_user_not_found": MessageLookupByLibrary.simpleMessage(
      "User not found.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage("Fill al fields"),
    "focusOnWeakest": MessageLookupByLibrary.simpleMessage("Focus on weakest"),
    "fontSize": MessageLookupByLibrary.simpleMessage("Font size"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "hide": MessageLookupByLibrary.simpleMessage("Hide"),
    "incorrectOrExpiredCode": MessageLookupByLibrary.simpleMessage(
      "Incorrect or expired code",
    ),
    "incorrectPassword": MessageLookupByLibrary.simpleMessage(
      "Incorrect password",
    ),
    "initialization": MessageLookupByLibrary.simpleMessage("Initialization"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "lastReviewedAt": MessageLookupByLibrary.simpleMessage("Last reviewed at"),
    "learingNew": MessageLookupByLibrary.simpleMessage("Learing new"),
    "learingWeakest": MessageLookupByLibrary.simpleMessage("Learning Weakest"),
    "learnAllCards": MessageLookupByLibrary.simpleMessage("Learn all cards"),
    "learnFamiliarCards": MessageLookupByLibrary.simpleMessage(
      "Learn familiar cards",
    ),
    "learnNewCards": MessageLookupByLibrary.simpleMessage("Learn new cards"),
    "learningAll": MessageLookupByLibrary.simpleMessage("Learning all"),
    "learningAllCards": MessageLookupByLibrary.simpleMessage(
      "Learning all cards",
    ),
    "learningFamiliar": MessageLookupByLibrary.simpleMessage(
      "Learning familiar",
    ),
    "learningHelpText": MessageLookupByLibrary.simpleMessage(
      "Tap the card to reveal the answer. Tap again to hide it.\nSwipe left if you couldn\'t recall the answer.\nSwipe right if you remembered it perfectly.\nYou can also rate how well and quickly you recalled the answer — on a scale from 1 to 4.\nThese ratings help the system better shuffle the cards and improve your learning efficiency.",
    ),
    "lightMode": MessageLookupByLibrary.simpleMessage("Light mode"),
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "loadingData": MessageLookupByLibrary.simpleMessage("Loading data"),
    "logIn": MessageLookupByLibrary.simpleMessage("Log in"),
    "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
    "loginSuccessful": MessageLookupByLibrary.simpleMessage(
      "Login successful!",
    ),
    "makeDeckPublic": MessageLookupByLibrary.simpleMessage("Make deck public"),
    "mode": MessageLookupByLibrary.simpleMessage("mode"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "need_authorization": MessageLookupByLibrary.simpleMessage(
      "Authorization is required. Please log in again.",
    ),
    "need_authorization_to_continue": MessageLookupByLibrary.simpleMessage(
      "You need to sign in to continue.",
    ),
    "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
    "newPasswordSuccessfullySent": MessageLookupByLibrary.simpleMessage(
      "New password has been sent to your email. You will now be automatically redirected to the login screen.\n",
    ),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "nextStep": MessageLookupByLibrary.simpleMessage("Next step"),
    "noAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "noDate": MessageLookupByLibrary.simpleMessage("No date"),
    "noDecksForLearning": MessageLookupByLibrary.simpleMessage(
      "There are no decks for learning",
    ),
    "noDecksNGoToEditScreenToAddDeck": MessageLookupByLibrary.simpleMessage(
      "no decks \n go to edit screen to add deck",
    ),
    "noSpacedRepetitionCards": MessageLookupByLibrary.simpleMessage(
      "No spaced repetition cards",
    ),
    "no_cards": MessageLookupByLibrary.simpleMessage(
      "There are no cards to learn",
    ),
    "no_cards_for_review_today": MessageLookupByLibrary.simpleMessage(
      "You have no cards to review today.",
    ),
    "no_decks_for_daily_tasks": MessageLookupByLibrary.simpleMessage(
      "There are no decks for daily tasks.",
    ),
    "no_editors_yet": MessageLookupByLibrary.simpleMessage("No editors yet."),
    "no_familiar_cards": MessageLookupByLibrary.simpleMessage(
      "There are no familiar cards to learn in this deck.",
    ),
    "no_new_cards": MessageLookupByLibrary.simpleMessage(
      "You have no new cards in this deck.",
    ),
    "numberCards": m3,
    "numberOfCardsX": m4,
    "oldPassword": MessageLookupByLibrary.simpleMessage("Old password"),
    "originalQuestion": MessageLookupByLibrary.simpleMessage(
      "Orgiginal question",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "pleaseEnterTitle": MessageLookupByLibrary.simpleMessage("Enter title"),
    "pleaseFillInBothFields": MessageLookupByLibrary.simpleMessage(
      "Please fill in both fields",
    ),
    "prev": MessageLookupByLibrary.simpleMessage("Prev"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy policy"),
    "privateDeck": MessageLookupByLibrary.simpleMessage("Private deck"),
    "progress": MessageLookupByLibrary.simpleMessage("Progress"),
    "publicDeck": MessageLookupByLibrary.simpleMessage("Public deck"),
    "question": MessageLookupByLibrary.simpleMessage("Question:"),
    "quickRun": MessageLookupByLibrary.simpleMessage("Quick run"),
    "recover": MessageLookupByLibrary.simpleMessage("Recover"),
    "recoverPassword": MessageLookupByLibrary.simpleMessage("Recover Password"),
    "refresh": MessageLookupByLibrary.simpleMessage("refresh"),
    "registeredOn": MessageLookupByLibrary.simpleMessage("Registered On"),
    "registration": MessageLookupByLibrary.simpleMessage("Registration"),
    "registration_successful": MessageLookupByLibrary.simpleMessage(
      "Registration successful!",
    ),
    "resend_code": MessageLookupByLibrary.simpleMessage("Resend code"),
    "resend_in": MessageLookupByLibrary.simpleMessage("Resend in"),
    "reviewDatenX": m5,
    "revision": MessageLookupByLibrary.simpleMessage("Revision"),
    "revisionTasks": MessageLookupByLibrary.simpleMessage("Revision tasks"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "scheduledReviewDate": MessageLookupByLibrary.simpleMessage(
      "Scheduled review date",
    ),
    "score": MessageLookupByLibrary.simpleMessage("score"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchByAnswer": MessageLookupByLibrary.simpleMessage("Search by answer"),
    "searchDecks": MessageLookupByLibrary.simpleMessage("Search decks..."),
    "selectStudyMode": MessageLookupByLibrary.simpleMessage(
      "Select study mode",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "showAnswerFirst": MessageLookupByLibrary.simpleMessage(
      "Show answer first",
    ),
    "showMore": MessageLookupByLibrary.simpleMessage("Show more"),
    "showQuestionFirst": MessageLookupByLibrary.simpleMessage(
      "Show question first",
    ),
    "sign_up": MessageLookupByLibrary.simpleMessage("Sign up"),
    "skip": MessageLookupByLibrary.simpleMessage("skip"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "spacedRevision": MessageLookupByLibrary.simpleMessage("Spaced Revision"),
    "study": MessageLookupByLibrary.simpleMessage("Study"),
    "takeATest": MessageLookupByLibrary.simpleMessage("Take a test"),
    "testCompleted": MessageLookupByLibrary.simpleMessage("Test completed!"),
    "testingNameofdeck": m6,
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "thisDeckIsEmptyngoToEditingScreenToAddFlashcards":
        MessageLookupByLibrary.simpleMessage(
          "This deck is empty,\ngo to editing screen to add flashcards.",
        ),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "try_again": MessageLookupByLibrary.simpleMessage("Try again"),
    "unnamed": MessageLookupByLibrary.simpleMessage("Unnamed"),
    "updatePassword": MessageLookupByLibrary.simpleMessage("Update password"),
    "userName": MessageLookupByLibrary.simpleMessage("UserName"),
    "userNameIsTaken": MessageLookupByLibrary.simpleMessage(
      "UserName is taken",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "verification_code": MessageLookupByLibrary.simpleMessage(
      "Verification code",
    ),
    "view": MessageLookupByLibrary.simpleMessage("View"),
    "viewingCard": MessageLookupByLibrary.simpleMessage("Viewing Card"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
    "welcome_back": MessageLookupByLibrary.simpleMessage("Welcome back"),
    "wrong": MessageLookupByLibrary.simpleMessage("Wrong"),
    "yourAnswer": MessageLookupByLibrary.simpleMessage("Your answer"),
  };
}
