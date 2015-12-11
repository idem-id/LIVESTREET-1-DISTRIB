The user <a href="{$oUserComment->getUserWebPath()}">{$oUserComment->getLogin()}</a> left a new comment to topic <strong>«{$oTopic->getTitle()|escape:'html'}»</strong>, you can read it by clicking on <a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}">this link</a><br />
{if $oConfig->GetValue('sys.mail.include_comment')}
  Message: <em>{$oComment->getText()}</em>
{/if}

{if $sSubscribeKey}
  <br /><br />
  <a href="{router page='subscribe'}unsubscribe/{$sSubscribeKey}/">Unsubscribe from new comments to this topic</a>
{/if}

<br /><br />
Best regards, site administration <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>