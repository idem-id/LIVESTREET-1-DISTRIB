You have sent a request to change user email <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a> on site <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>.<br />
Old email: <strong>{$oChangemail->getMailFrom()}</strong><br />
New email: <strong>{$oChangemail->getMailTo()}</strong><br />


<br />
To confirm the email change, please click here:
<a href="{router page='profile'}changemail/confirm-from/{$oChangemail->getCodeFrom()}/">{router page='profile'}changemail/confirm-from/{$oChangemail->getCodeFrom()}/</a>

<br /><br />
Best regards, site administration <a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>