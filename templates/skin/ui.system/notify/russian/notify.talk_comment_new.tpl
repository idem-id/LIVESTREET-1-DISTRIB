Пользователь <a href="{$oUserFrom->getUserWebPath()}">{$oUserFrom->getLogin()}</a> оставил новый комментарий к письму <strong>«{$oTalk->getTitle()|escape:'html'}»</strong>, прочитать его можно перейдя по <a href="{router page='talk'}read/{$oTalk->getId()}/#comment{$oTalkComment->getId()}">этой ссылке</a><br />
{if $oConfig->GetValue('sys.mail.include_talk')}
  Текст сообщения: <em>{$oTalkComment->getText()}</em><br />
{/if}
Не забудьте предварительно авторизоваться!

<br /><br />
С уважением, администрация сайта <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>