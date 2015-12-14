<?php

$config = array();

/*---------- THEME ----------*/
$config['view']['theme'] = 'system'; // Выбор темы оформления.

/* Theme Layout */
$config['view']['layout'] = 'full-width'; // Вариант оформления страницы.
/* Возможные значения:
 * - full-width - на всю ширину окна (сама страница, а не основной контент!),
 * - boxed - ограниченная ширина страницы, присутствует фоновое изображение,
 * - boxed-center - фоновое изображение в центральной части страницы.
 */
/* Заменить фоновое изображение на свое можно в папке "images" выбранной темы. */



/*---------- NAVBAR ----------*/
$config['navbar']['view'] = 'inverse'; // Вид навигационной панели.
/* Возможные значения: default, inverse.
 * При переключении между вариантами меняются цвета шапки и подвала.
 */

$config['navbar']['position'] = 'static-top'; // Положение навигационной панели.
/* Возможные значения:
 * - static-top - стандартная,
 * - fixed-top - закрепленная сверху,
 * - fixed-bottom - закрепленная снизу.
 */

$config['navbar']['container']['fluid'] = false; // Растянуть содержимое панели на всю ширину окна?



/*---------- SITE NAME ----------*/
$config['view']['config_sitename'] = true; // Использовать имя сайта прописанное в конфиге сайта?
/* Если выставлено "false", ниже можно задать свое имя. */
$config['view']['own_sitename'] = 'Site Name'; // Свое имя сайта (удобно при необходимости вывода краткого имени).



/*---------- JUMBOTRON ----------*/
$config['view']['jumbotron'] = false; // Выводить большое изображение в шапке?
/* Заменить изображение на свое можно в папке "images" выбранной темы. */



/*---------- META ----------*/
$config['meta']['thumbnail']['img_size'] = '750crop'; // Размер превью для соцсетей (при использовании изображений без кропа пишем просто 750).
/* Если на сайте используется плагин «Main Preview», при расшаривании топиков в соцсети шаблон в качестве
 * изображения для соцсети забирает превью созданную плагином.
 * В данной настройке необходимо указать ширину превью указанную в настройках плагина «Main Preview».
 */
$config['meta']['twitter']['card_type'] = 'summary'; // Тип карточки Twitter.
/* Основные типы:
 * summary - простая карточка;
 * summary_large_image - карточка с большим изображением.
 * Все типы можно посмотреть на странице: https://dev.twitter.com/cards/types
 */


/*---------- TOPIC LIST ----------*/
$config['container']['lg'] = false; // Выводить "основные" страницы со списками топиков (без сайдбара) шире, чем остальные?
/* Данную настройку лучше всего использовать для четырехколоночного вывода сеток. */

$config['masonry']['add'] = false; // Включить скрипт Masonry для шаблона?
/* Значение "true" устанавливается только если ниже выбрана одна из masonry-сеток. */

$config['topic_list']['view'] = 'list'; // Выбор отображения ленты топиков.
/* Возможные значения:
 * ------- Простые списки ------- *
 * - list - стандартный список топиков,
 * - list_lg-preview - стандартный список топиков с большим изображением,
 * - list_sm-preview_1 - стандартный список топиков с небольшим изображением слева,
 * - list_sm-preview_2 - стандартный список топиков с небольшим изображением слева (превью в теле топика),
 * ------- Сетки ------- *
 * - grid_1 - сетка миниатюр в две колонки,
 * - grid_2 - сетка миниатюр в две колонки с первой большой миниатюрой,
 * - grid_3 - сетка миниатюр в две колонки с чередующимися большими и маленькими миниатюрами,
 * - grid_4 - сетка миниатюр в две колонки с первой большой миниатюрой и чередующимися средними и маленькими миниатюрами,
 * - grid_5 - сетка миниатюр в три колонки на основных страницах (без сайдбара) и в две колонки на страницах с сайдбаром
 *            (для данной сетки необходимо отключить вывод сайдбара на "основных" страницах в разделе настроек сайдбара,
 *            кроме того, можно отключить и вывод сайдбара на страницах коллективных блогов),
 * - grid_6 - сетка миниатюр в три колонки с большими и маленькими миниатюрами на основных страницах (без сайдбара) и в две колонки на страницах с сайдбаром
 *            (для данной сетки необходимо отключить вывод сайдбара на "основных" страницах в разделе настроек сайдбара,
 *            кроме того, можно отключить и вывод сайдбара на страницах коллективных блогов),
 * ------- Masonry-сетки ------- *
 * - masonry_1 - masonry-сетка миниатюр в две колонки,
 * - masonry_2 - masonry-сетка миниатюр в две колонки с первой большой миниатюрой,
 * - masonry_3 - masonry-сетка миниатюр в три колонки на основных страницах (без сайдбара) и в две колонки на страницах с сайдбаром
 *               (для данной сетки необходимо отключить вывод сайдбара на "основных" страницах в разделе настроек сайдбара,
 *               кроме того, можно отключить и вывод сайдбара на страницах коллективных блогов),
 * - masonry_4 - masonry-сетка миниатюр в четыре колонки на основных страницах (без сайдбара) и в две колонки на страницах с сайдбаром
 *               (для данной сетки необходимо отключить вывод сайдбара на "основных" страницах в разделе настроек сайдбара,
 *               кроме того, можно отключить и вывод сайдбара на страницах коллективных блогов),
 * - masonry_5 - masonry-сетка миниатюр в четыре колонки с сайдбаром внутри ленты и первой большой миниатюрой
 *               на основных страницах (без сайдбара) и в две колонки на страницах с сайдбаром
 *               (для данной сетки необходимо отключить вывод сайдбара на "основных" страницах в разделе настроек сайдбара
 *               и перенастроить вывод блоков (описано в README.md), кроме того, можно отключить и вывод сайдбара на страницах коллективных блогов),
 * - masonry_6 - masonry-сетка миниатюр в четыре колонки с сайдбаром внутри ленты, первой большой миниатюрой и двумя видами маленьких
 *               на основных страницах (без сайдбара) и в две колонки на страницах с сайдбаром
 *               (для данной сетки необходимо отключить вывод сайдбара на "основных" страницах в разделе настроек сайдбара
 *               и перенастроить вывод блоков (описано в README.md), кроме того, можно отключить и вывод сайдбара на страницах коллективных блогов),
 * - masonry_7 - masonry-сетка миниатюр в четыре колонки с сайдбаром внутри ленты, большими и маленькими миниатюрами
 *               на основных страницах (без сайдбара) и в две колонки на страницах с сайдбаром
 *               (для данной сетки необходимо отключить вывод сайдбара на "основных" страницах в разделе настроек сайдбара
 *               и перенастроить вывод блоков (описано в README.md), кроме того, можно отключить и вывод сайдбара на страницах коллективных блогов),
 */


/*---------- TOPIC LIST SETTINGS ----------*/
$config['masonry_7']['centerbar'] = false; // Выводить центральную зону для блоков на главной странице?
/* Данная настройка касается только ленты masonry_7!
 * Если выставлено "true", то на главной странице (включая интересное, новое, обсуждаемое и топ) появляется
 * центральная зона для вывода блоков. Ее настройка расписана в README.md.
 */



/*----------- TOPIC VIEWS SETTINGS ----------*/
/* lg-preview (используется в ленте list_lg-preview) */
$config['topic']['lg_preview']['img_size'] = '750crop'; // Размер превью для топика с большим изобржением (в соответствии с настройкой плагина «Main Preview»).
/* Рекомендуемый размер изображения для настроек «Main Preview» - 750*300 пикселей. */
$config['topic']['lg_preview']['text_length'] = '300'; // Длина краткого описания для топика с большим изобржением (количество символов).

/* sm-preview_1 (используется в ленте list_sm-preview_1) */
$config['topic']['sm_preview_1']['img_size'] = '750crop'; // Размер превью для топика с небольшим изобржением слева (в соответствии с настройкой плагина «Main Preview»).
/* Рекомендуемый размер изображения для настроек «Main Preview» - 750*750 пикселей. */
$config['topic']['sm_preview_1']['text_length'] = '300'; // Длина краткого описания для топика с небольшим изобржением слева (количество символов).

/* sm-preview_2 (используется в ленте list_sm-preview_2) */
$config['topic']['sm_preview_2']['img_size'] = '750crop'; // Размер превью для топика с небольшим изобржением слева, превью в теле топика (в соответствии с настройкой плагина «Main Preview»).
/* Рекомендуемый размер изображения для настроек «Main Preview» - 750*500 пикселей. */
$config['topic']['sm_preview_2']['text_length'] = '450'; // Длина краткого описания для топика с небольшим изобржением слева, превью в теле топика (количество символов).

/* Thumbnails */
$config['topic']['thumbnail']['img_size'] = '750crop'; // Размер превью стандартной миниатюры (в соответствии с настройкой плагина «Main Preview»).
$config['topic']['thumbnail']['text_length'] = '200'; // Длина краткого описания топика для миниатюры (количество символов).
/* используется в лентах: grid_1,2,3,4,5,6 и masonry_1,2,3,4,5,6,7*/

$config['topic']['thumbnail_lg']['img_size'] = '750crop'; // Размер превью большой миниатюры (в соответствии с настройкой плагина «Main Preview»).
$config['topic']['thumbnail_lg']['text_length'] = '200'; // Длина краткого описания топика для миниатюры (количество символов).
/* используется в лентах: grid_2,4,6 и masonry_2,5,6*/

$config['topic']['thumbnail_sm']['img_size'] = '750crop'; // Размер превью маленькой миниатюры (в соответствии с настройкой плагина «Main Preview»).
$config['topic']['thumbnail_sm']['text_length'] = '250'; // Длина краткого описания топика для маленькой миниатюры (количество символов).
/* используется в лентах: grid_3,4,5,6 и masonry_4,5,6*/

$config['topic']['thumbnail_sq']['img_size'] = '750crop'; // Размер превью маленькой квадратной миниатюры (в соответствии с настройкой плагина «Main Preview»).
$config['topic']['thumbnail_sq']['text_length'] = '100'; // Длина краткого описания топика для маленькой миниатюры (количество символов).
/* используется в ленте: masonry_7 */

$config['topic']['thumbnail_xs']['img_size'] = '64crop'; // Размер превью мини-миниатюры (в соответствии с настройкой плагина «Main Preview»).
/* используется в лентах: masonry_6, masonry_7*/


/*---------- SIDEBAR ----------*/
/* Внимание! Данные настройки следует изменять только при использовании определенных типов лент топиков!
 * Для каких лент стоит изменять данные настройки указано в описании лент.
 * В случае изменения данных настроек и применения лент не предназначенных для вывода без сайдбара возможно некоректное отображение информации.
 */
$config['sidebar']['main_pages'] = true; // Выводить сайдбар на "основных" страницах сайта?
/* Если выставлено "false", то сайдбар не выводится на:
 * - главной странице (включая интересное, новое, обсуждаемое и топ),
 * - страницах со списками топиков из коллективных и персональных блогов.
 */
$config['sidebar']['blog_pages'] = true; // Выводить сайдбар на страницах блогов?
/* Если выставлено "false", то сайдбар не выводится на страницах коллективных блогов. */






/*-------------------------------------------------------------------------------------------------------------------*/

$config['head']['default']['js'] = Config::Get('head.default.js');
$config['head']['default']['js'][] = '___path.static.skin___/js/template.js';

/* Bootstrap */
$config['head']['default']['js'][] = '___path.static.skin___/themes/___view.theme___/bootstrap/js/bootstrap.min.js';


$config['head']['default']['css'] = array(
  /* Bootstrap */
  "___path.static.skin___/themes/___view.theme___/bootstrap/css/bootstrap.min.css",

  /* Structure */
  "___path.static.skin___/css/base.css",
  "___path.root.engine_lib___/external/jquery/markitup/skins/synio/style.css",
  "___path.root.engine_lib___/external/jquery/markitup/sets/synio/style.css",
  "___path.root.engine_lib___/external/jquery/jcrop/jquery.Jcrop.css",
  "___path.root.engine_lib___/external/prettify/prettify.css",
  "___path.static.skin___/css/smoothness/jquery-ui.css",
  "___path.static.skin___/css/responsive.css",

  /* Theme */
  "___path.static.skin___/themes/___view.theme___/style.css",

  /* Custom Theme */
  "//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" => array('merge'=>false),
  "___path.static.skin___/themes/___view.theme___/theme.css" => array('merge'=>false),
);

/* CR */
$config['custom']['cr'] = 'TW9kaWZpY2F0aW9uIGJ5IDxhIGhyZWY9Ii8va2l0c3VuZS5zb2xhciI+S2l0c3VuZSBTb2xhcjwvYT4=';
$config['custom']['cr'] = base64_decode($config['custom']['cr']);

include_once('config.custom.php');


return $config;
