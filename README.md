# LiveStreet CMS: Модифицированная версия

[LiveStreet CMS](http://livestreetcms.ru) - бесплатный блого-социальный движок. Позволяет удобно и быстро создать сообщество с коллективными блогами.

## Описание

Версия LiveStreet CMS, модифицированная [KitsuneSolar](https://kitsune.solar/) для своих проектов.

#### Модификации

* Заменён компрессор JS на JShrink. [сноска][1]
* Добавлены дополнительные правила regex для VideoParser. [The Ultimate YouTube regex for VideoParser](http://livestreet.ru/blog/tips_and_tricks/18041.html) от [lifecom](http://livestreet.ru/profile/lifecom/).
* Введён дополнительный метод, позволяющий вывести количество публикаций каждого пользователя на страницу пользователей. [Как вынести количество публикаций каждого пользователя на страницу пользователей](http://livestreetguide.com/faq/kak-vynesti-kolichestvo-publikaciy-kazhdogo-polzovatelya-na-stranicu-polzovateley.html) от [PSNet](http://livestreetguide.com/developer/PSNet/).
* Исправлен и оптимизирован метод Cut модуля Text. [Исправление и оптимизация метода Cut модуля Text](http://livestreetguide.com/dev/ispravlenie-i-optimizaciya-metoda-cut-modulya-text.html) от [PSNet](http://livestreetguide.com/developer/PSNet/).
* Исправлена ошибка парсера, когда тот исправлял (C), (R) и т.п. внутри тега code. [Исправление ошибки парсера, когда тот исправлял (C), (R) и т.п. внутри тега code](http://livestreetguide.com/faq/ispravlenie-oshibki-parsera-kogda-tot-ispravlyal-c-r-i-tp-vnutri-tega-code.html) от [PSNet](http://livestreetguide.com/developer/PSNet/).
* Исправлена ошибка переноса, когда тире в конце предложения и перевод строки "сьедался". [Исправление ошибки переноса, когда тире в конце предложения и перевод строки "сьедался"](http://livestreetguide.com/faq/ispravlenie-oshibki-perenosa-kogda-tire-v-konce-predlozheniya-i-perevod-stroki-sedalsya.html) от [PSNet](http://livestreetguide.com/developer/PSNet/).

## Лицензия

LiveStreet - open-source проект под лицензией [GPL-2.0](http://opensource.org/licenses/GPL-2.0).

## Документация

* [English README](Readme.EN.txt)
* [Russian README](Readme.RU.txt)

----

[1]: [Меняем компрессор js](http://livestreet.ru/blog/tips_and_tricks/18081.html) от [lifecom](http://livestreet.ru/profile/lifecom/).
