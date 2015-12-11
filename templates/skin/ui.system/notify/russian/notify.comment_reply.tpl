Пользователь <a href="{$oUserComment->getUserWebPath()}">{$oUserComment->getLogin()}</a> ответил на ваш комментарий в топике <strong>«{$oTopic->getTitle()|escape:'html'}»</strong>, прочитать его можно перейдя по <a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}">этой ссылке</a><br />
{if $oConfig->GetValue('sys.mail.include_comment')}
  Текст сообщения: <em>{$oComment->getText()}</em>
{/if}
<br /><br />
С уважением, администрация сайта <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>