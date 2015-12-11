Пользователь <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a> ответил на ваше сообщение на <a href="{$oUserWall->getUserWebPath()}wall/">стене</a><br />

Ваше сообщение: <em>{$oWallParent->getText()}</em><br /><br />
Текст ответа: <em>{$oWall->getText()}</em>

<br /><br />
С уважением, администрация сайта <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>