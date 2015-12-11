{if !{cfg name='custom.user.vote'}}
  {assign var="align" value='text-right'}
{else}
  {assign var="align" value=''}
{/if}

<table class="table table-users">
  {if $bUsersUseOrder}
    <thead>
      <tr>
        <th class="small cell-name"><a href="{$sUsersRootPage}?order=user_login&amp;order_way={if $sUsersOrder=='user_login'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_login'}class="{$sUsersOrderWay}"{/if}><span>{$aLang.user}</span></a></th>
        <th class="hidden-xs small cell-date {$align}">{$aLang.user_date_last}</th>

        {if {cfg name='custom.user.vote'}}
          <th class="hidden-xs small cell-skill"><a href="{$sUsersRootPage}?order=user_skill&amp;order_way={if $sUsersOrder=='user_skill'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_skill'}class="{$sUsersOrderWay}"{/if}><span>{$aLang.user_skill}</span></a></th>
          <th class="hidden-xs small cell-rating"><a href="{$sUsersRootPage}?order=user_rating&amp;order_way={if $sUsersOrder=='user_rating'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_rating'}class="{$sUsersOrderWay}"{/if}><span>{$aLang.user_rating}</span></a></th>
        {/if}
      </tr>
    </thead>
  {else}
    <thead>
      <tr>
        <th class="small cell-name">{$aLang.user}</th>
        <th class="hidden-xs small cell-date {$align}">{$aLang.user_date_last}</th>

        {if {cfg name='custom.user.vote'}}
          <th class="hidden-xs small cell-skill">{$aLang.user_skill}</th>
          <th class="hidden-xs small cell-rating">{$aLang.user_rating}</th>
        {/if}
      </tr>
    </thead>
  {/if}

  <tbody>
    {if $aUsersList}
      {foreach from=$aUsersList item=oUserList}
        {assign var="oSession" value=$oUserList->getSession()}
        {assign var="oUserNote" value=$oUserList->getUserNote()}
        <tr>
          <td class="cell-name">
            <a href="{$oUserList->getUserWebPath()}"><img src="{$oUserList->getProfileAvatarPath(48)}" alt="{$oUserList->getLogin()}" class="avatar visible-lg" /></a>
            <div class="name {if !$oUserList->getProfileName()}no-realname{/if}">
              <p class="username">
                <a href="{$oUserList->getUserWebPath()}">{$oUserList->getLogin()}</a>
                {if $oUserNote}
                  <span class="glyphicon glyphicon-comment text-muted js-infobox" title="{$oUserNote->getText()|escape:'html'}"></span>
                {/if}
              </p>
              {if $oUserList->getProfileName()}<p class="small text-muted realname">{$oUserList->getProfileName()}</p>{/if}
            </div>
          </td>
          <td class="hidden-xs small text-muted cell-date {$align}">
            {if $oSession}
              {date_format date=$oSession->getDateLast() hours_back="12" minutes_back="60" now="60" day="day H:i" format="d.m.y, H:i"}
            {/if}
          </td>

          {if {cfg name='custom.user.vote'}}
            <td class="hidden-xs small text-info cell-skill">{$oUserList->getSkill()}</td>
            <td class="hidden-xs small cell-rating{if $oUserList->getRating() < 0} text-danger negative{else} text-success{/if}">{$oUserList->getRating()}</td>
          {/if}
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
