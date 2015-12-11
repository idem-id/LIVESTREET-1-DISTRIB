{include file='header.tpl' menu='people'}

<div class="page-header">
  <h1>{$aLang.people}</h1>
</div>

<table class="table table-users">
  <thead>
    <tr>
      <th class="small cell-name">{$aLang.user}</th>
      <th class="hidden-xs small cell-date">{$aLang.user_date_registration}</th>
      <th class="hidden-xs small cell-skill">{$aLang.user_skill}</th>
      <th class="hidden-xs small cell-rating">{$aLang.user_rating}</th>
    </tr>
  </thead>

  <tbody>
    {if $aUsersRegister}
      {foreach from=$aUsersRegister item=oUserList}
        {assign var="oSession" value=$oUserList->getSession()}
        {assign var="oUserNote" value=$oUserList->getUserNote()}
        <tr>
          <td class="cell-name">
            <a href="{$oUserList->getUserWebPath()}"><img src="{$oUserList->getProfileAvatarPath(48)}" alt="{$oUserList->getLogin()}" class="avatar" /></a>
            <div class="name {if !$oUserList->getProfileName()}no-realname{/if}">
              <p class="username">
                <a href="{$oUserList->getUserWebPath()}">{$oUserList->getLogin()}</a>
                {if $oUserNote}
                  <span class="glyphicon glyphicon-comment text-muted js-infobox" title="{$oUserNote->getText()|escape:'html'}"></span>
                {/if}
              </p>
              {if $oUserList->getProfileName()}<p class="text-muted small realname">{$oUserList->getProfileName()}</p>{/if}
            </div>
          </td>
          <td class="hidden-xs text-muted small cell-date">{date_format date=$oUserList->getDateRegister() format="d.m.y, H:i"}</td>
          <td class="hidden-xs text-info small cell-skill">{$oUserList->getSkill()}</td>
          <td class="hidden-xs small cell-rating{if $oUserList->getRating() < 0} text-danger negative{else} text-success{/if}">{$oUserList->getRating()}</td>
        </tr>
      {/foreach}
    {else}
      <tr>
        <td colspan="5">
          {if $sUserListEmpty}
            {$sUserListEmpty}
          {else}
            {$aLang.user_empty}
          {/if}
        </td>
      </tr>
    {/if}
  </tbody>
</table>


{include file='paging.tpl' aPaging=$aPaging}

{include file='footer.tpl'}
