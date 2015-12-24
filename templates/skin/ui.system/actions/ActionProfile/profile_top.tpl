<!-- breadcrumbs -->
<div itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
  <a href="{cfg name='path.root.web'}" itemprop="url"><meta itemprop="title" content="{cfg name='view.name'}" /></a>
</div>
<div itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
  <a href="{$oUserProfile->getUserWebPath()}" itemprop="url"><meta itemprop="title" content="{$oUserProfile->getLogin()|escape:'html'}" /></a>
</div>
<!-- / breadcrumbs -->

<!-- meta -->
<meta itemprop="image" content="{$oUserProfile->getProfileFotoPath()}" />
<meta itemprop="url" content="{$oUserProfile->getUserWebPath()}" />
<!-- / meta -->

<div class="profile">
  {hook run='profile_top_begin' oUserProfile=$oUserProfile}

  <a href="{$oUserProfile->getUserWebPath()}">
    <img src="{$oUserProfile->getProfileAvatarPath(64)}" alt="{$oUserProfile->getLogin()}" class="avatar" />
  </a>


  {if {cfg name='custom.user.vote'}}
    <div id="vote_area_user_{$oUserProfile->getId()}" class="small pull-right vote {if $oUserProfile->getRating()>=0}vote-count-positive{else}vote-count-negative{/if} {if $oVote} voted {if $oVote->getDirection()>0}voted-up{elseif $oVote->getDirection()<0}voted-down{/if}{/if}">
      <div class="text-muted vote-label">{$aLang.user_rating}</div>
      <a href="#" class="vote-down" onclick="return ls.vote.vote({$oUserProfile->getId()},this,-1,'user');"><span class="glyphicon glyphicon-thumbs-down"></span></a>
      <div id="vote_total_user_{$oUserProfile->getId()}" class="vote-count count" title="{$aLang.user_vote_count}: {$oUserProfile->getCountVote()}">{if $oUserProfile->getRating() > 0}+{/if}{$oUserProfile->getRating()}</div>
      <a href="#" class="vote-up" onclick="return ls.vote.vote({$oUserProfile->getId()},this,1,'user');"><span class="glyphicon glyphicon-thumbs-up"></span></a>
    </div>

    <div class="small pull-right strength">
      <div class="text-muted vote-label">{$aLang.user_skill}</div>
      <div class="text-info count" id="user_skill_{$oUserProfile->getId()}">{$oUserProfile->getSkill()}</div>
    </div>
  {/if}

  <h1 class="user-login word-wrap {if !$oUserProfile->getProfileName()}no-user-name{/if}" itemprop="nickname">{$oUserProfile->getLogin()}</h1>

  {if $oUserProfile->getProfileName()}
    <p class="text-muted user-name" itemprop="name">{$oUserProfile->getProfileName()|escape:'html'}</p>
  {/if}

  {hook run='profile_top_end' oUserProfile=$oUserProfile}
</div>
