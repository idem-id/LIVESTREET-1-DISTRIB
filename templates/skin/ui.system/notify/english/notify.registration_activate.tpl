You have been registered on the site <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a><br />
Your credentials:<br />
&nbsp;&nbsp;&nbsp;login: <strong>{$oUser->getLogin()}</strong><br />
&nbsp;&nbsp;&nbsp;password: <strong>{$sPassword}</strong><br />
<br />
To complete registration you need to activate your account by clicking this link:
<a href="{router page='registration'}activate/{$oUser->getActivateKey()}/">{router page='registration'}activate/{$oUser->getActivateKey()}/</a>

<br /><br />
Best regards, site administration <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>