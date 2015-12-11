Вами отправлен запрос на смену емайл адреса пользователя <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a> на сайте <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>.<br />
Старый емайл: <strong>{$oChangemail->getMailFrom()}</strong><br />
Новый емайл: <strong>{$oChangemail->getMailTo()}</strong><br />


<br />
Для подтверждения смены емайла пройдите по ссылке:
<a href="{router page='profile'}changemail/confirm-to/{$oChangemail->getCodeTo()}/">{router page='profile'}changemail/confirm-to/{$oChangemail->getCodeTo()}/</a>

<br /><br />
С уважением, администрация сайта <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>