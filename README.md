# LiveStreet CMS: Модифицированная версия

[**LiveStreet CMS**](http://livestreetcms.ru/) - бесплатный блого-социальный движок. Позволяет удобно и быстро создать сообщество с коллективными блогами.

## Описание

Версия **LiveStreet CMS**, модифицированная [KitsuneSolar](https://kitsune.solar/) для своих проектов.

#### Модификации

* Компрессор **JSMin** заменён на **JSqueeze**.
* Компрессор **CSSTidy-1.3** обновлён до **CSSTidy-1.5.5**.
* Библиотека подсветки синтаксиса **Prettify** обновлена до актуальной версии.
* Библиотека **jQuery** и её плагины (_jqModal_, _PoshyTip_) обновлены до актуальных версий (jQuery = **v1.11.3**).
* Добавлены дополнительные правила REGEX для **VideoParser**. [*](http://livestreet.ru/blog/tips_and_tricks/18041.html)
* Введён дополнительный метод, позволяющий вывести количество публикаций каждого пользователя на страницу пользователей. [*](http://livestreetguide.com/faq/kak-vynesti-kolichestvo-publikaciy-kazhdogo-polzovatelya-na-stranicu-polzovateley.html)
* Исправлен и оптимизирован метод _Cut_ модуля **Text**. [*](http://livestreetguide.com/dev/ispravlenie-i-optimizaciya-metoda-cut-modulya-text.html)
* Исправлена ошибка парсера, когда тот исправлял (C), (R) и т.п. внутри тега **CODE**. [*](http://livestreetguide.com/faq/ispravlenie-oshibki-parsera-kogda-tot-ispravlyal-c-r-i-tp-vnutri-tega-code.html)
* Исправлена ошибка переноса, когда тире в конце предложения и перевод строки "сьедался". [*](http://livestreetguide.com/faq/ispravlenie-oshibki-perenosa-kogda-tire-v-konce-predlozheniya-i-perevod-stroki-sedalsya.html)
* Тег VIDEO стал адаптивным (только для bootstrap-based шаблонов). [*](http://livestreet.ru/blog/questions/18013.html)
* Удалена страница перенаправления при выходе пользователя.
* Отключено отображение ошибок PHP, тем самым предотвращено раскрытие путей на сервере. [*](http://livestreetguide.com/livestreet_security/predotvraschenie-raskrytiya-putey-na-servere.html)

## Лицензия

**LiveStreet** - open-source проект под лицензией [GPL-2.0](http://opensource.org/licenses/GPL-2.0).

## Документация

* [English README](Readme.EN.txt)
* [Russian README](Readme.RU.txt)
