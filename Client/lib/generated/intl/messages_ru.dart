// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(count) => "Всего карточек: ${count}";

  static String m1(count) => "${count} карточек";

  static String m2(error) => "Ошибка: ${error}";

  static String m3(number) => "${number} карточек";

  static String m4(number) => "Количество карточек: ${number}";

  static String m5(date) => "Дата повторения: ${date}";

  static String m6(nameOfDeck) => "Тестирование: ${nameOfDeck}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "account": MessageLookupByLibrary.simpleMessage("Аккаунт"),
    "accountDeletedMessage": MessageLookupByLibrary.simpleMessage(
      "Ваш аккаунт был успешно удален.",
    ),
    "accountDeletedTitle": MessageLookupByLibrary.simpleMessage(
      "Аккаунт удален",
    ),
    "add": MessageLookupByLibrary.simpleMessage("Добавить"),
    "addCard": MessageLookupByLibrary.simpleMessage("Добавить карточку"),
    "addNewDeck": MessageLookupByLibrary.simpleMessage("Добавить новую колоду"),
    "add_editor": MessageLookupByLibrary.simpleMessage("Добавить редактора"),
    "added": MessageLookupByLibrary.simpleMessage("Добавлено"),
    "allCardsCount": m0,
    "already_have_account": MessageLookupByLibrary.simpleMessage(
      "Уже есть аккаунт?",
    ),
    "answer": MessageLookupByLibrary.simpleMessage("Ответ"),
    "areYouSureYouWantToDeleteAllDecksThis": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите удалить все колоды? Это действие нельзя отменить.",
    ),
    "areYouSureYouWantToDeleteTheDeckLocally":
        MessageLookupByLibrary.simpleMessage(
          "Вы уверены что хотите удалить колоду локально?",
        ),
    "assign_or_remove_editors": MessageLookupByLibrary.simpleMessage(
      "Назначить или удалить редакторов",
    ),
    "author": MessageLookupByLibrary.simpleMessage("Автор"),
    "author_cant_delete_deck_locally": MessageLookupByLibrary.simpleMessage(
      "Автор не может удалить свою колоду локально.",
    ),
    "authorize": MessageLookupByLibrary.simpleMessage("Войти"),
    "backToSettings": MessageLookupByLibrary.simpleMessage(
      "Назад к настройкам",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "card": MessageLookupByLibrary.simpleMessage("Карточка"),
    "cards": MessageLookupByLibrary.simpleMessage("Карточки"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Изменение пароля"),
    "check_internet_connection": MessageLookupByLibrary.simpleMessage(
      "Проверьте подключение к интернету",
    ),
    "chooseNumberOfCardsToLearn": MessageLookupByLibrary.simpleMessage(
      "Выберите количество карточек для изучения:",
    ),
    "chooseTheTheme": MessageLookupByLibrary.simpleMessage("Выберите тему"),
    "clue": MessageLookupByLibrary.simpleMessage("Подсказка"),
    "complete": MessageLookupByLibrary.simpleMessage("Завершить"),
    "confirm": MessageLookupByLibrary.simpleMessage("Подтвердить"),
    "confirmDeletion": MessageLookupByLibrary.simpleMessage(
      "Подтверждение удаления",
    ),
    "confirm_deck_delete": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите удалить колоду?",
    ),
    "confirm_user_delete": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите удалить ваш аккаунт?",
    ),
    "continue_next": MessageLookupByLibrary.simpleMessage("Продолжить"),
    "correct": MessageLookupByLibrary.simpleMessage("Верно"),
    "correctAnswer": MessageLookupByLibrary.simpleMessage("Правильный ответ"),
    "countCards": m1,
    "createAccount": MessageLookupByLibrary.simpleMessage("Создать аккаунт"),
    "createDeck": MessageLookupByLibrary.simpleMessage("Создать колоду"),
    "create_account": MessageLookupByLibrary.simpleMessage("Создать аккаунт"),
    "dailyTasks": MessageLookupByLibrary.simpleMessage("Ежедневные задания"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Темный режим"),
    "deckSearch": MessageLookupByLibrary.simpleMessage("Поиск колод"),
    "decksAreLoading": MessageLookupByLibrary.simpleMessage(
      "Колоды загружаются...",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Удалить аккаунт"),
    "deleteAll": MessageLookupByLibrary.simpleMessage("Удалить все"),
    "deleteTheDeckLocally": MessageLookupByLibrary.simpleMessage(
      "Удалить колоду локально",
    ),
    "delete_card_confirmation": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите удалить эту карточку?",
    ),
    "delete_card_question": MessageLookupByLibrary.simpleMessage(
      "Удалить карточку?",
    ),
    "delete_confirmation": MessageLookupByLibrary.simpleMessage(
      "Подтверждение удаления",
    ),
    "delete_deck": MessageLookupByLibrary.simpleMessage("удалить колоду"),
    "deleted_but_failed_to_load_decks": MessageLookupByLibrary.simpleMessage(
      "Колода удалена, но не удалось обновить список колод.",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Описание"),
    "descriptionOptional": MessageLookupByLibrary.simpleMessage(
      "Описание (необязательно)",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Редактировать"),
    "editPassword": MessageLookupByLibrary.simpleMessage("Изменить пароль"),
    "editTheDeck": MessageLookupByLibrary.simpleMessage("Редактировать колоду"),
    "editTheDecks": MessageLookupByLibrary.simpleMessage(
      "Редактирование колод",
    ),
    "editors": MessageLookupByLibrary.simpleMessage("Редакторы"),
    "email": MessageLookupByLibrary.simpleMessage("Электронная почта"),
    "emailIsTaken": MessageLookupByLibrary.simpleMessage(
      "Этот email уже используется.",
    ),
    "emailOrUsername": MessageLookupByLibrary.simpleMessage(
      "Email или имя пользователя",
    ),
    "email_sent_description": MessageLookupByLibrary.simpleMessage(
      "Мы отправили код подтверждения на вашу почту.",
    ),
    "email_verification": MessageLookupByLibrary.simpleMessage(
      "Подтверждение почты",
    ),
    "enterAnswer": MessageLookupByLibrary.simpleMessage("Введите ответ"),
    "enter_code_from_email": MessageLookupByLibrary.simpleMessage(
      "Введите код из письма",
    ),
    "enter_editor_name": MessageLookupByLibrary.simpleMessage(
      "Введите имя редактора",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
    "errorWhileLearningAll": MessageLookupByLibrary.simpleMessage(
      "Ошибка при изучении всех карточек",
    ),
    "errorWhileLearningFamiliar": MessageLookupByLibrary.simpleMessage(
      "Ошибка при изучении знакомых карточек",
    ),
    "errorWhileLearningNew": MessageLookupByLibrary.simpleMessage(
      "Ошибка при изучении новых карточек",
    ),
    "errorWhileLearningWeakest": MessageLookupByLibrary.simpleMessage(
      "Ошибка при изучении слабых карточек",
    ),
    "errorWhileQuickRuning": MessageLookupByLibrary.simpleMessage(
      "Ошибка при быстром запуске",
    ),
    "errorWhileRevisionscreenRunning": MessageLookupByLibrary.simpleMessage(
      "Ошибка при запуске экрана повторения",
    ),
    "errorX": m2,
    "failure_card_created_but_failed_to_load_cards":
        MessageLookupByLibrary.simpleMessage(
          "Карточка создана, но карточки не удалось загрузить.",
        ),
    "failure_card_deleted_but_failed_to_load_cards":
        MessageLookupByLibrary.simpleMessage(
          "Карточка удалена, но обновить список карточек не удалось.",
        ),
    "failure_card_was_deleted_refresh_data":
        MessageLookupByLibrary.simpleMessage(
          "Карточка удалена. Пожалуйста, обновите данные.",
        ),
    "failure_cards_load_failed_due_to_network":
        MessageLookupByLibrary.simpleMessage(
          "Не удалось загрузить карточки. Проверьте соединение.",
        ),
    "failure_cards_load_failed_due_to_unknown_failure":
        MessageLookupByLibrary.simpleMessage(
          "Не удалось загрузить карточки из-за неизвестной ошибки.",
        ),
    "failure_conflict_card_error": MessageLookupByLibrary.simpleMessage(
      "Карточка была изменена другим пользователем. Нажмите сохранить ещё раз, чтобы применить изменения.",
    ),
    "failure_conflict_deck_error": MessageLookupByLibrary.simpleMessage(
      "Колода была изменена другим пользователем.",
    ),
    "failure_deck_created_but_failed_to_load":
        MessageLookupByLibrary.simpleMessage(
          "Колода создана, но не удалось загрузить.",
        ),
    "failure_deck_deleted_but_failed_to_load_decks":
        MessageLookupByLibrary.simpleMessage(
          "Колода удалена, но обновить список колод не удалось.",
        ),
    "failure_deck_permission_denied": MessageLookupByLibrary.simpleMessage(
      "У вас нет прав для этого действия.",
    ),
    "failure_deck_updated_but_failed_get_info":
        MessageLookupByLibrary.simpleMessage(
          "Колода обновлена, но не удалось получить новые данные.",
        ),
    "failure_decks_load_failed_due_to_network":
        MessageLookupByLibrary.simpleMessage(
          "Не удалось загрузить колоды. Проверьте соединение.",
        ),
    "failure_decks_load_failed_due_to_unknown_failure":
        MessageLookupByLibrary.simpleMessage(
          "Не удалось загрузить колоды из-за неизвестной ошибки.",
        ),
    "failure_invalid_card_argument": MessageLookupByLibrary.simpleMessage(
      "Неверные данные карточки.",
    ),
    "failure_network": MessageLookupByLibrary.simpleMessage(
      "Проверьте подключение к интернету.",
    ),
    "failure_server": MessageLookupByLibrary.simpleMessage(
      "Ошибка сервера. Попробуйте позже.",
    ),
    "failure_such_permission_already_exists":
        MessageLookupByLibrary.simpleMessage(
          "Такое разрешение уже существует.",
        ),
    "failure_title_is_empty": MessageLookupByLibrary.simpleMessage(
      "Название не может быть пустым.",
    ),
    "failure_unauthorized": MessageLookupByLibrary.simpleMessage(
      "Доступ запрещён. Пожалуйста, войдите снова.",
    ),
    "failure_unknown": MessageLookupByLibrary.simpleMessage(
      "Произошла неизвестная ошибка.",
    ),
    "failure_user_not_found": MessageLookupByLibrary.simpleMessage(
      "Пользователь не найден.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage("Заполните все поля"),
    "focusOnWeakest": MessageLookupByLibrary.simpleMessage(
      "Сосредоточиться на слабых",
    ),
    "fontSize": MessageLookupByLibrary.simpleMessage("Размер шрифта"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
    "hide": MessageLookupByLibrary.simpleMessage("Скрыть"),
    "incorrectOrExpiredCode": MessageLookupByLibrary.simpleMessage(
      "Неверный или истекщий код",
    ),
    "incorrectPassword": MessageLookupByLibrary.simpleMessage(
      "Неверный пароль",
    ),
    "initialization": MessageLookupByLibrary.simpleMessage("Инициализация"),
    "language": MessageLookupByLibrary.simpleMessage("Язык"),
    "lastReviewedAt": MessageLookupByLibrary.simpleMessage(
      "Последнее повторение",
    ),
    "learingNew": MessageLookupByLibrary.simpleMessage("Изучение новых"),
    "learingWeakest": MessageLookupByLibrary.simpleMessage("Изучение слабых"),
    "learnAllCards": MessageLookupByLibrary.simpleMessage("Учить все карточки"),
    "learnFamiliarCards": MessageLookupByLibrary.simpleMessage(
      "Учить знакомые карточки",
    ),
    "learnNewCards": MessageLookupByLibrary.simpleMessage(
      "Учить новые карточки",
    ),
    "learningAll": MessageLookupByLibrary.simpleMessage("Изучение всех"),
    "learningAllCards": MessageLookupByLibrary.simpleMessage(
      "Изучение всех карточек",
    ),
    "learningFamiliar": MessageLookupByLibrary.simpleMessage(
      "Изучение знакомых",
    ),
    "learningHelpText": MessageLookupByLibrary.simpleMessage(
      "Нажмите на карточку, чтобы показать ответ. Повторное нажатие скроет его.\nСвайп влево — если вы не смогли вспомнить ответ.\nСвайп вправо — если вспомнили его без ошибок.\nТакже вы можете оценить, насколько хорошо и быстро вы вспомнили ответ — по шкале от 1 до 4.\nЭти оценки помогают системе точнее подбирать порядок карточек и делают обучение эффективнее.",
    ),
    "lightMode": MessageLookupByLibrary.simpleMessage("Светлый режим"),
    "loading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
    "loadingData": MessageLookupByLibrary.simpleMessage("Загрузка данных"),
    "logIn": MessageLookupByLibrary.simpleMessage("Войти"),
    "logOut": MessageLookupByLibrary.simpleMessage("Выйти"),
    "loginSuccessful": MessageLookupByLibrary.simpleMessage("Вход выполнен!"),
    "makeDeckPublic": MessageLookupByLibrary.simpleMessage(
      "Сделать колоду публичной",
    ),
    "mode": MessageLookupByLibrary.simpleMessage("Режим"),
    "name": MessageLookupByLibrary.simpleMessage("Имя"),
    "need_authorization": MessageLookupByLibrary.simpleMessage(
      "Требуется авторизация. Пожалуйста, войдите снова.",
    ),
    "need_authorization_to_continue": MessageLookupByLibrary.simpleMessage(
      "Вам нужно войти, чтобы продолжить.",
    ),
    "newPassword": MessageLookupByLibrary.simpleMessage("Новый пароль"),
    "newPasswordSuccessfullySent": MessageLookupByLibrary.simpleMessage(
      "Новый пароль отправлен на вашу почту. Сейчас вы будете автоматически перенаправлены на экран входа.\n",
    ),
    "next": MessageLookupByLibrary.simpleMessage("Вперёд"),
    "nextStep": MessageLookupByLibrary.simpleMessage("Следующий шаг"),
    "noAccount": MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
    "noDate": MessageLookupByLibrary.simpleMessage("Нет даты"),
    "noDecksForLearning": MessageLookupByLibrary.simpleMessage(
      "Нет колод для изучения",
    ),
    "noDecksNGoToEditScreenToAddDeck": MessageLookupByLibrary.simpleMessage(
      "Нет колод\nперейдите в редактор, чтобы добавить колоду",
    ),
    "noSpacedRepetitionCards": MessageLookupByLibrary.simpleMessage(
      "Нет карточек для интервального повторения",
    ),
    "no_cards": MessageLookupByLibrary.simpleMessage(
      "Нет карточек для изучения",
    ),
    "no_cards_for_review_today": MessageLookupByLibrary.simpleMessage(
      "У вас нет карточек для повторения сегодня.",
    ),
    "no_decks_for_daily_tasks": MessageLookupByLibrary.simpleMessage(
      "Нет колод для ежедневных заданий.",
    ),
    "no_editors_yet": MessageLookupByLibrary.simpleMessage(
      "Редакторов пока нет.",
    ),
    "no_familiar_cards": MessageLookupByLibrary.simpleMessage(
      "В этой колоде нет знакомых карточек для изучения.",
    ),
    "no_new_cards": MessageLookupByLibrary.simpleMessage(
      "В этой колоде нет новых карточек.",
    ),
    "numberCards": m3,
    "numberOfCardsX": m4,
    "oldPassword": MessageLookupByLibrary.simpleMessage("Старый пароль"),
    "originalQuestion": MessageLookupByLibrary.simpleMessage("Исходный вопрос"),
    "password": MessageLookupByLibrary.simpleMessage("Пароль"),
    "pleaseEnterTitle": MessageLookupByLibrary.simpleMessage(
      "Введите название",
    ),
    "pleaseFillInBothFields": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, заполните оба поля",
    ),
    "prev": MessageLookupByLibrary.simpleMessage("Назад"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Политика конфиденциальности",
    ),
    "privateDeck": MessageLookupByLibrary.simpleMessage("Приватная колода"),
    "progress": MessageLookupByLibrary.simpleMessage("Прогресс"),
    "publicDeck": MessageLookupByLibrary.simpleMessage("Публичная колода"),
    "question": MessageLookupByLibrary.simpleMessage("Вопрос:"),
    "quickRun": MessageLookupByLibrary.simpleMessage("Быстрый запуск"),
    "recover": MessageLookupByLibrary.simpleMessage("Восстановить"),
    "recoverPassword": MessageLookupByLibrary.simpleMessage(
      "Восстановление пароля",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Обновить"),
    "registeredOn": MessageLookupByLibrary.simpleMessage("Зарегистрирован"),
    "registration": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "registration_successful": MessageLookupByLibrary.simpleMessage(
      "Регистрация успешна!",
    ),
    "resend_code": MessageLookupByLibrary.simpleMessage(
      "Отправить код повторно",
    ),
    "resend_in": MessageLookupByLibrary.simpleMessage("Повторно через"),
    "reviewDatenX": m5,
    "revision": MessageLookupByLibrary.simpleMessage("Повторение"),
    "revisionTasks": MessageLookupByLibrary.simpleMessage(
      "Задания для повторения",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "scheduledReviewDate": MessageLookupByLibrary.simpleMessage(
      "Запланированное повторение",
    ),
    "score": MessageLookupByLibrary.simpleMessage("балл"),
    "search": MessageLookupByLibrary.simpleMessage("Поиск"),
    "searchByAnswer": MessageLookupByLibrary.simpleMessage("Поиск по ответу"),
    "searchDecks": MessageLookupByLibrary.simpleMessage("Поиск колод..."),
    "selectStudyMode": MessageLookupByLibrary.simpleMessage(
      "Выберите режим обучения",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "showAnswerFirst": MessageLookupByLibrary.simpleMessage(
      "Сначала показывать ответ",
    ),
    "showMore": MessageLookupByLibrary.simpleMessage("Показать больше"),
    "showQuestionFirst": MessageLookupByLibrary.simpleMessage(
      "Сначала показывать вопрос",
    ),
    "sign_up": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
    "skip": MessageLookupByLibrary.simpleMessage("пропустить"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Что-то пошло не так",
    ),
    "spacedRevision": MessageLookupByLibrary.simpleMessage(
      "Интервальное повторение",
    ),
    "study": MessageLookupByLibrary.simpleMessage("Учиться"),
    "takeATest": MessageLookupByLibrary.simpleMessage("Пройти тест"),
    "testCompleted": MessageLookupByLibrary.simpleMessage("Тест завершён!"),
    "testingNameofdeck": m6,
    "theme": MessageLookupByLibrary.simpleMessage("Тема"),
    "thisDeckIsEmptyngoToEditingScreenToAddFlashcards":
        MessageLookupByLibrary.simpleMessage(
          "Эта колода пуста,\nперейдите в редактор, чтобы добавить карточки.",
        ),
    "title": MessageLookupByLibrary.simpleMessage("Название"),
    "try_again": MessageLookupByLibrary.simpleMessage("Попробовать снова"),
    "unnamed": MessageLookupByLibrary.simpleMessage("Без названия"),
    "updatePassword": MessageLookupByLibrary.simpleMessage("Изменить пароль"),
    "userName": MessageLookupByLibrary.simpleMessage("Имя пользователя"),
    "userNameIsTaken": MessageLookupByLibrary.simpleMessage(
      "Имя пользователя занято",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Имя пользователя"),
    "verification_code": MessageLookupByLibrary.simpleMessage(
      "Код подтверждения",
    ),
    "view": MessageLookupByLibrary.simpleMessage("Просмотр"),
    "viewingCard": MessageLookupByLibrary.simpleMessage("Просмотр карточки"),
    "welcome": MessageLookupByLibrary.simpleMessage("Добро пожаловать"),
    "welcome_back": MessageLookupByLibrary.simpleMessage("С возвращением"),
    "wrong": MessageLookupByLibrary.simpleMessage("Неверно"),
    "yourAnswer": MessageLookupByLibrary.simpleMessage("Ваш ответ"),
  };
}
