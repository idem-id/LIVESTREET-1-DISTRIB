Вам пришло новое письмо от пользователя <a href="{$oUserFrom->getUserWebPath()}">{$oUserFrom->getLogin()}</a>, прочитать и ответить на него можно перейдя по <a href="{router page='talk'}read/{$oTalk->getId()}/">этой ссылке</a><br />
Тема письма: <strong>{$oTalk->getTitle()|escape:'html'}</strong><br />
{if $oConfig->GetValue('sys.mail.include_talk')}
  Текст сообщения: <em>{$oTalk->getText()}</em><br />
{/if}
Не забудьте предварительно авторизоваться!

<br /><br />
С уважением, администрация сайта <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>