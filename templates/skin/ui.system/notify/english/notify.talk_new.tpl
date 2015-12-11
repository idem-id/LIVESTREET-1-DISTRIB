You have a new incoming letter from the user <a href="{$oUserFrom->getUserWebPath()}">{$oUserFrom->getLogin()}</a>, you can read and answer it by clicking on <a href="{router page='talk'}read/{$oTalk->getId()}/"> this link</a><br />
Letter topic: <strong>{$oTalk->getTitle()|escape:'html'}</strong><br />
{if $oConfig->GetValue('sys.mail.include_talk')}
  Message: <em>{$oTalk->getText()}</em><br />
{/if}
Don't forget to register before!

<br /><br />
Best regards, site administration <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>