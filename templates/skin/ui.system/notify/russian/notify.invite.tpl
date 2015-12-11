Пользователь <a href="{$oUserFrom->getUserWebPath()}">{$oUserFrom->getLogin()}</a>  пригласил вас зарегистрироваться на сайте <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a><br />
Код приглашения:  <strong>{$oInvite->getCode()}</strong><br />
Для регистрации вам будет необходимо ввести код приглашения на <a href="{router page='login'}">странице входа</a>

<br /><br />
С уважением, администрация сайта <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>
